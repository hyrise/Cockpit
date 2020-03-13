"""Module for generating workloads.

Includes the main WorkloadGenerator.
"""

from typing import Any, Callable, Dict, Optional, Tuple

from apscheduler.schedulers.background import BackgroundScheduler
from zmq import PUB, Context

from hyrisecockpit.exception import (
    EmptyWorkloadFolderException,
    NotExistingConfigFileException,
    NotExistingWorkloadFolderException,
    QueryTypeNotFoundException,
    QueryTypesNotSpecifiedException,
)
from hyrisecockpit.message import start_workload_request_schema
from hyrisecockpit.response import Response, get_error_response, get_response
from hyrisecockpit.server import Server
from hyrisecockpit.workload_generator.workloads.workload import Workload


class WorkloadGenerator(object):
    """Object responsible for generating workload."""

    def __init__(
        self,
        generator_listening: str,
        generator_port: str,
        workload_listening: str,
        workload_pub_port: str,
        default_workload_location: str,
    ) -> None:
        """Initialize a WorkloadGenerator."""
        self._workload_listening = workload_listening
        self._workload_pub_port = workload_pub_port
        self._default_workload_location = default_workload_location
        server_calls: Dict[
            str, Tuple[Callable[[Dict[str, Any]], Response], Optional[Dict]]
        ] = {
            "start workload": (
                self._call_start_workload,
                start_workload_request_schema,
            ),
            "stop workload": (self._call_stop_workload, None),
        }
        self._server = Server(generator_listening, generator_port, server_calls)

        self._generate_workload_flag = False
        self._frequency = 0
        self._workloads: Dict[str, Any] = {}
        self._init_server()
        self._init_scheduler()

    def _init_scheduler(self):
        self._scheduler = BackgroundScheduler()
        self._generate_workload_job = self._scheduler.add_job(
            func=self._generate_workload, trigger="interval", seconds=1,
        )
        self._scheduler.start()

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Call close with a context manager."""
        self.close()

    def _init_server(self) -> None:
        self._context = Context(io_threads=1)
        self._pub_socket = self._context.socket(PUB)
        self._pub_socket.bind(
            "tcp://{:s}:{:s}".format(self._workload_listening, self._workload_pub_port)
        )

    def _get_default_workload_location(self):
        return self._default_workload_location

    def _get_workload(self, workload_type: str):
        workload = self._workloads.get(workload_type)
        if not workload:
            workload = Workload(workload_type, self._get_default_workload_location())
            self._workloads[workload_type] = workload
        return workload

    def _call_start_workload(self, body: Dict) -> Response:
        frequency: int = body["frequency"]
        workload_type: str = body["folder_name"]
        try:
            self._get_workload(workload_type)
        except (
            NotExistingWorkloadFolderException,
            EmptyWorkloadFolderException,
            QueryTypeNotFoundException,
            QueryTypesNotSpecifiedException,
            NotExistingConfigFileException,
        ) as e:
            return get_error_response(400, str(e))

        self._workload_type = workload_type
        self._frequency = frequency
        self._generate_workload_flag = True

        return get_response(200)

    def _call_stop_workload(self, body: Dict) -> Response:
        self._generate_workload_flag = False
        return get_response(200)

    def _publish_data(self, data: Dict):
        self._pub_socket.send_json(data)

    def _generate_workload(self):
        if self._generate_workload_flag:
            workload = self._get_workload(self._workload_type)
            queries = workload.generate_workload(self._frequency)
            response = get_response(200)
            response["body"] = {"querylist": queries}
            self._publish_data(response)

    def start(self) -> None:
        """Start the generator by starting the server."""
        self._server.start()

    def close(self) -> None:
        """Close the socket and context."""
        self._generate_workload_job.remove()
        self._scheduler.shutdown()
        self._pub_socket.close()
        self._context.term()

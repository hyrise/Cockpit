"""Module for generating workloads.

Includes the main WorkloadGenerator.
"""

from random import shuffle
from types import TracebackType
from typing import Callable, Dict, Optional, Tuple, Type

from apscheduler.schedulers.background import BackgroundScheduler
from zmq import PUB, Context

from hyrisecockpit.api.app.workload.interface import DetailedWorkloadInterface
from hyrisecockpit.request import Body
from hyrisecockpit.response import Response, get_response
from hyrisecockpit.server import Server

from .reader import WorkloadReader
from .tpcc_workload import TPCCWorkload
from .workload import Workload


class WorkloadGenerator(object):
    """Object responsible for generating workload."""

    def __init__(
        self,
        generator_listening: str,
        generator_port: str,
        workload_listening: str,
        workload_pub_port: str,
    ) -> None:
        """Initialize a WorkloadGenerator."""
        self._workload_listening = workload_listening
        self._workload_pub_port = workload_pub_port
        server_calls: Dict[str, Tuple[Callable[[Body], Response], Optional[Dict]]] = {
            "get all workloads": (self._call_get_all_workloads, None),
            "start workload": (self._call_start_workload, None,),
            "get workload": (self._call_get_workload, None),
            "stop workload": (self._call_stop_workload, None),
            "update workload": (self._call_update_workload, None),
        }
        self._server = Server(generator_listening, generator_port, server_calls)

        self._workloads: Dict[str, Workload] = {}
        self._init_server()
        self._init_scheduler()

    def _init_scheduler(self) -> None:
        self._scheduler = BackgroundScheduler()
        self._generate_workload_job = self._scheduler.add_job(
            func=self._generate_workload, trigger="interval", seconds=1,
        )
        self._scheduler.start()

    def __enter__(self) -> "WorkloadGenerator":
        """Return self for a context manager."""
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self.close()
        return None

    def _init_server(self) -> None:
        self._context = Context(io_threads=1)
        self._pub_socket = self._context.socket(PUB)
        self._pub_socket.bind(
            "tcp://{:s}:{:s}".format(self._workload_listening, self._workload_pub_port)
        )

    def _call_get_all_workloads(self, body: Body) -> Response:
        response = get_response(200)
        response["body"]["workloads"] = [
            {"folder_name": folder_name, "frequency": workload.frequency}
            for folder_name, workload in self._workloads.items()
        ]
        return response

    def _call_start_workload(self, body: Body) -> Response:
        folder_name: str = body["folder_name"]
        frequency: int = body["frequency"]
        if folder_name not in self._workloads:
            if folder_name.startswith("tpcc"):
                self._workloads[folder_name] = TPCCWorkload(folder_name, frequency)  # type: ignore
                response = get_response(200)
                response["body"]["workload"] = {
                    "folder_name": folder_name,
                    "frequency": self._workloads[folder_name].frequency,
                }
            else:
                queries = WorkloadReader.get(folder_name)
                if queries is not None:
                    self._workloads[folder_name] = Workload(
                        folder_name, frequency, queries
                    )
                    response = get_response(200)
                    response["body"]["workload"] = {
                        "folder_name": folder_name,
                        "frequency": self._workloads[folder_name].frequency,
                    }
                else:
                    return get_response(404)
        else:
            response = get_response(409)
        return response

    def _call_get_workload(self, body: Body) -> Response:
        folder_name: str = body["folder_name"]
        try:
            workload = self._workloads[folder_name]
        except KeyError:
            response = get_response(404)
        else:
            response = get_response(200)
            response["body"]["workload"] = {
                "folder_name": folder_name,
                "frequency": workload.frequency,
                "weights": workload.weights,
            }
        return response

    def _call_stop_workload(self, body: Body) -> Response:
        folder_name: str = body["folder_name"]
        try:
            self._workloads.pop(folder_name)
        except KeyError:
            response = get_response(404)
        else:
            response = get_response(200)
            response["body"]["folder_name"] = folder_name
        return response

    def _call_update_workload(self, body: Body) -> Response:
        folder_name: str = body["folder_name"]
        new_workload: DetailedWorkloadInterface = body["workload"]
        try:
            workload = self._workloads[folder_name]
        except KeyError:
            response = get_response(404)
        else:
            workload.update(new_workload)
            response = get_response(200)
            response["body"]["workload"] = DetailedWorkloadInterface(
                folder_name=folder_name,
                frequency=workload.frequency,
                weights=workload.weights,
            )
        return response

    def _generate_workload(self) -> None:
        queries = [
            query for workload in self._workloads.values() for query in workload.get()
        ]
        shuffle(queries)
        response = get_response(200)
        response["body"]["querylist"] = queries
        self._pub_socket.send_json(response)

    def start(self) -> None:
        """Start the generator by starting the server."""
        self._server.start()

    def close(self) -> None:
        """Close the socket and context."""
        self._generate_workload_job.remove()
        self._scheduler.shutdown()
        self._pub_socket.close()
        self._context.term()

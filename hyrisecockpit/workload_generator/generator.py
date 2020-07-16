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

from .workloads import Tpch


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

        self._workloads: Dict = {"tpch": Tpch()}  # type: ignore
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
            {"workload": workload, "frequency": properties.frequency}
            for workload, properties in self._workloads.items()
        ]
        return response

    def _call_start_workload(self, body: Body) -> Response:
        workload_name: str = body["workload"]
        scale_factor = body["scale_factor"]
        frequency: int = body["frequency"]
        if workload_name not in self._workloads:
            return get_response(404)
        if scale_factor in self._workloads[workload_name].scale_factores:
            return get_response(400)
        if scale_factor in self._workloads[workload_name].driver.scale_factors:
            return get_response(400)
        self._workloads[workload_name].scale_factores.append(scale_factor)
        self._workloads[workload_name].frequency = frequency
        response = get_response(200)
        response["body"]["workload"] = {
            "workload": workload_name,
            "frequency": self._workloads[workload_name].frequency,
            "scale_factor": self._workloads[workload_name].scale_factores,
        }
        return response

    def _call_get_workload(self, body: Body) -> Response:
        workload_name: str = body["workload"]
        workload = self._workloads.get(workload_name)
        if workload is None:
            return get_response(404)
        response = get_response(200)
        response["body"]["workload"] = {
            "folder_name": workload,
            "frequency": self._workloads[workload].frequency,
            "weights": self._workloads[workload].weights,
            "scale_factor": self._workloads[workload].scale_factores,
        }
        return response

    def _call_stop_workload(self, body: Body) -> Response:
        workload_name: str = body["workload"]
        scale_factor = body["scale_factor"]
        workload = self._workloads.get(workload_name)
        if workload is None:
            return get_response(404)
        if scale_factor not in workload.scale_factores:
            return get_response(400)
        workload.scale_factores.remove(scale_factor)
        response = get_response(200)
        response["body"]["workload"] = workload
        response["body"]["scale_factor"] = workload
        return response

    def _call_update_workload(self, body: Body) -> Response:
        workload_name: str = body["workload"]
        new_workload: DetailedWorkloadInterface = body["workload"]
        workload = self._workloads.get(workload_name)
        if workload is None:
            return get_response(404)
        workload.update(new_workload)
        response = get_response(200)
        response["body"]["workload"] = DetailedWorkloadInterface(
            folder_name=workload_name,
            frequency=workload.frequency,
            weights=workload.weights,
        )
        return response

    def _generate_workload(self) -> None:
        queries = []
        for workload in self._workloads.values():
            for scale_factore in workload.scale_factores:
                queries.append(
                    workload.driver.generate(
                        scale_factore, workload.frequency, workload.weights
                    )
                )
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

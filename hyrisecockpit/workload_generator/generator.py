"""Module for generating workloads.

Includes the main WorkloadGenerator.
"""

from random import shuffle
from types import TracebackType
from typing import Callable, Dict, Optional, Tuple, Type

from apscheduler.schedulers.background import BackgroundScheduler
from zmq import PUB, Context

from hyrisecockpit.drivers.tpch.tpch_driver import TpchDriver
from hyrisecockpit.request import Body
from hyrisecockpit.response import Response, get_response
from hyrisecockpit.server import Server

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

        self._workloads: Dict = {"tpch": Workload(TpchDriver())}  # type: ignore
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
            {
                "workload_type": workload,
                "frequency": properties.frequency,
                "scale_factor": properties.scale_factor,
            }
            for workload, properties in self._workloads.items()
            if properties.running
        ]
        return response

    def _call_start_workload(self, body: Body) -> Response:
        workload_type: str = body["workload_type"]
        frequency: int = body["frequency"]
        scale_factor: float = body["scale_factor"]
        if workload_type not in list(self._workloads.keys()):
            return get_response(404)
        if scale_factor not in self._workloads[workload_type].driver.scale_factors:
            return get_response(400)
        self._workloads[workload_type].scale_factor = scale_factor
        self._workloads[workload_type].frequency = frequency
        self._workloads[workload_type].running = True
        response = get_response(200)
        response["body"]["workload"] = {
            "workload_type": workload_type,
            "frequency": self._workloads[workload_type].frequency,
            "scale_factor": self._workloads[workload_type].scale_factor,
        }
        return response

    def _call_get_workload(self, body: Body) -> Response:
        workload_type: str = body["workload_type"]
        workload = self._workloads.get(workload_type)
        if workload is None:
            return get_response(404)
        response = get_response(200)
        response["body"]["workload"] = {
            "workload_type": workload_type,
            "frequency": self._workloads[workload_type].frequency,
            "scale_factor": self._workloads[workload_type].scale_factor,
            "weights": self._workloads[workload_type].weights,
            "running": self._workloads[workload_type].running,
        }
        return response

    def _call_stop_workload(self, body: Body) -> Response:
        workload_type: str = body["workload_type"]
        workload = self._workloads.get(workload_type)
        if workload is None:
            return get_response(404)
        workload.running = False
        workload.resert()
        response = get_response(200)
        response["body"]["workload"] = workload_type
        return response

    def _call_update_workload(self, body: Body) -> Response:
        workload_type: str = body["workload_type"]
        frequency: int = body["frequency"]
        scale_factor: float = body["scale_factor"]
        weights = body["weights"]
        workload = self._workloads.get(workload_type)
        if workload is None:
            return get_response(404)
        workload.update(scale_factor=scale_factor, frequency=frequency, weights=weights)
        response = get_response(200)
        response["body"]["workload"] = {
            "workload_type": workload_type,
            "frequency": self._workloads[workload_type].frequency,
            "scale_factor": self._workloads[workload_type].scale_factor,
            "weights": self._workloads[workload_type].weights,
            "running": self._workloads[workload_type].running,
        }
        return response

    def _get_workload_queries(self):
        queries = []
        for workload in self._workloads.values():
            if workload.running:
                queries += workload.driver.generate(
                    workload.scale_factor, workload.frequency, workload.weights
                )

        shuffle(queries)
        return queries

    def _generate_workload(self) -> None:
        response = get_response(200)
        response["body"]["querylist"] = self._get_workload_queries()  # type: ignore
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

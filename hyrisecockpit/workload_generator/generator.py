"""Module for generating workloads.

Includes the main WorkloadGenerator.
"""
import sys
from typing import Any, Callable, Dict, List, Tuple

from zmq import PUB, REP, Context

from hyrisecockpit.response import get_response

from .workloads.mixed import generate_mixed
from .workloads.noops import generate_noops
from .workloads.tpch import generate_tpch


class WorkloadGenerator(object):
    """Object responsible for generating workload."""

    def __init__(
        self,
        generator_host: str,
        generator_port: str,
        workload_sub_host: str,
        workload_pubsub_port: str,
    ) -> None:
        """Initialize a WorkloadGenerator."""
        self._generator_host = generator_host
        self._generator_port = generator_port
        self._workload_sub_host = workload_sub_host
        self._workload_pubsub_port = workload_pubsub_port
        self._server_calls: Dict[str, Callable[[Dict[str, Any]], Dict[str, Any]]] = {
            "workload": self._call_workload,
            "shutdown": self._call_shutdown,
        }
        self._workload_generators: Dict[str, Callable[[int], List[Tuple[str, Any]]]] = {
            "no-ops": generate_noops,
            "mixed": generate_mixed,
            "tpch": generate_tpch,
        }
        self._shutdown_requested: bool = False
        self._init_server()

    def _init_server(self) -> None:
        self._context = Context(io_threads=1)
        self._rep_socket = self._context.socket(REP)
        self._rep_socket.bind(
            "tcp://{:s}:{:s}".format(self._generator_host, self._generator_port)
        )
        self._pub_socket = self._context.socket(PUB)
        self._pub_socket.bind(
            "tcp://{:s}:{:s}".format(
                self._workload_sub_host, self._workload_pubsub_port
            )
        )

    def _call_shutdown(self, body: Dict) -> Dict:
        self._shutdown_requested = True
        return get_response(200)

    def _call_workload(self, body: Dict) -> Dict:
        generator = self._workload_generators.get(body["type"], None)
        if not generator:
            return get_response(400)

        queries = generator(body["factor"])

        response = get_response(200)
        response["body"] = {"querylist": queries}
        self._pub_socket.send_json(response)
        return get_response(200)

    def _call_not_found(self, body: Dict) -> Dict:
        return get_response(400)

    def close(self) -> None:
        """Close the socket and context."""
        self._rep_socket.close()
        self._pub_socket.close()
        self._context.term()

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Call close with a context manager."""
        self.close()

    def start(self) -> None:
        """Run the generator by enabling IPC."""
        print(
            "Workload generator running on {:s}:{:s}. Press CTRL+C to quit.".format(
                self._generator_host, self._generator_port
            )
        )
        while True:
            try:
                # Get the message
                request = self._rep_socket.recv_json()

                # Handle the call
                response = self._server_calls.get(
                    request["header"]["message"], self._call_not_found
                )(request["body"])

                # Send the reply
                self._rep_socket.send_json(response)

                # Shutdown
                if self._shutdown_requested:
                    break
            except KeyboardInterrupt:
                sys.exit()

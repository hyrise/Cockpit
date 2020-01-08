"""Module for generating workloads.

Includes the main WorkloadGenerator.
"""

import sys
from typing import Any, Callable, Dict, List, Tuple

from zmq import PUB, REP, Context

from hyrisecockpit.response import get_error_response, get_response

from .workloads.mixed import generate_mixed
from .workloads.noops import generate_noops
from .workloads.tpch import generate_tpch


class WorkloadGenerator(object):
    """Object responsible for generating workload."""

    def __init__(
        self,
        generator_host: str,
        generator_port: str,
        workload_pub_host: str,
        workload_pub_port: str,
    ) -> None:
        """Initialize a WorkloadGenerator."""
        self._generator_host = generator_host
        self._generator_port = generator_port
        self._workload_pub_host = workload_pub_host
        self._workload_pub_port = workload_pub_port
        self._server_calls: Dict[str, Callable[[Dict[str, Any]], Dict[str, Any]]] = {
            "workload": self._call_workload,
        }
        self._workload_generators: Dict[str, Callable[[int], List[Tuple[str, Any]]]] = {
            "no-ops": generate_noops,
            "mixed": generate_mixed,
            "tpch": generate_tpch,
        }
        self._init_server()

    def _init_server(self) -> None:
        self._context = Context(io_threads=1)
        self._rep_socket = self._context.socket(REP)
        self._pub_socket = self._context.socket(PUB)
        self._rep_socket.bind(
            "tcp://{:s}:{:s}".format(self._generator_host, self._generator_port)
        )
        self._pub_socket.bind(
            "tcp://{:s}:{:s}".format(self._workload_pub_host, self._workload_pub_port)
        )

    def _call_workload(self, body: Dict) -> Dict:
        generator = self._workload_generators.get(body["type"], None)
        if not generator:
            return get_error_response(400, "Workload type not found")
        try:
            queries = generator(body["factor"])
            response = get_response(200)
            response["body"] = {"querylist": queries}
            self._publish_data(response)
        except Exception as e:
            return get_error_response(400, str(e))

        return get_response(200)

    def _publish_data(self, data: Dict):
        self._pub_socket.send_json(data)

    def close(self) -> None:
        """Close the socket and context."""
        self._rep_socket.close()
        self._pub_socket.close()
        self._context.term()
        sys.exit()

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Call close with a context manager."""
        self.close()

    def _handle_request(self, request):
        try:
            handler = self._server_calls.get(request["header"]["message"], None)
            if not handler:
                print(request)
                return get_response(400)
            response = handler(request["body"])
            return response
        except Exception as e:
            return get_error_response(400, str(e))

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
                response = self._handle_request(request)

                # Send the reply
                self._rep_socket.send_json(response)

            except KeyboardInterrupt:
                self.close()

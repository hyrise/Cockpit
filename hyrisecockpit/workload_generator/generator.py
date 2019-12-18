"""Module for generating workloads.

Includes the main WorkloadGenerator, which uses multiple WorkloadProducers.
The WorkloadGenerator manages the WorkloadProducers.
"""
from typing import Any, Callable, Dict, List

from zmq import REP, Context

from hyrisecockpit.response import get_response

from .producer import WorkloadProducer


class WorkloadGenerator(object):
    """A manager for multiple WorkloadProducers.

    Producers may be added or popped sequentially, or set to a specific number.
    The WorkloadGenerator may be started or stopped.
    """

    def __init__(
        self,
        generator_host: str,
        generator_port: str,
        workload_sub_host: str,
        workload_pubsub_port: str,
    ) -> None:
        """Initialize a WorkloadGenerator with an empty list of WorkloadProducers."""
        self._generator_host = generator_host
        self._generator_port = generator_port
        self._workload_sub_host = workload_sub_host
        self._workload_pubsub_port = workload_pubsub_port
        self._server_calls: Dict[str, Callable[[Dict[str, Any]], Dict[str, Any]]] = {
            "start": self._call_start,
            "stop": self._call_stop,
            "shutdown": self._call_shutdown,
        }
        self._producers: List[WorkloadProducer] = []
        self._shutdown_requested: bool = False
        self._init_server()

    def _init_server(self) -> None:
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(REP)
        self._socket.bind(
            "tcp://{:s}:{:s}".format(self._generator_host, self._generator_port)
        )

    def close(self) -> None:
        """Close the socket and context."""
        self._socket.close()
        self._context.term()

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Call close with a context manager."""
        self.close()

    def _add_producer(self) -> None:
        """Increase the number of WorkloadProducers by one."""
        p = WorkloadProducer(
            f"WorkloadProducer {len(self._producers)}",
            self._workload_sub_host,
            self._workload_pubsub_port,
        )
        self._producers.append(p)
        p.start()

    def _pop_producer(self) -> None:
        """Decrease the number of WorkloadProducers by one."""
        if self._producers:
            p = self._producers.pop()
            p.terminate()
            p.join()

    def _set_producers(self, number: int) -> int:
        """Set the number of WorkloadProducers."""
        delta = number - len(self._producers)
        if delta < 0:
            f = self._add_producer
        elif delta > 0:
            f = self._pop_producer
        [f() for _ in range(delta)]
        return self._get_producers()

    def _get_producers(self) -> int:
        """Return the number of WorkloadProducers."""
        return len(self._producers)

    def _call_start(self, body: Dict) -> Dict:
        """Start generating workloads with n_producers."""
        n_producers = body["n_producers"]
        for _ in range(n_producers):
            self._add_producer()
        return get_response(200)

    def _call_stop(self, body: Dict) -> Dict:
        """Stop generating workloads and kill all WorkloadProducers."""
        for _ in range(len(self._producers)):
            self._pop_producer()
        return get_response(200)

    def _call_shutdown(self, body: Dict) -> Dict:
        self._shutdown_requested = True
        return get_response(200)

    def _call_not_found(self, body: Dict) -> Dict:
        return get_response(400)

    def start(self) -> None:
        """Run the generator by enabling IPC."""
        print(
            "Workload generator running on {:s}:{:s}. Press CTRL+C to quit.".format(
                self._generator_host, self._generator_port
            )
        )
        while True:
            # Get the message
            request = self._socket.recv_json()

            # Handle the call
            response = self._server_calls.get(
                request["header"]["message"], self._call_not_found
            )(request["body"])

            # Send the reply
            self._socket.send_json(response)

            # Shutdown
            if self._shutdown_requested:
                break

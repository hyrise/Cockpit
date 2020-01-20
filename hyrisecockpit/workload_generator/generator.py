"""Module for generating workloads.

Includes the main WorkloadGenerator.
"""

from random import shuffle
from typing import Any, Callable, Dict, List, Tuple

from zmq import PUB, REP, Context

from hyrisecockpit.exception import (
    EmptyWorkloadFolderException,
    NotExistingWorkloadFolderException,
    QueryTypeNotFoundException,
)
from hyrisecockpit.response import get_error_response, get_response
from hyrisecockpit.workload_generator.workloads.workload import Workload


class WorkloadGenerator(object):
    """Object responsible for generating workload."""

    def __init__(
        self,
        generator_host: str,
        generator_port: str,
        workload_pub_host: str,
        workload_pub_port: str,
        default_workload_location: str,
    ) -> None:
        """Initialize a WorkloadGenerator."""
        self._generator_host = generator_host
        self._generator_port = generator_port
        self._workload_pub_host = workload_pub_host
        self._workload_pub_port = workload_pub_port
        self._default_workload_location = default_workload_location
        self._server_calls: Dict[str, Callable[[Dict[str, Any]], Dict[str, Any]]] = {
            "workload": self._call_workload,
        }
        self._workloads: Dict[str, Any] = {}
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

    def _get_default_workload_location(self):
        return self._default_workload_location

    def _get_workload(self, workload_type: str):
        workload = self._workloads.get(workload_type)
        if not workload:
            workload = Workload(workload_type, self._get_default_workload_location())
            self._workloads[workload_type] = workload
        return workload

    def _call_workload(self, body: Dict) -> Dict:
        try:
            if body["type"] == "custom":
                queries = self._generate_custom_workload(
                    body["queries"], body.get("factor", 1), body.get("shuffle", False)
                )
            else:
                workload = self._get_workload(body["type"])
                queries = workload.generate_workload(
                    body.get("factor", 1), body.get("shuffle", False)
                )
            response = get_response(200)
            response["body"] = {"querylist": queries}
            self._publish_data(response)
        except (
            NotExistingWorkloadFolderException,
            EmptyWorkloadFolderException,
            QueryTypeNotFoundException,
        ) as e:
            return get_error_response(400, str(e))

        return get_response(200)

    def _generate_custom_workload(
        self, data_sheet: Dict, factor: int, shuffle_flag: bool
    ):
        workload_queries: List[Tuple[str, Any]] = []
        for _ in range(factor):
            for data in data_sheet.keys():
                workload_type = data.split("/")[0]
                query = data.split("/")[1]
                factor = data_sheet[data]
                workload = self._get_workload(workload_type)
                workload_queries.extend(workload.generate_specific(query, factor))

        if shuffle_flag:
            shuffle(workload_queries)

        return workload_queries

    def _publish_data(self, data: Dict):
        self._pub_socket.send_json(data)

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

    def _handle_request(self, request):
        handler = self._server_calls.get(request["header"]["message"], None)
        if not handler:
            return get_response(400)
        response = handler(request["body"])
        return response

    def start(self) -> None:
        """Run the generator by enabling IPC."""
        print(
            "Workload generator running on {:s}:{:s}. Press CTRL+C to quit.".format(
                self._generator_host, self._generator_port
            )
        )
        while True:
            # Get the message
            request = self._rep_socket.recv_json()

            # Handle the call
            response = self._handle_request(request)

            # Send the reply
            self._rep_socket.send_json(response)

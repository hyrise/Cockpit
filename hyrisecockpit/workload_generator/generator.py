"""Module for generating workloads.

Includes the main WorkloadGenerator.
"""

from copy import deepcopy
from random import shuffle
from typing import Any, Callable, Dict, List, Set, Tuple

from zmq import PUB, REP, Context

from hyrisecockpit.exception import (
    EmptyWorkloadFolderException,
    NotExistingConfigFileException,
    NotExistingWorkloadFolderException,
    QueryTypeNotFoundException,
    QueryTypesNotSpecifiedException,
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
        self._workload_specification: Dict[str, Any] = {}
        self._server_calls: Dict[str, Callable[[Dict[str, Any]], Dict[str, Any]]] = {
            "workload": self._call_workload,
            "register workload": self._call_register_workload,
            "generate registered workload": self._call_generate_registered_workload,
        }
        self._workloads: Dict[str, Any] = {}
        self._init_server()

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Call close with a context manager."""
        self.close()

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
            factor = body.get("factor", 1)
            shuffle_flag = body.get("shuffle", False)
            workload_type = body["type"]
            if workload_type == "custom":
                if not body.get("queries"):
                    raise QueryTypesNotSpecifiedException(
                        "Missing query types for custom workload"
                    )
                queries = self._generate_custom_workload(
                    body["queries"], factor, shuffle_flag
                )
            else:
                workload = self._get_workload(workload_type)
                queries = workload.generate_workload(factor, shuffle_flag)
            response = get_response(200)
            response["body"] = {"querylist": queries}
            self._publish_data(response)
        except (
            NotExistingWorkloadFolderException,
            EmptyWorkloadFolderException,
            QueryTypeNotFoundException,
            QueryTypesNotSpecifiedException,
            NotExistingConfigFileException,
        ) as e:
            return get_error_response(400, str(e))

        return get_response(200)

    def _call_register_workload(self, body: Dict):
        workload_type = body.get("type")
        required_tables: Set = set()
        if not workload_type:
            return get_error_response(400, "workload type not provided")
        try:
            if workload_type == "custom":
                query_types = body.get("queries")
                if not query_types:
                    return get_error_response(
                        400, "Missing query types for custom workload"
                    )
                for query_type in query_types.keys():
                    workload = self._get_workload(query_type.split("/")[0])
                    workload.generate_specific(query_type.split("/")[1])
                    required_tables.update(workload.get_required_tables())
            else:
                workload = self._get_workload(workload_type)
                required_tables.update(workload.get_required_tables())
        except (
            NotExistingWorkloadFolderException,
            EmptyWorkloadFolderException,
            QueryTypeNotFoundException,
            QueryTypesNotSpecifiedException,
            NotExistingConfigFileException,
        ) as e:
            return get_error_response(400, str(e))
        self._workload_specification = body
        response = get_response(200)
        response["body"]["required_tables"] = list(required_tables)
        return response

    def _call_generate_registered_workload(self, body: Dict):
        if self._workload_specification == {}:
            return get_error_response(400, "Workload not registered")
        workload_specification = deepcopy(self._workload_specification)
        factor = body.get("factor")
        if factor:
            workload_specification["factor"] = factor
        return self._call_workload(workload_specification)

    def _generate_custom_workload(
        self, query_types: Dict, factor: int, shuffle_flag: bool
    ):
        workload_queries: List[Tuple[str, Any]] = []
        for _ in range(factor):
            for query_type in query_types.keys():
                workload_type = query_type.split("/")[0]
                query = query_type.split("/")[1]
                factor = query_types[query_type]
                workload = self._get_workload(workload_type)
                workload_queries.extend(workload.generate_specific(query, factor))
        if shuffle_flag:
            shuffle(workload_queries)
        return workload_queries

    def _publish_data(self, data: Dict):
        self._pub_socket.send_json(data)

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

    def close(self) -> None:
        """Close the socket and context."""
        self._rep_socket.close()
        self._pub_socket.close()
        self._context.term()

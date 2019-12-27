"""Module for generating workloads.

Includes the main WorkloadGenerator, which uses multiple WorkloadProducers.
The WorkloadGenerator manages the WorkloadProducers.
"""
import random
import secrets
from typing import Any, Callable, Dict, List, Tuple

from zmq import PUB, REP, Context

from hyrisecockpit.response import get_response


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
            "no-ops": self._generate_noops,
            "mixed": self._generate_mixed,
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
        queries = self._workload_generators.get(body["type"], self._generate_empty)(
            body["factor"]
        )

        if queries == []:
            return get_response(400)

        response = get_response(200)
        response["body"] = {"querylist": queries}
        self._pub_socket.send_json(response)
        return get_response(200)

    def _generate_noops(self, factor: int) -> List:
        queries = []
        for _ in range(factor):
            queries.append(("SELECT 1;", None))
        return queries

    def _generate_mixed(self, factor: int) -> List:
        simple_query = """SELECT * FROM nation WHERE n_nationkey = (%s);"""
        queries = random.choices(
            [
                (
                    """SELECT
                l_returnflag,
                l_linestatus,
                SUM(l_quantity) as sum_qty,
                SUM(l_extendedprice) as sum_base_price,
                SUM(l_extendedprice*(1.0-l_discount)) as sum_disc_price,
                SUM(l_extendedprice*(1.0-l_discount)*(1.0+l_tax)) as sum_charge,
                AVG(l_quantity) as avg_qty, AVG(l_extendedprice) as avg_price,
                AVG(l_discount) as avg_disc, COUNT(*) as count_order
                FROM lineitem
                WHERE l_shipdate <= '1998-12-01'
                GROUP BY l_returnflag, l_linestatus
                ORDER BY l_returnflag, l_linestatus;""",
                    None,
                ),
                (
                    """SELECT
                sum(l_extendedprice*l_discount) AS REVENUE
                FROM lineitem
                WHERE l_shipdate >= '1994-01-01'
                    AND l_shipdate < '1995-01-01'
                    AND l_discount BETWEEN .05
                    AND .07 AND l_quantity < 24.0;""",
                    None,
                ),
                (simple_query, (secrets.randbelow(24),)),
            ],
            weights=[1, 1, 100],
            k=factor,
        )

        return queries

    def _generate_empty(self, factor: int) -> List:
        return []

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

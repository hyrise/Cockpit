"""Module for generating workloads.

WorkloadProducers have IPC connections to a database interface.
They are managed by a WorkloadGenerator.
"""
from multiprocessing import Process
from random import choices, randint
from typing import List, Optional, Tuple

from zmq import PUB, Context


class WorkloadProducer(Process):
    """A process responsible for generating and submitting workloads.

    Workload generating logic is internal.
    Workloads are submitted directly to a database interface with IPC.
    """

    def __init__(
        self, name: str, workload_sub_host: str, workload_pubsub_port: str
    ) -> None:
        """Initialize a WorkloadProducer with an IPC connection."""
        self._workload_sub_host = workload_sub_host
        self._workload_pubsub_port = workload_pubsub_port
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(PUB)
        self._socket.bind(
            "tcp://{:s}:{:s}".format(
                self._workload_sub_host, self._workload_pubsub_port
            )
        )
        super().__init__(name=name, daemon=True)

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def close(self) -> None:
        """Close the socket and context."""
        self._socket.close()
        self._context.term()

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Call close with a context manager."""
        self.close()

    def _generate_random(self) -> Tuple[str, Tuple[int]]:
        """Return a simple query with a random number."""
        return (
            """SELECT *
        FROM nation
        WHERE n_nationkey = ?;""",
            (randint(0, 24),),  # nosec
        )

    def _generate_execute(self) -> List[Tuple[str, Optional[Tuple[int]]]]:
        """Return a list of queries forming a workload."""
        return choices(
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
                AND .07 AND l_quantity < 24;""",
                    None,
                ),
                self._generate_random(),
            ],
            weights=[1, 1, 100],
            k=1,
        )

    def start(self) -> None:
        """Generate workloads and submit it with IPC."""
        while True:
            # TODO add shutdown
            request = {"header": {"status": 200, "message": "executelist"}}
            queries = [("SELECT 1;", None) for _ in range(10)]
            request["body"] = {"querylist": queries}
            self._socket.send_json(request)

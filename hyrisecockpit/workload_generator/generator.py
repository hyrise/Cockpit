"""Module for generating workloads.

Includes the main WorkloadGenerator, which uses multiple WorkloadProducers.
The WorkloadGenerator manages the WorkloadProducers.
The WorkloadProducers have IPC connections to a database interface.
"""
import multiprocessing as mp
import random
from typing import Any, Callable, Dict, List, Optional, Tuple

from zmq import PUB, REP, Context

from hyrisecockpit import settings as s
from hyrisecockpit.response import get_response


class WorkloadProducer(mp.Process):
    """A process responsible for generating and submitting workloads.

    Workload generating logic is internal.
    Workloads are submitted directly to a database interface with IPC.
    """

    def __init__(self, name: str) -> None:
        """Initialize a WorkloadProducer with an IPC connection."""
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(PUB)
        self._socket.bind(
            "tcp://{:s}:{:s}".format(s.WORKLOAD_SUB_HOST, s.WORKLOAD_PUBSUB_PORT)
        )
        super().__init__(name=name, daemon=True)

    def _generate_random(self) -> Tuple[str, Tuple[int]]:
        """Return a simple query with a random number."""
        return (
            """SELECT *
        FROM nation
        WHERE n_nationkey = ?;""",
            (random.randint(0, 24),),  # nosec
        )

    def _generate_execute(self) -> List[Tuple[str, Optional[Tuple[int]]]]:
        """Return a list of queries forming a workload."""
        return random.choices(
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


class WorkloadGenerator(object):
    """A manager for multiple WorkloadProducers.

    Producers may be added or popped sequentially, or set to a specific number.
    The WorkloadGenerator may be started or stopped.
    """

    def __init__(self) -> None:
        """Initialize a WorkloadGenerator with an empty list of WorkloadProducers."""
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
        self._socket.bind("tcp://{:s}:{:s}".format(s.GENERATOR_HOST, s.GENERATOR_PORT))

    def _add_producer(self) -> None:
        """Increase the number of WorkloadProducers by one."""
        p = WorkloadProducer(f"WorkloadProducer {len(self._producers)}")
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
                s.GENERATOR_HOST, s.GENERATOR_PORT
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

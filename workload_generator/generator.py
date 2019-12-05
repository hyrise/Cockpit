"""Module for generating workloads.

Includes the main WorkloadGenerator, which uses multiple WorkloadProducers.
The WorkloadGenerator manages the WorkloadProducers.
The WorkloadProducers have IPC connections to a database interface.
"""

import multiprocessing as mp
import random

from zmq import REP, REQ, Context

import settings as s


class WorkloadProducer(mp.Process):
    """A process responsible for generating and submitting workloads.

    Workload generating logic is internal.
    Workloads are submitted directly to a database interface with IPC.
    """

    def __init__(self, name):
        """Initialize a WorkloadProducer with an IPC connection."""
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(REQ)
        self._socket.connect(f"tcp://{s.DB_MANAGER_HOST}:{s.DB_MANAGER_PORT}")
        super().__init__(name=name, daemon=True)

    def _generate_random(self):
        """Return a simple query with a random number."""
        return (
            """SELECT *
        FROM nation
        WHERE n_nationkey = ?;""",
            (random.randint(0, 24),),  # nosec
        )

    def _generate_execute(self):
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

    def start(self):
        """Generate workloads and submit it with IPC."""
        while True:
            # TODO add shutdown event
            request = {"header": {"status": 200, "message": "execute"}}
            # query, vars = self._generate_execute()[0]
            # request["body"] = {"query": query, "vars": vars}
            request["body"] = {"query": "SELECT 1;", "vars": None}
            self._socket.send_json(request)
            self._socket.recv_json()  # We do not care about the reply


class WorkloadGenerator(object):
    """A manager for multiple WorkloadProducers.

    Producers may be added or popped sequentially, or set to a specific number.
    The WorkloadGenerator may be started or stopped.
    """

    def __init__(self):
        """Initialize a WorkloadGenerator with an empty list of WorkloadProducers."""
        self._producers = []
        self._shutdown_requested = False
        self._init_server()
        self._start()
        self._run()

    def _init_server(self):
        self._context = Context(io_threads=1)
        self._socket = self._context.socket(REP)
        self._socket.bind("tcp://{:s}:{:4d}".format(s.GENERATOR_HOST, s.GENERATOR_PORT))

    def _start(self, n_producers=1):  # Startup with 1 producer by default
        """Start generating workloads with n_producers."""
        n_producers = 0 if n_producers <= 0 else n_producers
        [self._add_producer() for i in range(n_producers)]
        return len(self._producers)

    def _stop(self):
        """Stop generating workloads and kill all WorkloadProducers."""
        [self._pop_producer() for i in range(len(self._producers))]

    def _add_producer(self):
        """Increase the number of WorkloadProducers by one."""
        p = WorkloadProducer(f"WorkloadProducer {len(self._producers)}")
        self._producers.append(p)
        p.start()

    def _pop_producer(self):
        """Decrease the number of WorkloadProducers by one."""
        if self._producers:
            p = self._producers.pop()
            p.terminate()
            p.join()

    def _set_producers(self, number):
        """Set the number of WorkloadProducers."""
        delta = number - len(self._producers)
        if delta < 0:
            f = self._add_producer
        elif delta > 0:
            f = self._pop_producer
        else:
            return
        [f() for _ in range(delta)]
        return self._get_producers()

    def _get_producers(self):
        """Return the number of WorkloadProducers."""
        return len(self._producers)

    def _handle_request(self, request):
        call = request["header"]["message"]
        body = request["body"]

        result = False

        if call == "start":
            result = self._start(body["n_producers"])

        if call == "stop":
            result = self._stop()

        if call == "shutdown":
            self._shutdown_requested = True
            result = True

        return result

    def _run(self):
        """Run the generator by enabling IPC."""
        print(
            "Workload generator running on {:s}:{:4d}. Press CTRL+C to quit.".format(
                s.GENERATOR_HOST, s.GENERATOR_PORT
            )
        )
        while True:
            # Get the message
            request = self._socket.recv_json()

            # TODO add server functionality as found in database manager

            # Send the reply
            self._socket.send_json(
                request
            )  # TODO send a response instead of the request

            # Shutdown
            if self._shutdown_requested:
                self._stop()
                break


def main():
    """Run a WorkloadGenerator."""
    WorkloadGenerator()


if __name__ == "__main__":
    main()

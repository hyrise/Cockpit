"""Module for generating workloads.

Includes the main WorkloadGenerator, which uses multiple WorkloadProducers.
The WorkloadGenerator manages the WorkloadProducers.
The WorkloadProducers have IPC connections to a database interface.
"""
import json
import multiprocessing as mp
import random
from time import sleep

import zmq
from psycopg2 import mogrify


class WorkloadProducer(mp.Process):
    """A process responsible for generating and submitting workloads.

    Workload generating logic is internal.
    Workloads are submitted directly to a database interface with IPC.
    """

    def __init__(self, name):
        """Initialize a WorkloadProducer with an IPC connection."""
        self.context = zmq.Context()
        self.socket = self.context.socket(zmq.REQ)
        self.socket.connect("tcp://localhost:5555")
        super().__init__(name=name, daemon=True)

    def generate_workload(self, n_queries=1):
        """Return a list of queries forming a workload."""
        return random.choices(
            [
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
                """SELECT
            sum(l_extendedprice*l_discount) AS REVENUE
            FROM lineitem
            WHERE l_shipdate >= '1994-01-01'
                AND l_shipdate < '1995-01-01'
                AND l_discount BETWEEN .05
                AND .07 AND l_quantity < 24;""",
                mogrify(
                    "SELECT * FROM nation WHERE n_nationkey = %s",
                    random.randint(0, 24),  # nosec
                ),
            ],
            weights=[1, 1, 100],
            k=n_queries,
        )

    def run(self):
        """Generate a workload and submit it with IPC."""
        workload = self.generate_workload()
        data = {}
        data["Content-Type"] = "Workload"
        data["Content"] = workload
        request = json.dumps(data)
        self.socket.send_string(request)


class WorkloadGenerator(object):
    """A manager for multiple WorkloadProducers.

    Producers may be added or popped sequentially, or set to a specific number.
    The WorkloadGenerator may be started or stopped.
    """

    def __init__(self):
        """Initialize a WorkloadGenerator with an empty list of WorkloadProducers."""
        self.producers = []

    def start(self, n_producers=1):
        """Start generating workloads with n_producers."""
        [self.add_producer() for i in range(n_producers)]

    def stop(self):
        """Stop generating workloads and kill all WorkloadProducers."""
        [self.pop_producer() for i in range(len(self.producers))]

    def add_producer(self):
        """Increase the number of WorkloadProducers by one."""
        p = WorkloadProducer(f"WorkloadProducer {len(self.producers)}")
        self.producers.append(p)
        p.start()

    def pop_producer(self):
        """Decrease the number of WorkloadProducers by one."""
        if self.producers:
            p = self.producers.pop()
            p.terminate()
            p.join()

    def set_producers(self, number):
        """Set the number of WorkloadProducers."""
        delta = number - len(self.producers)
        if delta < 0:
            f = self.add_producer
        elif delta > 0:
            f = self.pop_producer
        else:
            return
        [f() for _ in range(delta)]
        return self.get_producers()

    def get_producers(self):
        """Return the number of WorkloadProducers."""
        return len(self.producers)


def main():
    """Run a WorkloadGenerator demonstration."""
    gen = WorkloadGenerator()
    gen.start(1)
    sleep(5)
    gen.stop()


if __name__ == "__main__":
    main()

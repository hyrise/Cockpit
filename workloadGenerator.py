import json
import multiprocessing as mp
import random
from time import sleep

import zmq
from psycopg2 import mogrify


class WorkloadProducer(mp.Process):
    def __init__(self, name):
        super().__init__(name=name, daemon=True)
        self.context = zmq.Context()
        self.socket = self.context.socket(zmq.REQ)
        self.socket.connect("tcp://localhost:5555")

    def generate_workload(self, n_queries=1):
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
        workload = self.generate_workload()
        data = {}
        data["Content-Type"] = "Workload"
        data["Content"] = workload
        request = json.dumps(data)
        self.socket.send_string(request)
        # workload = self.generate_workload()
        # TODO send an IPC message to the Hyrise Interface with the workload
        # e.g. "ipc-call 'executeRawQuery' workload"
        pass


class WorkloadGenerator(object):
    def __init__(self):
        self.producers = []

    def start(self, producers=1):
        [self.add_producer() for i in range(producers)]

    def stop(self):
        [self.pop_producer() for i in range(len(self.producers))]

    def add_producer(self):
        p = WorkloadProducer(f"WorkloadProducer {len(self.producers)}")
        self.producers.append(p)
        p.start()

    def pop_producer(self):
        if self.producers:
            p = self.producers.pop()
            p.terminate()
            p.join()

    def set_producers(self, number):
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
        return len(self.producers)


def main():
    gen = WorkloadGenerator()
    gen.start(1)
    sleep(5)
    gen.stop()


if __name__ == "__main__":
    main()

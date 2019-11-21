import multiprocessing as mp
import random
from time import sleep


class WorkloadProducer(mp.Process):
    def __init__(self, name):
        super().__init__(name=name, daemon=True)

    def generate_workload(self, n_queries=1):
        return random.choices(
            [
                "SELECT l_returnflag, l_linestatus, SUM(l_quantity) as sum_qty, SUM(l_extendedprice) as sum_base_price, SUM(l_extendedprice*(1.0-l_discount)) as sum_disc_price, SUM(l_extendedprice*(1.0-l_discount)*(1.0+l_tax)) as sum_charge, AVG(l_quantity) as avg_qty, AVG(l_extendedprice) as avg_price, AVG(l_discount) as avg_disc, COUNT(*) as count_order FROM lineitem WHERE l_shipdate <= '1998-12-01' GROUP BY l_returnflag, l_linestatus ORDER BY l_returnflag, l_linestatus;",
                "SELECT sum(l_extendedprice*l_discount) AS REVENUE FROM lineitem WHERE l_shipdate >= '1994-01-01' AND l_shipdate < '1995-01-01' AND l_discount BETWEEN .05 AND .07 AND l_quantity < 24;",
                f"SELECT * FROM nation WHERE n_nationkey = {random.randint(0, 24)};",
            ],
            weights=[1, 1, 100],
            k=n_queries,
        )

    def run(self):
        # workload = self.generate_workload()
        # TODO send an IPC message to the Hyrise Interface with the workload
        # e.g. "ipc-call 'executeRawQuery' workload"
        pass


class WorkloadGenerator(object):
    def __init__(self):
        self.producers = []

    def start(self, producers=1):
        [self.addProducer() for i in range(producers)]

    def stop(self):
        [self.popProducer() for i in range(len(self.producers))]

    def addProducer(self):
        p = WorkloadProducer(f"WorkloadProducer {len(self.producers)}")
        self.producers.append(p)
        p.start()

    def popProducer(self):
        if self.producers:
            p = self.producers.pop()
            p.terminate()
            p.join()

    def setProducers(self, number):
        delta = number - len(self.producers)
        if delta < 0:
            f = self.addProducer
        elif delta > 0:
            f = self.popProducer
        else:
            return
        [f() for _ in range(delta)]
        return self.getProducers()

    def getProducers(self):
        return len(self.producers)


def main():
    gen = WorkloadGenerator()
    gen.start(1)
    sleep(5)
    gen.stop()


if __name__ == "__main__":
    main()

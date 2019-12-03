"""The database object represents the instanz of a database."""

import os
from multiprocessing import Manager, Pool

NUMBER_WORKER = 3


class DbObject(object):
    """Representation of database instance."""

    def __init__(self, init_driver):
        """Initialize the database object."""
        self.driver = init_driver
        self.throughput_container = Manager.dict()
        self.pool = Pool(NUMBER_WORKER)
        self.throughput = 0

    def task_workload(self, workload, throughput_container):
        """Execute workload on database."""
        throughput_container[str(os.getpid())] = (0, True)
        for query in workload:
            self.driver.execute(query)
            throughput_container[os.getpid()][0] = (
                throughput_container[os.getpid()][0] + 1
            )
        throughput_container[str(os.getpid())][1] = False

    def task_query(self, query, throughput_container):
        """Execute single query on database."""
        throughput_container[str(os.getpid())] = (0, True)
        self.driver.execute(query)
        throughput_container[str(os.getpid())] = (1, False)

    def execute_workload(self, workload):
        """Put workload task in pool."""
        self.pool.apply_async(
            self.task_workload, (workload, self.throughput_container,)
        )

    def execute_query(self, query):
        """Put query task in pool."""
        self.pool.apply_async(self.task_query, (query, self.throughput_container,))

    def get_storage_data(self):
        """Get the storage data of the database."""
        return self.driver.get_storage_data

    def update_throughput(self):
        """Update throughput of database."""
        sum = 0
        for key, threadRuns in self.throughput_container.iteritems():
            sum = sum + threadRuns[0]
            if not threadRuns[1]:
                del self.throughput_container[key]
        for threadRuns in range(self.throughput_container.values()):
            threadRuns[0] = 0
        self.throughput = sum

    def get_throughput(self):
        """Get throughput of database."""
        return self.throughput

"""The database object represents the instanz of a database."""

import os
from multiprocessing import Manager, Pool

NUMBER_WORKER = 3


class DbObject(object):
    """Representation of database instance."""

    def __init__(self, init_driver):
        """Initialize the database object."""
        self.driver = init_driver
        self.throughput_dict = Manager.dict()
        self.pool = Pool(NUMBER_WORKER)

    def task_workload(self, workload, throughput_dict):
        """Execute workload on database."""
        throughput_dict[str(os.getpid())] = (0, True)
        for query in workload:
            self.driver.execute(query)
            throughput_dict[os.getpid()][0] = throughput_dict[os.getpid()][0] + 1
        throughput_dict[str(os.getpid())][1] = False

    def task_query(self, query, throughput_dict):
        """Execute single query on database."""
        throughput_dict[str(os.getpid())] = (0, True)
        self.driver.execute(query)
        throughput_dict[str(os.getpid())] = (1, False)

    def execute_workload(self, workload):
        """Put workload task in pool."""
        self.pool.apply_async(self.task_workload, (workload, self.throughput_dict,))

    def execute_query(self, query):
        """Put query task in pool."""
        self.pool.apply_async(self.task_query, (query, self.throughput_dict,))

    def get_storage_data(self):
        """Get the storage data of the database."""
        return self.driver.get_storage_data

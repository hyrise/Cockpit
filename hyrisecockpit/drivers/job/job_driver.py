"""JOB driver."""
from collections import OrderedDict
from os import getcwd
from os.path import abspath
from typing import Dict, List, Tuple

from hyrisecockpit.drivers.__default__.driver import DefaultDriver
from hyrisecockpit.drivers.__default__.task_types import DefaultTask
from hyrisecockpit.drivers.job.job_meta_information import default_weights, tables


class JobDriver:
    """job driver."""

    def __init__(self):
        """Initialize a job driver."""
        # TODO Move queries to driver folder
        self._query_path: str = f"{abspath(getcwd())}/workload_generator/workloads"
        self._benchmark_type: str = "job"
        self._table_names: List[str] = tables
        self.scale_factors = [1.0]
        self._scale_factor_query_path = {1.0: "job_1"}
        self._default_driver: DefaultDriver = DefaultDriver(
            self._query_path,
            self._scale_factor_query_path,
            self._benchmark_type,
            self._table_names,
        )

    def get_default_weights(self):
        """Get default weights."""
        return OrderedDict(default_weights)  # TODO why OrderedDict

    def generate(self, scalefactor, frequency, weights) -> List[DefaultTask]:
        """Generate job tasks."""
        return self._default_driver.generate(scalefactor, frequency, weights)

    def get_table_names(self, scalefactor):
        """Return table name and representation in database."""
        return self._default_driver.get_table_names(scalefactor)

    def get_load_queries(self, scalefactor) -> Dict[str, Tuple]:
        """Generate load tables queries."""
        return self._default_driver.get_load_queries(scalefactor)

    def get_delete_queries(self, scalefactor) -> Dict[str, Tuple]:
        """Generate delete table queries."""
        return self._default_driver.get_delete_queries(scalefactor)

    def execute_task(self, task, cursor, worker_id) -> Tuple[int, int, float, str]:
        """Generate execute task queries."""
        return self._default_driver.execute_task(task, cursor, worker_id)

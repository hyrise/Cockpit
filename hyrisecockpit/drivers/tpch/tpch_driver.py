"""Tpch driver."""
from os import getcwd
from os.path import abspath
from typing import Dict, List, Tuple

from hyrisecockpit.drivers.default import DefaultDriver, DefaultTask


class TpchDriver:
    """Tpch driver."""

    def __init__(self):
        """Initialize a tpch driver."""
        self._query_path: str = f"{abspath(getcwd())}/drivers/tpch"
        self._benchmark_type: str = "tpch"
        self._table_names: List[str] = [
            "customer",
            "lineitem",
            "nation",
            "orders",
            "part",
            "partsupp",
            "region",
            "supplier",
        ]
        self.scale_factors = [0.1, 1]
        self._scale_factor_query_path = {0.1: "tpch_0_1", 1: "tpch_1"}
        self._default_driver: DefaultDriver = DefaultDriver(
            self._query_path,
            self._scale_factor_query_path,
            self._benchmark_type,
            self._table_names,
        )

    def generate(self, scalefactor, frequency, weights) -> List[DefaultTask]:
        """Generate tpch tasks."""
        return self._default_driver.generate(scalefactor, frequency, weights)

    def get_load_queries(self, scalefactor) -> Dict[str, Tuple]:
        """Generate load tables queries."""
        return self._default_driver.get_load_queries(scalefactor)

    def get_delete_queries(self, scalefactor) -> Dict[str, Tuple]:
        """Generate delete table queries."""
        return self._default_driver.get_delete_queries(scalefactor)

    def execute_task(self, task, cursor, worker_id) -> Tuple[int, int, str, str]:
        """Generate execute task queries."""
        return self._default_driver.execute_task(task, cursor, worker_id)

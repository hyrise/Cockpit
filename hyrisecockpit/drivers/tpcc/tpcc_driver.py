"""TPC-C driver."""
from os import getcwd
from os.path import abspath
from typing import Dict, List, Tuple

from hyrisecockpit.drivers.__default__.driver import DefaultDriver
from hyrisecockpit.drivers.__default__.task_types import DefaultTask
from hyrisecockpit.drivers.tpcc.parameter_generator import TPCCParameterGenerator


class TpccDriver:
    """Tpch driver."""

    def __init__(self):
        """Initialize a tpch driver."""
        # TODO Move queries to driver folder
        self._query_path: str = f"{abspath(getcwd())}/workload_generator/workloads"
        self._benchmark_type: str = "tpcc"
        self._table_names: List[str] = [
            "WAREHOUSE",
            "DISTRICT",
            "CUSTOMER",
            "HISTORY",
            "NEW_ORDER",
            "ORDER",
            "ORDER_LINE",
            "ITEM",
            "STOCK",
        ]
        self.scale_factors = [5.0]
        self._scale_factor_query_path = {5.0: "tpcc_1"}

        self._default_driver: DefaultDriver = DefaultDriver(  # TODO: remove
            self._query_path,
            self._scale_factor_query_path,
            self._benchmark_type,
            self._table_names,
        )

    def get_default_weights(self):
        """Get default weights."""
        return {
            "stock_level": 0.04,
            "delivery": 0.04,
            "order_status": 0.04,
            "payment": 0.43,
            "new_order": 0.45,
        }

    def generate(self, scalefactor, frequency, weights) -> List[DefaultTask]:
        """Generate tpch tasks."""
        tasks = TPCCParameterGenerator(scalefactor).generate_transactions(
            frequency, weights
        )
        return tasks

    def get_table_names(self, scalefactor):
        """Return table name and representation in database."""
        return {table_name: table_name for table_name in self._table_names}

    def get_load_queries(self, scalefactor) -> Dict[str, Tuple]:
        """Generate load tables queries."""
        formatted_scalefactor = str(int(scalefactor))
        return {
            table: (
                """COPY "%s" FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';""",
                (
                    (table, "as_is"),
                    (self._benchmark_type, "as_is"),
                    (formatted_scalefactor, "as_is"),
                    (table.lower(), "as_is"),
                ),
            )
            for table in self._table_names
        }

    def get_delete_queries(self, scalefactor) -> Dict[str, Tuple]:
        """Generate delete table queries."""
        return {
            table: ("""DROP TABLE "%s";""", ((table, "as_is"),),)
            for table in self._table_names
        }

    def execute_task(self, task, cursor, worker_id) -> Tuple[int, int, float, str]:
        """Generate execute task queries."""
        return self._default_driver.execute_task(task, cursor, worker_id)

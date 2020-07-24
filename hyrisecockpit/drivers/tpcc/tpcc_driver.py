"""TPC-C driver."""
from os import getcwd
from os.path import abspath
from time import time_ns
from typing import Dict, List, Tuple

from psycopg2.errors import SerializationFailure

from hyrisecockpit.drivers.__default__.driver import DefaultDriver
from hyrisecockpit.drivers.__default__.task_types import DefaultTask
from hyrisecockpit.drivers.tpcc.parameter_generator import TPCCParameterGenerator
from hyrisecockpit.drivers.tpcc.transaction_handler import TPCCTransactionHandler


class TpccDriver:
    """Tpch driver."""

    def __init__(self):
        """Initialize a tpch driver."""
        # TODO Move queries to driver folder
        self._query_path: str = f"{abspath(getcwd())}/workload_generator/workloads"
        self._benchmark_type: str = "tpcc"
        self._table_names: List[str] = [
            "warehouse",
            "district",
            "customer",
            "history",
            "new_order",
            "order",
            "order_line",
            "item",
            "stock",
        ]
        self.scale_factors = [5.0]
        self._transaction_handler = TPCCTransactionHandler()
        self._parameter_generator = TPCCParameterGenerator()

        self._default_driver: DefaultDriver = DefaultDriver(
            self._query_path,
            "no_scale_factor_query_path",  # is not used
            self._benchmark_type,
            self._table_names,
        )

    def get_scalefactors(self):
        """Get supported scalefactors."""
        return self.scale_factors

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
        self._parameter_generator.apply_scalefactor(scalefactor)
        tasks = self._parameter_generator.generate_transactions(frequency, weights)
        return tasks

    def get_table_names(self, scalefactor):
        """Return table name and representation in database."""
        return self._default_driver.get_table_names(scalefactor)

    def get_load_queries(self, scalefactor) -> Dict[str, Tuple[str, Tuple]]:
        """Generate load tables queries."""
        return self._default_driver.get_load_queries(scalefactor)

    def get_delete_queries(self, scalefactor) -> Dict[str, Tuple]:
        """Generate delete table queries."""
        return self._default_driver.get_delete_queries(scalefactor)

    def execute_task(
        self, task, cursor, worker_id
    ) -> Tuple[int, int, float, str, bool]:
        """Execute task of the transaction type."""
        transaction_type = task["transaction_type"]
        scalefactor = task["scalefactor"]
        parameters = task["args"]
        commited = True
        startts = time_ns()
        try:
            self._transaction_handler.execute_transaction(
                cursor, transaction_type, scalefactor, parameters
            )
        except SerializationFailure:
            commited = False
            cursor.reset()
        endts = time_ns()
        latency = endts - startts
        return endts, latency, scalefactor, task["transaction_type"], commited

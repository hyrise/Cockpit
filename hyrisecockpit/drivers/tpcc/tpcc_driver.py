"""TPC-C driver."""
from os import getcwd
from os.path import abspath
from time import time_ns
from typing import Dict, List, Tuple

from psycopg2.errors import lookup

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
            "WAREHOUSE",
            "DISTRICT",
            "CUSTOMER",
            "HISTORY",
            "NEW_ORDER",
            "ORDERS",
            "ORDER_LINE",
            "ITEM",
            "STOCK",
        ]
        self.scale_factors = [5.0]
        self._transaction_handler = TPCCTransactionHandler()
        self._parameter_generator = TPCCParameterGenerator()

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
        return {table_name: table_name for table_name in self._table_names}

    def get_load_queries(self, scalefactor) -> Dict[str, Tuple[str, Tuple]]:
        """Generate load tables queries."""
        formatted_scalefactor = str(int(scalefactor))
        load_queries = {}

        for table in self._table_names:
            if table != "ORDERS":
                load_queries[table] = (
                    """COPY "%s" FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';""",
                    (
                        (table, "as_is"),
                        (self._benchmark_type, "as_is"),
                        (formatted_scalefactor, "as_is"),
                        (table.lower(), "as_is"),
                    ),
                )
            else:
                load_queries[table] = (
                    """COPY "%s" FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';""",
                    (
                        (table, "as_is"),
                        (self._benchmark_type, "as_is"),
                        (formatted_scalefactor, "as_is"),
                        ("order", "as_is"),
                    ),
                )

        return load_queries  # type: ignore

    def get_delete_queries(self, scalefactor) -> Dict[str, Tuple]:
        """Generate delete table queries."""
        return {
            table: ("""DROP TABLE "%s";""", ((table, "as_is"),),)
            for table in self._table_names
        }

    def execute_task(
        self, task, cursor, worker_id
    ) -> Tuple[int, int, float, str, bool]:
        """Execute task of the transaction type."""
        transaction_type = task["transaction_type"]
        parameters = task["args"]
        commited = True
        cursor._connection.set_session(autocommit=False)
        startts = time_ns()
        try:
            self._transaction_handler.execute_transaction(
                cursor, transaction_type, parameters
            )
        except lookup("40001"):  # SerializationFailure
            commited = False
            cursor._connection.rollback()
        endts = time_ns()

        cursor._connection.set_session(autocommit=True)

        latency = endts - startts
        return endts, latency, task["scalefactor"], task["transaction_type"], commited

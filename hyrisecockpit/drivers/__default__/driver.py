"""Module for default workload behavior."""

from time import time_ns
from typing import Dict, List, Optional, Tuple, Union

from psycopg2.extensions import AsIs

from hyrisecockpit.drivers.__default__.default_workload import DefaultWorkload


class DefaultDriver:
    """Driver for default behavior."""

    def __init__(
        self,
        query_path: str,
        scale_factor_query_path: Dict,
        benchmark_type: str,
        table_names: List[str],
    ):
        """Initialize DefaultDriver."""
        self._query_path: str = query_path
        self._scale_factor_query_path: Dict = scale_factor_query_path
        self._benchmark_type: str = benchmark_type
        self._workloads: Dict = {}
        self._table_names = table_names

    def _get_workload_for_scale_factor(self, scalefactor):
        workload = self._workloads.get(scalefactor)
        if workload is None:
            query_path = (
                f"{self._query_path}/{self._scale_factor_query_path[scalefactor]}"
            )
            workload = DefaultWorkload(self._benchmark_type, scalefactor, query_path)
            self._workloads[scalefactor] = workload

        return workload

    def generate(self, scalefactor, frequency, weights):
        """Generate workload queries."""
        workload = self._get_workload_for_scale_factor(scalefactor)
        return workload.get(frequency, weights)

    def _get_formatted_scalefactor(self, scalefactor: int) -> str:
        """Get formatted scalefactor."""
        if scalefactor == int(scalefactor):
            formatted_scalefactor = str(int(scalefactor))
        else:
            formatted_scalefactor = str(scalefactor).replace(".", "_")

        return formatted_scalefactor

    def get_table_names(self, scalefactor):
        """Return table name and representation in database."""
        formatted_scalefactor = self._get_formatted_scalefactor(scalefactor)

        return {
            table_name: f"{table_name}_{self._benchmark_type}_{formatted_scalefactor}"
            for table_name in self._table_names
        }

    def get_load_queries(self, scalefactor):
        """Generate loading workload queries."""
        formatted_scalefactor = self._get_formatted_scalefactor(scalefactor)
        load_queries = {}

        for table in self._table_names:
            load_queries[f"{table}_{self._benchmark_type}_{formatted_scalefactor}"] = (
                "COPY %s_%s_%s FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';",
                (
                    (table, "as_is"),
                    (self._benchmark_type, "as_is"),
                    (formatted_scalefactor, "as_is"),
                    (self._benchmark_type, "as_is"),
                    (formatted_scalefactor, "as_is"),
                    (table, "as_is"),
                ),
            )
        return load_queries

    def get_delete_queries(self, scalefactor):
        """Generate delete workload queries."""
        formatted_scalefactor = self._get_formatted_scalefactor(scalefactor)
        delete_queries = {}
        for table in self._table_names:
            delete_queries[
                f"{table}_{self._benchmark_type}_{formatted_scalefactor}"
            ] = (
                "DROP TABLE %s_%s_%s;",
                (
                    (table, "as_is"),
                    (self._benchmark_type, "as_is"),
                    (formatted_scalefactor, "as_is"),
                ),
            )
        return delete_queries

    def _get_formatted_parameters(
        self,
        not_formatted_parameters: Tuple[Tuple[Union[str, int], Optional[str]], ...],
    ) -> Optional[Tuple[Union[AsIs, str], ...]]:
        """Create formatted parameters."""
        if not_formatted_parameters:
            return tuple(
                AsIs(parameter) if protocol == "as_is" else parameter
                for parameter, protocol in not_formatted_parameters
            )
        return None

    def _execute_query(
        self, cursor, query: str, formatted_parameters: Optional[Tuple[str, ...]]
    ) -> Tuple[int, int]:
        """Execute given query."""
        startts = time_ns()
        cursor.execute(query, formatted_parameters)
        endts = time_ns()

        return endts, endts - startts

    def execute_task(self, task, cursor, worker_id) -> Tuple[int, int, str, str]:
        """Execute task of the query type."""
        query = task["query"]
        query = query.replace("[STREAM_ID]", str(worker_id))

        not_formatted_parameters = task["args"]
        formatted_parameters = self._get_formatted_parameters(not_formatted_parameters)

        endts, latency = self._execute_query(cursor, query, formatted_parameters)
        return endts, latency, task["scalefactor"], task["query_type"]

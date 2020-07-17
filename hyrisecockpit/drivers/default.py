"""Module for default workload behavior."""

from collections import OrderedDict
from os import listdir
from random import choice, choices
from time import time_ns
from typing import Dict, List, Optional, Tuple, TypedDict, Union

from psycopg2.extensions import AsIs


class AbstractTask(TypedDict):
    """Abstract task."""

    type: str
    benchmark: str


class DefaultTask(AbstractTask):
    """Type of a generated Query."""

    query_type: str
    query: str
    args: Optional[Tuple]
    scalefactor: float


class TPCCTask(AbstractTask):
    """TPC-C task."""

    pass


class WorkloadReader:
    """Reads queries from workloads."""

    @classmethod
    def _read_query(cls, path_to_file: str) -> List[str]:
        with open(path_to_file, "r") as f:
            raw_queries: str = f.read()
        return [
            " ".join(transaction.split())
            for transaction in raw_queries.split("---")
            if transaction != ""
        ]

    @classmethod
    def get(cls, query_path: str) -> Optional[Dict[str, List[str]]]:
        """Get a workload from the workload folder. Returns the query names and a list of all queries."""
        queries = {}
        for file_name in listdir(query_path):
            query_type = file_name.split(".sql")[0]
            query_file_path = f"{query_path}/{file_name}"
            queries[query_type] = cls._read_query(query_file_path)

        return queries


class DefaultWorkload:
    """Generates workloads from queries."""

    def __init__(self, benchmark: str, scalefactor: float, query_path: str):
        """Initialize a Workload."""
        self._benchmark = benchmark
        self._scalefactor = scalefactor
        self._queries = OrderedDict(WorkloadReader.get(query_path))  # type: ignore

    def get(self, frequency, weights) -> List[DefaultTask]:
        """Get a list of queries with the frequency and weights."""
        return [
            DefaultTask(
                type="default",
                query=choice(self._queries[query_type]),  # nosec
                args=None,
                query_type=query_type,
                benchmark=self._benchmark,
                scalefactor=self._scalefactor,
            )
            for query_type in choices(
                population=list(self._queries.keys()),
                weights=list(weights.values()),
                k=frequency,
            )
        ]


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

    def get_load_queries(self, scalefactor):
        """Generate loading workload queries."""
        if scalefactor < 1.0:
            scalefactor = str(scalefactor).replace(".", "_")
        else:
            scalefactor = str(int(scalefactor))
        load_queries = {}
        for table in self._table_names:
            load_queries[f"{table}_{self._benchmark_type}_{scalefactor}"] = (
                "COPY %s_%s_%s FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';",
                (
                    (table, "as_is"),
                    (self._benchmark_type, "as_is"),
                    (scalefactor, "as_is"),
                    (self._benchmark_type, "as_is"),
                    (scalefactor, "as_is"),
                    (table, "as_is"),
                ),
            )
        return load_queries

    def get_delete_queries(self, scalefactor):
        """Generate delete workload queries."""
        if scalefactor < 1.0:
            scalefactor = str(scalefactor).replace(".", "_")
        else:
            scalefactor = str(int(scalefactor))
        delete_queries = {}
        for table in self._table_names:
            delete_queries[f"{table}_{self._benchmark_type}_{scalefactor}"] = (
                "DROP TABLE %s_%s_%s;",
                (
                    (table, "as_is"),
                    (self._benchmark_type, "as_is"),
                    (scalefactor, "as_is"),
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

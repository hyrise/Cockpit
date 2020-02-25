"""This module represents a workload."""

from secrets import choice
from typing import Any, Dict, List, Tuple

from hyrisecockpit.exception import QueryTypeNotFoundException
from hyrisecockpit.workload_generator.workload_reader import WorkloadReader


class Workload(object):
    """Generates workload."""

    def __init__(
        self,
        workload_type: str,
        workload_location: str,
        delimiter: str = ";",
        file_type: str = "sql",
    ) -> None:
        """Initialize a Workload."""
        self.workload_type: str = workload_type
        self._queries_location: str = f"{workload_location}/{workload_type}"
        self._delimiter: str = delimiter
        self._file_type: str = file_type
        self._queries: Dict[str, List[str]] = {}
        self._query_pointer: int = 0
        self._workload_reader = WorkloadReader()
        self._initialize()

    def _initialize(self) -> None:
        """Read workload from folder."""
        self._queries = self._workload_reader.read_workload(
            self._queries_location, self._delimiter, self._file_type, self.workload_type
        )

    def generate_workload(
        self, number_queries: int
    ) -> List[Tuple[Tuple[str, Any], str, str]]:
        """Chose random one query from every type."""
        workload_queries: List[Tuple[Tuple[str, Any], str, str]] = []
        query_types = list(self._queries.keys())
        for _ in range(number_queries):
            query_type = query_types[self._query_pointer]
            workload_queries.append(
                (
                    (choice(self._queries[query_type]), None),
                    self.workload_type,
                    query_type,
                )
            )
            self._query_pointer = (self._query_pointer + 1) % len(query_types)
        return workload_queries

    def generate_specific(
        self, query_type: str, factor: int = 1
    ) -> List[Tuple[str, Any]]:
        """Chose random one query from specific type [factor] times."""
        if query_type not in self._queries.keys():
            raise QueryTypeNotFoundException(f"Query file {query_type} was not found")

        workload_queries: List[Tuple[str, Any]] = [
            (choice(self._queries[query_type]), None) for _ in range(factor)
        ]

        return workload_queries

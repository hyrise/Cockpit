"""This module represents a workload."""
import secrets
from random import shuffle
from typing import Any, Dict, List, Tuple

from hyrisecockpit.exception import QueryTypeNotFoundException
from hyrisecockpit.workload_generator.workload_reader import WorkloadReader


class Workload(object):
    """Generates workload."""

    def __init__(
        self,
        workload_type: str,
        queries_location: str,
        delimiter: str = ";",
        file_type: str = "sql",
    ) -> None:
        """Initialize a Workload."""
        self.workload_type: str = workload_type
        self._queries_location: str = f"{queries_location}/{workload_type}"
        self._delimiter: str = delimiter
        self._file_type: str = file_type
        self._queries: Dict[str, List[str]] = {}
        self._workload_reader = WorkloadReader()
        self._initialize()

    def _initialize(self) -> None:
        """Read workload from folder."""
        self._queries = self._workload_reader.read_workload(
            self._queries_location, self._delimiter, self._file_type, self.workload_type
        )

    def generate_workload(
        self, factor: int = 1, shuffle_flag: bool = False
    ) -> List[Tuple[str, Any]]:
        """Chose random one query from every type."""
        workload_queries: List[Tuple[str, Any]] = []

        for _ in range(factor):
            for queries_type in self._queries.values():
                workload_queries.append((secrets.choice(queries_type), None))

        if shuffle_flag:
            shuffle(workload_queries)

        return workload_queries

    def generate_specific(
        self, query_type: str, factor: int = 1
    ) -> List[Tuple[str, Any]]:
        """Chose random one query from every type."""
        if query_type not in self._queries.keys():
            raise QueryTypeNotFoundException(f"Query file {query_type} was not found")

        workload_queries: List[Tuple[str, Any]] = [
            (secrets.choice(self._queries[query_type]), None) for _ in range(factor)
        ]

        return workload_queries

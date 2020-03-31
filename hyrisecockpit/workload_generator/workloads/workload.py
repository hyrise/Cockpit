"""This module represents a workload."""

from secrets import choice
from typing import Dict, List, NamedTuple, Optional, Tuple, Union

from hyrisecockpit.exception import QueryTypeNotFoundException
from hyrisecockpit.workload_generator.workload_reader import WorkloadReader


class Query(NamedTuple):
    """Type of a generated Query."""

    query: str
    args: Optional[Tuple[Union[str, int], ...]]
    folder_name: str
    query_type: str


class Workload(object):
    """Generates workload."""

    def __init__(
        self,
        folder_name: str,
        queries_location: str,
        frequency: int,
        delimiter: str = "---",
        file_type: str = "sql",
    ) -> None:
        """Initialize a Workload."""
        self.folder_name: str = folder_name
        self._queries_location: str = f"{queries_location}/{folder_name}"
        self.frequency = frequency
        self._delimiter: str = delimiter
        self._file_type: str = file_type
        self._query_pointer: int = 0
        self._workload_reader = WorkloadReader()
        self._queries: Dict[str, List[str]] = self._workload_reader.read_workload(
            self._queries_location, self._delimiter, self._file_type, self.folder_name
        )

    def generate_workload(self) -> List[Query]:
        """Chose random one query from every type."""
        workload_queries: List[Query] = []
        query_types: List[str] = list(self._queries.keys())
        for _ in range(self.frequency):
            query_type = query_types[self._query_pointer]
            workload_queries.append(
                Query(
                    query=choice(self._queries[query_type]),
                    args=None,
                    folder_name=self.folder_name,
                    query_type=query_type,
                )
            )
            self._query_pointer = (self._query_pointer + 1) % len(query_types)
        return workload_queries

    def update(self, new_workload: Dict) -> "Workload":
        """Update a workload."""
        for key, value in new_workload.items():
            if key != "workload_id":
                setattr(self, key, value)
        return self

    def generate_specific(
        self, query_type: str, factor: int = 1
    ) -> List[Tuple[str, Optional[Tuple]]]:
        """Chose random one query from specific type [factor] times."""
        if query_type not in self._queries.keys():
            raise QueryTypeNotFoundException(f"Query file {query_type} was not found")

        workload_queries: List[Tuple[str, Optional[Tuple]]] = [
            (choice(self._queries[query_type]), None) for _ in range(factor)
        ]

        return workload_queries

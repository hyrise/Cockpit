"""This module represents a workload."""
import secrets
from typing import Any, Dict, List, Tuple

from hyrisecockpit.workload_generator.workload_reader import WorkloadReader


class Workload(object):
    """Generates workload."""

    def __init__(self, workload_type, queries_location, delimiter, file_type):
        """Initialize a Workload."""
        self.workload_type = workload_type
        self._queries_location = queries_location
        self._delimiter = delimiter
        self._file_type = file_type
        self._queries: Dict[str, List[str]] = {}
        self._workload_reader = WorkloadReader()
        self._initialise()

    def _initialise(self):
        self._queries = self._workload_reader.read_from_folder(
            self._queries_location, self._delimiter, self._file_type
        )

    def generate_workload(self) -> List[Tuple[str, Any]]:
        """Chose random one query from every type."""
        workload_queries: List[Tuple[str, Any]] = []
        for queries_type in self._queries.values():
            workload_queries.append((secrets.choice(queries_type), None))
        return workload_queries

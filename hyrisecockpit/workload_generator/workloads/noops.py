"""Module for generating no operational workload."""

from typing import Any, List, Tuple


class NoopsWorkload(object):
    """Generate no-ops workload."""

    def __init__(self, factor):
        """Initialize a NoopsWorkload."""
        self._factor = factor

    def generate_workload(self) -> List[Tuple[str, Any]]:
        """Generate no operational workload."""
        queries = [("SELECT 1;", None) for _ in range(self._factor)]
        return queries

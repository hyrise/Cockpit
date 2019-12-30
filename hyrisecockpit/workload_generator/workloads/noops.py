"""Module for generating no operational workload."""

from typing import List


def generate_noops(factor: int) -> List:
    """Generate no operational workload."""
    queries = []
    for _ in range(factor):
        queries.append(("SELECT 1;", None))
    return queries

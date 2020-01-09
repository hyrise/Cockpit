"""Module for generating no operational workload."""

from typing import Any, List, Tuple


def generate_noops(factor: int) -> List[Tuple[str, Any]]:
    """Generate no operational workload."""
    queries = [("SELECT 1;", None) for _ in range(factor)]
    return queries

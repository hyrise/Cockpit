"""Interface of a Workload."""
from typing import TypedDict


class WorkloadInterface(TypedDict, total=False):
    """Interface of a Workload."""

    workload_id: str
    folder_name: str
    frequency: int

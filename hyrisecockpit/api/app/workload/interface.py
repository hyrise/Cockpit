"""Interface of a Workload."""
from typing import Dict, TypedDict


class WorkloadInterface(TypedDict):
    """Interface of a Workload."""

    folder_name: str
    frequency: int


class DetailedWorkloadInterface(WorkloadInterface):
    """Detailed interface of a Workload."""

    weights: Dict[str, float]

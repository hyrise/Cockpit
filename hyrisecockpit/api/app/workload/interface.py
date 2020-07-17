"""Interface of a Workload."""
from typing import Dict, TypedDict


class WorkloadInterface(TypedDict):
    """Interface of a Workload."""

    workload_type: str
    frequency: int
    scalefactor: float


class DetailedWorkloadInterface(WorkloadInterface):
    """Detailed interface of a Workload."""

    weights: Dict[str, float]

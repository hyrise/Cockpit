"""Interface of a Workload."""
from typing import Dict, List, TypedDict


class BaseWorkloadInterface(TypedDict):
    """Interface of a base Workload."""

    workload_type: str
    frequency: int
    scale_factor: float
    weights: Dict[str, float]


class WorkloadInterface(BaseWorkloadInterface):
    """Interface of a Workload."""

    running: bool


class DetailedWorkloadInterface(WorkloadInterface):
    """Detailed interface of a Workload."""

    supported_scale_factors: List[float]
    default_weights: Dict[str, float]

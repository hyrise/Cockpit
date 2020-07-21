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


class DetailedWorkloadInterface(BaseWorkloadInterface):
    """Detailed interface of a Workload."""

    running: bool
    supported_scale_factors: List
    default_weights: Dict

"""Model of a Workload."""
from typing import Dict, List


class BaseWorkload:
    """Model of a base Workload."""

    def __init__(
        self,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
    ):
        """Initialize a base Workload model."""
        self.workload_type: str = workload_type
        self.frequency: int = frequency
        self.scale_factor: float = scale_factor
        self.weights: Dict[str, float] = weights


class Workload(BaseWorkload):
    """Model of a Workload."""

    def __init__(
        self,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
        running: bool,
    ):
        """Initialize a Workload model."""
        self.running: bool = running
        super().__init__(workload_type, frequency, scale_factor, weights)


class DetailedWorkload(BaseWorkload):
    """Model of a detailed Workload."""

    def __init__(
        self,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
        running: bool,
        supported_scale_factors: List,
        default_weights: Dict,
    ):
        """Initialize a detailed Workload model."""
        self.running: bool = running
        self.supported_scale_factors: List = supported_scale_factors
        self.default_weights: Dict = default_weights

        super().__init__(workload_type, frequency, scale_factor, weights)

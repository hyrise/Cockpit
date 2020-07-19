"""Model of a Workload."""
from typing import Dict


class Workload:
    """Model of a Workload."""

    def __init__(self, workload_type: str, frequency: int, scale_factor: float):
        """Initialize a Workload model."""
        self.workload_type: str = workload_type
        self.frequency: int = frequency
        self.scale_factor: float = scale_factor


class DetailedWorkload(Workload):
    """Detailed model of a Workload."""

    def __init__(
        self,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
        running: bool,
    ):
        """Initialize a Workload model."""
        self.weights: Dict[str, float] = weights
        self.running: bool = running
        super().__init__(workload_type, frequency, scale_factor)

"""Model of a Workload."""
from typing import Dict


class Workload:
    """Model of a Workload."""

    def __init__(self, folder_name: str, frequency: int):
        """Initialize a Workload model."""
        self.folder_name: str = folder_name
        self.frequency: int = frequency


class DetailedWorkload(Workload):
    """Detailed model of a Workload."""

    def __init__(self, folder_name: str, frequency: int, weights: Dict[str, float]):
        """Initialize a Workload model."""
        self.weights: Dict[str, float] = weights
        super().__init__(folder_name, frequency)

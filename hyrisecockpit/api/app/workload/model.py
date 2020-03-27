"""Model of a Workload."""
from .interface import WorkloadInterface


class Workload:
    """Model of a Workload."""

    def __init__(self, workload_id: str, folder_name: str, frequency: int):
        """Initialize a Workload model."""
        self.workload_id: str = workload_id
        self.folder_name: str = folder_name
        self.frequency: int = frequency

    def update(self, interface: WorkloadInterface) -> "Workload":
        """Update attributes of a Workload model."""
        for key, value in interface.items():
            setattr(self, key, value)
        return self

"""Model for status information namespace."""
from typing import List


class DatabaseStatus:
    """Model of a database status."""

    def __init__(
        self,
        id: str,
        database_blocked_status: bool,
        worker_pool_status: str,
        hyrise_active: bool,
    ):
        """Initialize a database status model."""
        self.id: str = id
        self.database_blocked_status: bool = database_blocked_status
        self.worker_pool_status: str = worker_pool_status
        self.hyrise_active: bool = hyrise_active


class LoadedTables:
    """Model of workload."""

    def __init__(
        self, workload_type: str, scale_factor: float, loaded_tables: List[str]
    ):
        """Initialize a workload model."""
        self.workload_type: str = workload_type
        self.scale_factor: float = scale_factor
        self.loaded_tables: List[str] = loaded_tables


class LoadedWorkload:
    """Model of a loaded workload."""

    def __init__(self, workload_type: str, scale_factor: float):
        """Initialize a loaded workload model."""
        self.workload_type: str = workload_type
        self.scale_factor: float = scale_factor


class WorkloadStatus:
    """Model of workload status."""

    def __init__(
        self,
        id: str,
        loaded_workloads: List[LoadedWorkload],
        loaded_tables: List[LoadedTables],
    ):
        """Initialize a benchmark status model."""
        self.id: str = id
        self.loaded_workloads: List[LoadedWorkload] = loaded_workloads
        self.loaded_tables: List[LoadedTables] = loaded_tables


class FailedQuery:
    """Model of a FailedQuery Entry."""

    def __init__(self, time: str, worker_id: str, task: str, error: str):
        """Initialize a FailedQuery model."""
        self.time: str = time
        self.worker_id: str = worker_id
        self.task: str = task
        self.error: str = error


class FailedTask:
    """Model of a FailedTask Entry."""

    def __init__(self, id: str, failed_queries: List[FailedQuery]):
        """Initialize a FailedTask model."""
        self.id: str = id
        self.failed_queries: List[FailedQuery] = failed_queries

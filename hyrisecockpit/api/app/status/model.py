"""Model for status information namespace."""
from typing import Dict, List


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


class TablesStatus:
    """Model of a tables status."""

    def __init__(
        self,
        workload_type: str,
        scale_factor: float,
        loaded_tables: List[str],
        missing_tables: List[str],
        completely_loaded: bool,
        database_representation: Dict,
    ):
        """Initialize a tables status model."""
        self.workload_type: str = workload_type
        self.scale_factor: float = scale_factor
        self.loaded_tables: List[str] = loaded_tables
        self.missing_tables: List[str] = missing_tables
        self.completely_loaded: bool = completely_loaded
        self.database_representation: Dict = database_representation


class WorkloadTablesStatus:
    """Model of workload tables status."""

    def __init__(
        self, id: str, workload_tables_status: List[TablesStatus],
    ):
        """Initialize a Workload tables model."""
        self.id: str = id
        self.workload_tables_status: List[TablesStatus] = workload_tables_status


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

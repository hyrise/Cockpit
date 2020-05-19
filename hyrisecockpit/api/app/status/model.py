"""Model for status information namespace."""
from typing import List


class HyriseStatus:
    """Model of a Hyrise status."""

    def __init__(self, id: str, hyrise_active: bool):
        """Initialize a Hyrise status model."""
        self.id: str = id
        self.hyrise_active: bool = hyrise_active


class DatabaseStatus:
    """Model of a database status."""

    def __init__(self, id: str, database_blocked_status: bool, worker_pool_status: str):
        """Initialize a database status model."""
        self.id: str = id
        self.database_blocked_status: bool = database_blocked_status
        self.worker_pool_status: str = worker_pool_status


class LoadedTables:
    """Model of loaded tables."""

    def __init__(self, table_name: str, benchmark: str):
        """Initialize a loaded tables model."""
        self.table_name: str = table_name
        self.benchmark: str = benchmark


class BenchmarkStatus:
    """Model of benchmark status."""

    def __init__(
        self, id: str, loaded_benchmarks: List[str], loaded_tables: List[LoadedTables]
    ):
        """Initialize a benchmark status model."""
        self.id: str = id
        self.loaded_benchmarks: List[str] = loaded_benchmarks
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

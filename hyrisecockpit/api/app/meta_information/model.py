"""Model for meta information namespace."""
from typing import List


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

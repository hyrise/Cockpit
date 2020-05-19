"""Model for status information namespace."""
from typing import List


class HyriseStatus:
    """Model of a Hyrise status."""

    def __init__(self, id: str, hyrise_active: bool):
        """Initialize a Hyrise status model."""
        self.id: str = id
        self.hyrise_active: bool = hyrise_active


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

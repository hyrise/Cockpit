"""Model for metric namespace.

Models are python representation of entities.
"""

from typing import List


class FailedTaskEntry:
    """Model of a failed task."""

    def __init__(self, timestamp: int, worker_id: str, task: str, error: str):
        self.timestamp: int = timestamp
        self.worker_id: str = worker_id
        self.task: str = task
        self.error: str = error


class FailedTasks:
    """Model of a failed task."""

    def __init__(self, database_id: str, failed_task_entries: List[FailedTaskEntry]):
        self.id: str = database_id
        self.failed_task_entries: List[FailedTaskEntry] = failed_task_entries

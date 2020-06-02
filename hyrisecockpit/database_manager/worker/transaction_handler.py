"""Handler for tasks of the transaction type."""
from typing import Tuple


class TransactionHandler:
    """Handler for processing of the transaction tasks."""

    def __init__(self, cursor, worker_id: str):
        """Initialize TransactionHandler."""
        self._cursor = cursor
        self._worker_id = worker_id

    def execute_task(self, task) -> Tuple[int, int]:
        """Execute task of the transaction type."""
        return 1, 2

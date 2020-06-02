"""Handler for tasks of the transaction type."""
from time import time_ns
from typing import Tuple


class TPCCTransactionHandler:
    """Handler for processing of the transaction tasks."""

    def __init__(self, cursor, worker_id: str):
        """Initialize TransactionHandler."""
        self._cursor = cursor
        self._worker_id = worker_id

    def execute_task(self, task) -> Tuple[int, int]:
        """Execute task of the transaction type."""
        endts, latency = self._execute_random_transaction()
        return endts, latency

    def _execute_random_transaction(self) -> Tuple[int, int]:
        """Execute random transaction."""
        endts = time_ns()
        return endts, 100_000_000

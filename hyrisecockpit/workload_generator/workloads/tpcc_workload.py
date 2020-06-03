"""Module for TPC-C workload."""
from typing import List

from .task_types import TPCCTask


class TPCCWorkload:
    """TPC-C workload."""

    def __init__(self, benchmark: str, frequency: int):
        """Initialize TPC-C workload."""
        self._frequency = frequency
        self._benchmark = benchmark

    @property
    def frequency(self) -> int:
        """Get the frequency of the Workload (queries per second)."""
        return self._frequency

    @frequency.setter
    def frequency(self, value: int) -> int:
        """Set the frequency to a non-negative int."""
        self._frequency = max(value, 0)
        return self._frequency

    def get(self) -> List[TPCCTask]:
        """Get transactions."""
        return [
            TPCCTask(type="tpcc_transaction", benchmark=self._benchmark,)
            for _ in range(self._frequency)
        ]

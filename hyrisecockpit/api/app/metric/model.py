"""Model for metric namespace."""
from typing import List


class ThroughputEntry:
    """Model of a ThroughputEntry."""

    def __init__(self, timestamp: int, throughput: float):
        """Initialize a ThroughputEntry model."""
        self.timestamp = timestamp
        self.throughput = throughput


class Throughput:
    """Model of a Throughput."""

    def __init__(self, id: str, throughput: List[ThroughputEntry]):
        """Initialize a ThroughputEntry model."""
        self.id: str = id
        self.throughput: List[ThroughputEntry] = throughput

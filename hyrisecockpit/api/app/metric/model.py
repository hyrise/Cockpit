"""Model for metric namespace."""
from typing import List


class DetailedQueryEntry:
    """Model of a ThroughputEntry."""

    def __init__(
        self,
        benchmark: str,
        query_number: str,
        throughput: float,
        latency: float,
        scale_factor: float,
    ):
        """Initialize a DetailedQueryEntry model."""
        self.benchmark: str = benchmark
        self.query_number: str = query_number
        self.scale_factor: float = scale_factor
        self.throughput: float = throughput
        self.latency: float = latency


class DetailedQueryInformation:
    """Model of a DetailedQueryInformation."""

    def __init__(self, id: str, detailed_query_information: List[DetailedQueryEntry]):
        """Initialize a DetailedQueryInformation model."""
        self.id: str = id
        self.detailed_query_information: List[
            DetailedQueryEntry
        ] = detailed_query_information


class TimeInterval:
    """Model of a time interval."""

    def __init__(self, startts: int, endts: int, precision: int):
        """Initialize a Time Interval model."""
        self.startts: int = startts
        self.endts: int = endts
        self.precision: int = precision


class ThroughputEntry:
    """Model of a throughput entry."""

    def __init__(self, timestamp: int, throughput: float):
        """Initialize a throughput entry model."""
        self.timestamp: int = timestamp
        self.throughput: float = throughput


class Throughput:
    """Model of a throughput."""

    def __init__(self, id: str, throughput: List[ThroughputEntry]):
        """Initialize a throughput model."""
        self.id: str = id
        self.throughput: List[ThroughputEntry] = throughput


class NegativeThroughputEntry:
    """Model of a negative throughput entry."""

    def __init__(self, timestamp: int, negative_throughput: float):
        """Initialize a throughput entry model."""
        self.timestamp: int = timestamp
        self.negative_throughput: float = negative_throughput


class NegativeThroughput:
    """Model of a negative throughput."""

    def __init__(self, id: str, negative_throughput: List[NegativeThroughputEntry]):
        """Initialize a negative throughput model."""
        self.id: str = id
        self.negative_throughput: List[NegativeThroughputEntry] = negative_throughput


class LatencyEntry:
    """Model of a latency entry."""

    def __init__(self, timestamp: int, latency: float):
        """Initialize a latency entry model."""
        self.timestamp: int = timestamp
        self.latency: float = latency


class Latency:
    """Model of a latency."""

    def __init__(self, id: str, latency: List[LatencyEntry]):
        """Initialize a latency model."""
        self.id: str = id
        self.latency: List[LatencyEntry] = latency


class QueueLengthEntry:
    """Model of a queue length entry."""

    def __init__(self, timestamp: int, queue_length: float):
        """Initialize a queue length entry model."""
        self.timestamp: int = timestamp
        self.queue_length: float = queue_length


class QueueLength:
    """Model of a queue length."""

    def __init__(self, id: str, queue_length: List[QueueLengthEntry]):
        """Initialize a queue length model."""
        self.id: str = id
        self.queue_length: List[QueueLengthEntry] = queue_length


class MemoryFootprintEntry:
    def __init__(self, timestamp: int, memory_footprint: float):
        self.timestamp: int = timestamp
        self.memory_footprint: float = memory_footprint


class MemoryFootprint:
    def __init__(self, id: str, memory_footprint: List[MemoryFootprintEntry]):
        self.id: str = id
        self.memory_footprint: List[MemoryFootprintEntry] = memory_footprint

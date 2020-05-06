"""Model for metric namespace."""
from typing import List


class DetailedQueryEntry:
    """Model of a ThroughputEntry."""

    def __init__(
        self, benchmark: str, query_number: str, throughput: float, latency: float
    ):
        """Initialize a DetailedQueryEntry model."""
        self.benchmark: str = benchmark
        self.query_number: str = query_number
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

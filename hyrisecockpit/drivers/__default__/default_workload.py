"""Module for default workload."""
from collections import OrderedDict
from random import choice, choices
from typing import List

from hyrisecockpit.drivers.__default__.task_types import DefaultTask
from hyrisecockpit.drivers.__default__.workload_reader import WorkloadReader


class DefaultWorkload:
    """Generates workloads from queries."""

    def __init__(self, benchmark: str, scalefactor: float, query_path: str):
        """Initialize a Workload."""
        self._benchmark = benchmark
        self._scalefactor = scalefactor
        self._queries = OrderedDict(WorkloadReader.get(query_path))

    def get(self, frequency, weights) -> List[DefaultTask]:
        """Get a list of queries with the frequency and weights."""
        return [
            DefaultTask(
                type="default",
                query=choice(self._queries[query_type]),  # nosec
                args=None,
                query_type=query_type,
                benchmark=self._benchmark,
                scalefactor=self._scalefactor,
            )
            for query_type in choices(
                population=list(self._queries.keys()),
                weights=list(weights.values()),
                k=frequency,
            )
        ]

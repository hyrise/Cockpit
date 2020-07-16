"""Module to generate workloads from queries."""
from __future__ import annotations

from collections import OrderedDict
from random import choice, choices
from typing import List

from .reader import WorkloadReader
from .task_types import DefaultTask


class DefaultWorkload:
    """Generates workloads from queries."""

    def __init__(self, benchmark: str, query_path: str):
        """Initialize a Workload."""
        self._benchmark = benchmark
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
            )
            for query_type in choices(
                population=list(self._queries.keys()),
                weights=list(weights),
                k=frequency,
            )
        ]

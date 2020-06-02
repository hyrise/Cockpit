"""Module to generate workloads from queries."""
from __future__ import annotations

from collections import OrderedDict
from random import choice, choices
from typing import Dict, List, Optional, Tuple, TypedDict

from hyrisecockpit.api.app.workload.interface import DetailedWorkloadInterface


class AbstractTask(TypedDict):
    """Abstract task."""

    type: str
    query_type: str
    benchmark: str


class QueryTask(AbstractTask):
    """Type of a generated Query."""

    query: str
    args: Optional[Tuple]


class Workload:
    """Generates workloads from queries."""

    def __init__(self, benchmark: str, frequency: int, queries: Dict[str, List[str]]):
        """Initialize a Workload."""
        self._benchmark = benchmark
        self.frequency: int = frequency
        self._queries: OrderedDict[str, List[str]] = OrderedDict(queries)
        self._weights: OrderedDict[str, float] = OrderedDict(
            (key, 1.0) for key in self._queries.keys()
        )

    @property
    def frequency(self) -> int:
        """Get the frequency of the Workload (queries per second)."""
        return self._frequency

    @frequency.setter
    def frequency(self, value: int) -> int:
        """Set the frequency to a non-negative int."""
        self._frequency = max(value, 0)
        return self._frequency

    @property
    def weights(self) -> Dict[str, float]:
        """Get the weight of each query."""
        return dict(self._weights)

    @weights.setter
    def weights(self, values: Dict[str, float]) -> Dict[str, float]:
        """Set the weight of each query, must be done with all queries."""
        if values.keys() == self._weights.keys():
            for key, value in values.items():
                self._weights[key] = max(value, 0)
        return dict(self._weights)

    @weights.deleter
    def weights(self):
        """Reset the weight of each query."""
        self._weights = OrderedDict((key, 1.0) for key in self._queries.keys())

    def update(self, new_workload: DetailedWorkloadInterface) -> None:
        """Update a Workload with new attributes."""
        self.frequency = new_workload["frequency"]
        self.weights = new_workload["weights"]

    def get(self) -> List[QueryTask]:
        """Get a list of queries with the frequency and weights."""
        return [
            QueryTask(
                type="query",
                query=choice(self._queries[query_type]),  # nosec
                args=None,
                query_type=query_type,
                benchmark=self._benchmark,
            )
            for query_type in choices(
                population=list(self._queries.keys()),
                weights=list(self._weights.values()),
                k=self.frequency,
            )
        ]

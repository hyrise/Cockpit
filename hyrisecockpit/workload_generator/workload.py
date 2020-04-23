"""Module to generate workloads from queries."""
from __future__ import annotations

from collections import OrderedDict
from random import choice, choices
from typing import Dict, List, NamedTuple, Optional, Tuple


class Query(NamedTuple):
    """Type of a generated Query."""

    query: str
    args: Optional[Tuple]
    query_type: str


class Workload:
    """Generates workloads from queries."""

    def __init__(self, frequency: int, queries: Dict[str, List[str]]):
        """Initialize a Workload."""
        self.frequency: int = frequency
        self._queries: OrderedDict[str, List[str]] = OrderedDict(queries)
        self._weights: OrderedDict[str, int] = OrderedDict(
            (key, 100) for key in self._queries.keys()
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
    def weights(self) -> Dict[str, int]:
        """Get the weight of each query."""
        return dict(self._weights)

    @weights.setter
    def weights(self, values: Dict[str, int]) -> Dict[str, int]:
        """Set the weight of each query, must be done with all queries."""
        if values.keys() == self._weights.keys():
            for key, value in values.items():
                self._weights[key] = max(value, 0)
        return dict(self._weights)

    @weights.deleter
    def weights(self):
        """Reset the weight of each query."""
        self._weights = OrderedDict((key, 100) for key in self._queries.keys())

    def update(self, new_workload: Dict):
        """Update a Workload with new attributes."""
        raise NotImplementedError()

    def get(self) -> List[Query]:
        """Get a list of queries with the frequency and weights."""
        return [
            Query(
                query=choice(self._queries[query_type]),  # nosec
                args=None,
                query_type=query_type,
            )
            for query_type in choices(
                population=list(self._queries.keys()),
                weights=list(self._weights.values()),
                k=self.frequency,
            )
        ]

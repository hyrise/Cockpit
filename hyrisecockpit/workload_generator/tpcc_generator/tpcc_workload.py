"""Module to generate TPC-C transcations."""
from __future__ import annotations

from collections import OrderedDict
from random import choice, choices
from typing import Dict, List, NamedTuple, Optional, Tuple

from hyrisecockpit.api.app.workload.interface import DetailedWorkloadInterface

TRANSACTION_TYPES = ["DELIVERY", "NEW_ORDER", "ORDER_STATUS", "PAYMENT", "STOCK_LEVEL"]
DEFAULT_WEIGHT = 100


class Query(NamedTuple):
    """Type of a generated Query."""

    query: str
    args: Optional[Tuple]
    query_type: str


class TPCCWorkload:
    """Generates TPC-C workload."""

    def __init__(self, frequency: int, queries: Dict[str, List[str]]):
        """Initialize a Workload."""
        self.frequency: int = frequency
        self._weights: OrderedDict[str, int] = OrderedDict(
            (transaction_type, DEFAULT_WEIGHT) for transaction_type in TRANSACTION_TYPES
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
        self._weights = OrderedDict(
            (transaction_type, DEFAULT_WEIGHT) for transaction_type in TRANSACTION_TYPES
        )

    def update(self, new_workload: DetailedWorkloadInterface) -> None:
        """Update a Workload with new attributes."""
        self.frequency = new_workload["frequency"]
        self.weights = new_workload["weights"]

    def get(self) -> List[Query]:
        """Get a list of queries with the frequency and weights."""
        return [
            Query(
                query=choice(self._queries[query_type]),  # type: ignore # nosec
                args=None,
                query_type=query_type,
            )
            for query_type in choices(
                population=list(self._queries.keys()),  # type: ignore # nosec
                weights=list(self._weights.values()),
                k=self.frequency,
            )
        ]

"""Module with task types."""
from typing import Optional, Tuple, TypedDict


class AbstractTask(TypedDict):
    """Abstract task."""

    type: str  # TODO: do we still need it?
    benchmark: str
    scalefactor: float
    args: Optional[Tuple]


class DefaultTask(AbstractTask):
    """Type of a generated Query."""

    query_type: str
    query: str


class TPCCTask(AbstractTask):
    """TPC-C task."""

    transaction_type: str

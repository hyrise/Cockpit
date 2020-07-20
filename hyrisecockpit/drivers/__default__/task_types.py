"""Module with task types."""
from typing import Optional, Tuple, TypedDict


class AbstractTask(TypedDict):
    """Abstract task."""

    type: str
    benchmark: str


class DefaultTask(AbstractTask):
    """Type of a generated Query."""

    query_type: str
    query: str
    args: Optional[Tuple]
    scalefactor: float


class TPCCTask(AbstractTask):
    """TPC-C task."""

    pass

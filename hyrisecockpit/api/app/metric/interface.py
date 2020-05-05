"""Interfaces for metric namespace."""
from typing import TypedDict


class TimeIntervalInterface(TypedDict):
    """Interface for time interval."""

    startts: int
    endts: int
    precision: int

"""Interface to use in modules."""
from typing import List, TypedDict


class SqlResultInterface(TypedDict):
    """Interface of a sql result."""

    id: str
    successful: bool
    results: List[List[str]]
    col_names: List[str]
    error_message: str

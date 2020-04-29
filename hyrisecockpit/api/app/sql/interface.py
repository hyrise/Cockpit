"""Interfaces for SQL module."""
from typing import List, TypedDict


class SqlQueryInterface(TypedDict):
    """Interface of a Sql query."""

    id: str
    query: str


class SqlResponseInterface(TypedDict):
    """Interface of a SQL query response."""

    id: str
    successful: bool
    results: List[List[str]]
    col_names: List[str]
    error_message: str

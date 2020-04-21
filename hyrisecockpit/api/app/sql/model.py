"""Models for SQL module."""
from typing import List

from .interface import SqlQueryInterface, SqlResponseInterface


class SqlQuery:
    """Model of a sql query."""

    def __init__(self, id: str, query: str):
        """Initialize a sql query model."""
        self.id: str = id
        self.query: str = query

    def update(self, interface: SqlQueryInterface) -> "SqlQuery":
        """Update attributes of a sql query model."""
        for key, value in interface.items():
            setattr(self, key, value)
        return self


class SqlResponse:
    """Model of a sql query response."""

    def __init__(
        self,
        id: str,
        successful: bool,
        results: List[List[str]],
        col_names: List[str],
        error_message: str,
    ):
        """Initialize a sql response model."""
        self.id: str = id
        self.successful: bool = successful
        self.results: List[List[str]] = results
        self.col_names: List[str] = col_names
        self.error_message: str = error_message

    def update(self, interface: SqlResponseInterface) -> "SqlResponse":
        """Update attributes of a sql reponse model."""
        for key, value in interface.items():
            setattr(self, key, value)
        return self

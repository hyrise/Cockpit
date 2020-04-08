"""Interface of control name-space."""
from typing import TypedDict


class DatabaseInterface(TypedDict, total=False):
    """Interface of a Database."""

    id: str


class DetailedDatabaseInterface(TypedDict, total=False):
    """Interface of a detailed database."""

    id: str
    host: str
    port: str
    number_workers: int
    dbname: str
    user: str
    password: str

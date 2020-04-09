"""Interface of control name-space."""
from typing import TypedDict


class DatabaseInterface(TypedDict):
    """Interface of a Database."""

    id: str


class DetailedDatabaseInterface(TypedDict):
    """Interface of a detailed database."""

    id: str
    host: str
    port: str
    number_workers: int
    dbname: str
    user: str
    password: str


class BenchmarkTablesInterface(TypedDict):
    """Interface of benchmark tables to load."""

    folder_name: str

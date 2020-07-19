"""Interface of Database name-space."""
from typing import List, TypedDict


class DatabaseInterface(TypedDict):
    """Interface of a Database."""

    id: str


class DetailedDatabaseInterface(DatabaseInterface):
    """Interface of a detailed database."""

    host: str
    port: str
    number_workers: int
    dbname: str
    user: str
    password: str


class WorkloadTablesInterface(TypedDict):
    """Interface of benchmark tables to load."""

    workload_type: str
    scale_factor: float


class AvailableWorkloadTablesInterface(TypedDict):
    """Interface of available benchmark tables interface."""

    workload_tables: List

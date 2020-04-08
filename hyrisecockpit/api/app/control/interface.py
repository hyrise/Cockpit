"""Interface of control name-space."""
from typing import TypedDict


class DetailedDatabaseInterface(TypedDict, total=False):
    """Interface of a Workload."""

    id: str
    host: str
    port: str
    number_workers: int
    dbname: str
    user: str
    password: str

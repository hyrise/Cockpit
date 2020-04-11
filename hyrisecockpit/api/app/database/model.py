"""Models of Database name-space."""
from typing import List

from .interface import (
    AvailableBenchmarkTablesInterface,
    DatabaseInterface,
    DetailedDatabaseInterface,
)


class Database:
    """Model of a Database."""

    def __init__(self, id: str):
        """Initialize a Database model."""
        self.id: str = id

    def update(self, interface: DatabaseInterface) -> "Database":
        """Update attributes of a database model."""
        for key, value in interface.items():
            setattr(self, key, value)
        return self


class DetailedDatabase:
    """Model of a detailed Database."""

    def __init__(
        self,
        id: str,
        host: str,
        port: str,
        number_workers: int,
        dbname: str,
        user: str,
        password: str,
    ):
        """Initialize a Database model."""
        self.id: str = id
        self.host: str = host
        self.port: str = port
        self.number_workers: int = number_workers
        self.dbname: str = dbname
        self.user: str = user
        self.password: str = password

    def update(self, interface: DetailedDatabaseInterface) -> "DetailedDatabase":
        """Update attributes of a database model."""
        for key, value in interface.items():
            setattr(self, key, value)
        return self


class AvailableBenchmarkTables:
    """Model for available benchmark tables."""

    def __init__(self, folder_names: List[str]):
        """Initialize a available benchmark tables model."""
        self.folder_names: List[str] = folder_names

    def update(
        self, interface: AvailableBenchmarkTablesInterface
    ) -> "AvailableBenchmarkTables":
        """Update attributes of a available benchmark tables model."""
        for key, value in interface.items():
            setattr(self, key, value)
        return self

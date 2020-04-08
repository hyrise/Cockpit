"""Model of a Workload."""
from .interface import DetailedDatabaseInterface


class Database:
    """Model of a Database."""

    def __init__(self, id: str):
        """Initialize a Database model."""
        self.id: str = id

    def update(self, interface: DetailedDatabaseInterface) -> "Database":
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

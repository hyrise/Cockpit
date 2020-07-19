"""Models of Database name-space."""
from typing import List


class Database:
    """Model of a Database."""

    def __init__(self, id: str):
        """Initialize a Database model."""
        self.id: str = id


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


class WorkloadTables:
    """Model for benchmark tables."""

    def __init__(self, workload_type: str, scale_factor: float):
        """Initialize a benchmark tables model."""
        self.workload_type: str = workload_type
        self.scale_factor: float = scale_factor


class AvailableWorkloadTables:
    """Model for available benchmark tables."""

    def __init__(self, workload_tables: List[WorkloadTables]):
        """Initialize a available benchmark tables model."""
        self.workload_tables: List[WorkloadTables] = workload_tables

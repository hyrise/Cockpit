"""Utility custom cursors."""
from types import TracebackType
from typing import Any, Dict, List, Optional, Tuple, Type

from influxdb import InfluxDBClient
from psycopg2 import pool


class PoolCursor:
    """Context manager for connections from a pool."""

    def __init__(self, connection_pool: pool) -> None:
        """Initialize a PoolCursor."""
        self.pool: pool = connection_pool
        self.connection = self.pool.getconn()
        self.connection.set_session(autocommit=True)
        self.cur = self.connection.cursor()

    def __enter__(self) -> "PoolCursor":
        """Return self for a context manager."""
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self.cur.close()
        self.pool.putconn(self.connection)
        return None

    def execute(self, query: str, parameters: Optional[Tuple]) -> None:
        """Execute a query."""
        return self.cur.execute(query, parameters)

    def fetchone(self) -> Tuple:
        """Fetch one."""
        return self.cur.fetchone()

    def fetchall(self) -> List:
        """Fetch all."""
        return self.cur.fetchall()


class StorageCursor:
    """Context Manager for a connection to log queries persistently."""

    def __init__(
        self, host: str, port: str, user: str, password: str, database: str
    ) -> None:
        """Initialize a StorageCursor."""
        self._host = host
        self._port = port
        self._user = user
        self._password = password
        self._database = database

    def __enter__(self) -> "StorageCursor":
        """Establish a connection."""
        self._connection: InfluxDBClient = InfluxDBClient(
            self._host, self._port, self._user, self._password
        )
        self._connection.create_database(self._database)
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self._connection.close()
        return None

    def log_meta_information(
        self, measurement: str, fields: Dict[str, Any], time_stamp: int
    ) -> None:
        """Log meta information in table."""
        points = [{"measurement": measurement, "fields": fields, "time": time_stamp}]
        self._connection.write_points(points, database=self._database)

    def log_queries(self, query_list: List[Tuple[int, int, str, str, str]]) -> None:
        """Log a couple of succesfully executed queries."""
        points = [
            {
                "measurement": "successful_queries",
                "tags": {
                    "benchmark": query[2],
                    "query_no": query[3],
                    "worker_id": query[4],
                },
                "fields": {"latency": query[1]},
                "time": query[0],
            }
            for query in query_list
        ]
        self._connection.write_points(points, database=self._database)

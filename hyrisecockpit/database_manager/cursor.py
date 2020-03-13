"""Utility custom cursors."""

from typing import Any, Dict, List, Tuple

from influxdb import InfluxDBClient
from psycopg2 import pool


class PoolCursor:
    """Context manager for connections from a pool."""

    def __init__(self, connection_pool: pool):
        """Initialize a PoolCursor."""
        self.pool: pool = connection_pool
        self.connection = self.pool.getconn()
        self.connection.set_session(autocommit=True)
        self.cur = self.connection.cursor()

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Close the cursor and connection."""
        self.cur.close()
        self.pool.putconn(self.connection)

    def execute(self, query, parameters):
        """Execute a query."""
        return self.cur.execute(query, parameters)

    def fetchone(self):
        """Fetch one."""
        return self.cur.fetchone()

    def fetchall(self):
        """Fetch all."""
        return self.cur.fetchall()


class StorageCursor:
    """Context Manager for a connection to log queries persistently."""

    def __init__(self, host, port, user, password, database):
        """Initialize a StorageCursor."""
        self._host = host
        self._port = port
        self._user = user
        self._password = password
        self._database = database

    def __enter__(self):
        """Establish a connection."""
        self._connection: InfluxDBClient = InfluxDBClient(
            self._host, self._port, self._user, self._password
        )
        self._connection.create_database(self._database)
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Close the cursor and connection."""
        self._connection.close()

    def log_meta_information(
        self, measurement: str, fields: Dict[str, Any], time_stamp: int
    ):
        """Log meta information in table."""
        self._connection.write_point(
            {"measurement": measurement, "fields": fields, "time": time_stamp},
            database=self._database,
        )

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

    def log_plugin_log(self, plugin_log: List[Tuple[int, str, str]]) -> None:
        """Log a couple of succesfully executed queries."""
        points = [
            {
                "measurement": "plugin_log",
                "tags": {"timestamp": row[0], "reporter": row[1]},
                "fields": {"message": row[2]},
                "time": row[0],
            }
            for row in plugin_log
        ]
        self._connection.write_points(points, database=self._database)

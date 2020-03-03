"""Utility custom cursors."""
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

    def log_queries(self, query_list) -> None:
        """Log a couple of succesfully executed queries."""
        points = [
            {
                "measurement": "successful_queries",
                "tags": {"benchmark": query[2], "query_no": query[3]},
                "fields": {"latency": query[1]},
                "time": query[0],
            }
            for query in query_list
        ]
        self._connection.write_points(points, database=self._database)

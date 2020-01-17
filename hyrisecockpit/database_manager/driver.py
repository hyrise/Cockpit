"""The driver represents an interface to the database."""

from typing import Dict

from psycopg2 import Error, connect, pool

from hyrisecockpit.exception import ConnectionNotValidException


class Driver(object):
    """Interface to database."""

    def __init__(self, access_data, n_connections):
        """Initialize the connection."""
        self._connection_pool = self._create_connection_pool(access_data, n_connections)

    @classmethod
    def validate_connection(cls, access_data: Dict[str, str]) -> None:
        """Validate if the connection data is correct."""
        try:
            connection = connect(
                user=access_data["user"],
                password=access_data["password"],
                host=access_data["host"],
                port=int(access_data["port"]),
                dbname=access_data["dbname"],
            )
            connection.close()
        except Error:
            raise ConnectionNotValidException("Database connection refused", Error)

    def _create_connection_pool(
        self, access_data: Dict[str, str], n_connections: int
    ) -> pool:
        """Create thread save connection pool."""
        connection_pool = pool.ThreadedConnectionPool(
            0,
            n_connections,
            user=access_data["user"],
            password=access_data["password"],
            host=access_data["host"],
            port=int(access_data["port"]),
            dbname=access_data["dbname"],
        )
        return connection_pool

    def get_connection_pool(self) -> pool:
        """Return the connection pool."""
        return self._connection_pool

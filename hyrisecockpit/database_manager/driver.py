"""The driver represents an interface to the database."""

from psycopg2 import pool


class Driver(object):
    """Interface to database."""

    def __init__(self, user, password, host, port, dbname, n_connections):
        """Initialize the connection."""
        self._user = user
        self._password = password
        self._host = host
        self._port = port
        self._dbname = dbname
        self._connection_pool = self._create_connection_pool(n_connections)

    def _create_connection_pool(self, n_connections):
        """Create thread save connection pool."""
        connection_pool = pool.ThreadedConnectionPool(
            0,
            n_connections,
            user=self._user,
            password=self._password,
            host=self._host,
            port=self._port,
            database=self._dbname,
        )
        return connection_pool

    def get_connection_pool(self):
        """Return the connection pool."""
        return self._connection_pool

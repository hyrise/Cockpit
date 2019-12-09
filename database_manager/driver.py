"""The driver represents an interface to the database."""

from os import getenv

import psycopg2


class Driver(object):
    """Interface to database."""

    def __init__(self, user, password, host, port, dbname, number_threads):
        """Initialize the connection."""
        self._user = user
        self._password = password
        self._host = host
        self._port = (port,)
        self._dbname = dbname
        self._connection_pool = self._create_connection_pool(number_threads)

    def _create_connection_pool(self, number_threads):
        """Create thread save connection pool."""
        connection_pool = psycopg2.pool.ThreadedConnectionPool(
            0,
            number_threads,
            user=self._user,
            password=self._password,
            host=self._host,
            port=getenv("DB_PORT"),
            database=self._dbname,
        )
        return connection_pool

    def get_connection_pool(self):
        """Return the connection pool."""
        return self._connection_pool

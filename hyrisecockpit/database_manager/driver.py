"""The driver represents an interface to the database."""

from psycopg2 import Error, connect, pool


class Driver(object):
    """Interface to database."""

    def __init__(self, access_data, n_connections):
        """Initialize the connection."""
        self._connection_pool = self._create_connection_pool(access_data, n_connections)

    @classmethod
    def validate_connection(cls, access_data):
        """Validate if the connection data are correct."""
        try:
            connection = connect(
                user=access_data["user"],
                password=access_data["password"],
                host=access_data["host"],
                port=int(access_data["port"]),
                dbname=access_data["dbname"],
            )
            connection.close()
            return (True, None)
        except Error:
            return (False, "Database connection refused")

    def _create_connection_pool(self, access_data, n_connections):
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

    def get_connection_pool(self):
        """Return the connection pool."""
        return self._connection_pool


# Driver.validate_connection = classmethod(Driver.validate_connection)

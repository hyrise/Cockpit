"""The driver represents an interface to the database."""


from psycopg2 import Error, connect, pool


class Driver(object):
    """Interface to database."""

    def __init__(
        self,
        user: str,
        password: str,
        host: str,
        port: str,
        dbname: str,
        n_connections: int,
    ):
        """Initialize the connection."""
        self._user: str = user
        self._password: str = password
        self.host: str = host
        self.port: str = port
        self.dbname: str = dbname
        self._connection_pool = self._create_connection_pool(n_connections)

    @classmethod
    def validate_connection(
        cls, user: str, password: str, host: str, port: str, dbname: str
    ) -> bool:
        """Validate whether a connection can be established."""
        try:
            connect(
                user=user, password=password, host=host, port=port, dbname=dbname,
            ).close()
        except Error:
            return False
        return True

    def _create_connection_pool(self, n_connections: int) -> pool:
        """Create thread save connection pool."""
        connection_pool = pool.ThreadedConnectionPool(
            0,
            n_connections,
            user=self._user,
            password=self._password,
            host=self.host,
            port=self.port,
            dbname=self.dbname,
        )
        return connection_pool

    def get_connection_pool(self) -> pool:
        """Return the connection pool."""
        return self._connection_pool

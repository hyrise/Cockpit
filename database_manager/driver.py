"""The driver represents an interface to the database."""

import psycopg2


class Driver(object):
    """Driver for a Databasetype."""

    def __init__(self, user, password, host, port, dbname):
        """Initialize the connection."""
        self.connection = psycopg2.connect(
            user=self._user,
            password=self._password,
            host=self._host,
            port=self._port,
            dbname=self._dbname,
        )
        self.cur = self.connection.cursor()

    def execute(self, query):
        """Execute a cuery."""
        self.cur.execute(query)

    def get_storage_data(self):
        """Get storage data from database."""
        return "Dummy"

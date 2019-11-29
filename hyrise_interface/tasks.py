"""Module for executing tasks of a Queue.

Includes a HyriseWorker with a connection to a Hyrise DB.
Includes different tasks ready to be executed.
"""

from psycopg2 import connection

connection_pool = []
redis_connection_pool = []


class Cursor:
    """Custom cursor class. Gets a connection and closes it with 'with'."""

    def __init__(self, db_info):
        """Initialize a custom cursor."""
        self.db_info = db_info

    def __enter__(self):
        """Establish connection and cursor."""
        self.connection = connection(
            dbname=self.db_info["name"],
            user=self.db_info["user"],
            password=self.db_info["password"],
            host=self.db_info["host"],
            port=self.db_info["port"],
        )
        self.cursor = self.connection.cursor()
        return self

    def __exit__(self, type, value, traceback):
        """Close connection and cursor."""
        self.cursor.close()
        self.connection.close()

    def execute(self, *args, **kwargs):
        """Hand execution to the underlying cursor."""
        self.cursor.execute(*args, **kwargs)


def execute(db_info, *args, **kwargs):
    """Execute a SQL query."""
    with Cursor(db_info) as c:
        c.execute(*args, **kwargs)


def executemany(db_info, *args, **kwargs):
    """Execute many SQL queries."""
    with Cursor(db_info) as c:
        c.executemany(*args, **kwargs)

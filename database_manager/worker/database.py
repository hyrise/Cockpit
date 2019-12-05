"""Database data storage object.

Knows how to connect to itself.
"""
from abc import ABC, abstractmethod

from psycopg2 import connect


class Database(ABC):
    """A storage object for database connection data."""

    def __init__(self, user, password, host, port, dbname):
        """Initialize the connection attributes."""
        self._user = user
        self._password = password
        self._host = host
        self._port = port
        self._dbname = dbname

    def __repr__(self):
        """Identify by connection information."""
        return "{:s}:{:s}@{:s}:{:d}/{:s}".format(
            self._user, self._password, self._host, self._port, self._dbname
        )

    @abstractmethod
    def connect(self):
        """Establish a connection to the database."""
        pass


class HyriseDatabase(Database):
    """A storage object for Hyrise connection data."""

    def connect(self):
        """Establish a connection to the Hyrise database."""
        conn = connect(
            user=self._user,
            password=self._password,
            host=self._host,
            port=self._port,
            dbname=self._dbname,
        )
        conn.set_session(autocommit=True)
        return conn

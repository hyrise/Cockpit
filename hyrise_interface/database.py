"""Database data storage object.

Knows how to connect to itself.
"""
from abc import ABC, abstractmethod

from psycopg2 import connect


class Database(ABC):
    """A storage object for database connection data."""

    def __init__(self, user, password, host, port, dbname):
        """Initialize the connection attributes."""
        self.__user = user
        self.__password = password
        self.__host = host
        self.__port = port
        self.__dbname = dbname

    def __repr__(self):
        """Identify by connection information."""
        return "{:s}:{:s}@{:s}:{:d}/{:s}".format(
            self.__user, self.__password, self.__host, self.__port, self.__dbname
        )

    @abstractmethod
    def connect(self):
        """Establish a connection to the database."""
        pass


class HyriseDatabase(Database):
    """A storage object for Hyrise connection data."""

    def connect(self):
        """Establish a connection to the Hyrise database."""
        return connect(
            user=self.__user,
            password=self.__password,
            host=self.__host,
            port=self.__port,
            dbname=self.__dbname,
        )

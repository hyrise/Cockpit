"""The exeption module defines exeptions for database interactions."""

from typing import List

from psycopg2 import Error


class ConnectionNotValidException(Exception):
    """Exeption raised for invalid connection data."""

    def __init__(self, message: str, errors: List[Error]):
        """Initialize a ConnectionNotValidException."""
        self.errors = errors
        super().__init__(message)


class IdNotValidException(Exception):
    """Exeption raised for invalid id."""

    def __init__(self, message: str):
        """Initialize a IdNotValidException."""
        super().__init__(message)

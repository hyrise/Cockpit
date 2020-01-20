"""The exception module defines exceptions for database interactions."""

from typing import List

from psycopg2 import Error


class ConnectionNotValidException(Exception):
    """Exception raised for invalid connection data."""

    def __init__(self, message: str, errors: List[Error]):
        """Initialize a ConnectionNotValidException."""
        self.errors = errors
        super().__init__(message)


class IdNotValidException(Exception):
    """Exception raised for invalid id."""

    def __init__(self, message: str):
        """Initialize a IdNotValidException."""
        super().__init__(message)


class EmptyWorkloadFolderException(Exception):
    """Exception raised for empty workload folder."""

    def __init__(self, message: str):
        """Initialize a IdNotValidException."""
        super().__init__(message)


class NotExistingWorkloadFolderException(Exception):
    """Exception raised for empty workload folder."""

    def __init__(self, message: str):
        """Initialize a IdNotValidException."""
        super().__init__(message)


class QueryTypeNotFoundException(Exception):
    """Exception raised for invalid query type."""

    def __init__(self, message: str):
        """Initialize a QueryTypeNotFoundException."""
        super().__init__(message)

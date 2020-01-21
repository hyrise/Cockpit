"""The exception module defines exceptions for database interactions."""


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

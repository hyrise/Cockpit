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

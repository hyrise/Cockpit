"""The exception module defines exceptions for api name-spaces."""


class StatusCodeNotFoundException(Exception):
    """Exception raised for status code not found."""

    def __init__(self, message: str):
        """Initialize a StatusCodeNotFoundException."""
        super().__init__(message)

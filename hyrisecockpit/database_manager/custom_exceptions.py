"""The custom exeption module defines exeptions for database interactions."""


class ConnectionNotValidException(Exception):
    """Exeption raised for invalid connection data."""

    def __init__(self, message, errors):
        """Initialize a ConnectionNotValidException."""
        super().__init__(message)
        self.errors = errors


class IdNotValidException(Exception):
    """Exeption raised for invalid id."""

    def __init__(self, message):
        """Initialize a IdNotValidException."""
        super().__init__(message)

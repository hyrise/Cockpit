"""The exeption module defines exeptions for database interactions."""


class ConnectionNotValidException(Exception):
    """Exeption raised for invalid connection data."""

    def __init__(self, message, errors):
        """Initialize a ConnectionNotValidException."""
        self.errors = errors
        super().__init__(message)


class IdNotValidException(Exception):
    """Exeption raised for invalid id."""

    def __init__(self, message):
        """Initialize a IdNotValidException."""
        super().__init__(message)

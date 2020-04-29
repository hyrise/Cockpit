"""Enable mac osx support for testing."""
from sys import platform

if platform.startswith("darwin"):
    from unittest.mock import MagicMock as DefaultMagicMock

    class MagicMock(DefaultMagicMock):
        """Wrapper for MagicMock to make it pickable."""

        def __reduce__(self):
            """Make it useable in threaded context."""
            return (DefaultMagicMock, ())


if platform.startswith("linux"):
    from unittest.mock import MagicMock  # noqa

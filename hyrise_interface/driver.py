"""Drivers control real databases.

A driver uses analyzers to measure data about a database.
Includes a database object.
"""

from database import HyriseDatabase


class HyriseDriver(object):
    """A concrete Hyrise driver."""

    def __init__(self, id, user, password, host, port, dbname):
        """Initialize a Hyrise driver with a Hyrise db."""
        self._id = id
        self._database = HyriseDatabase(user, password, host, port, dbname)

    def __repr__(self):
        """Return identification, most useful information."""
        return f"Hyrise Driver {self._id}: {self._database}"

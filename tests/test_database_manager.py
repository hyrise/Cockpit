"""Tests for the database_manager module."""
from hyrisecockpit.database_manager.manager import DatabaseManager


class TestDatabaseManager:
    """Tests for the DatabaseManager class."""

    def test_initializes(self):
        """A DatabaseManager initializes."""
        database_manager = DatabaseManager()
        assert isinstance(database_manager, DatabaseManager)

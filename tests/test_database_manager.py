"""Tests for the database_manager module."""
from hyrisecockpit.database_manager.manager import DatabaseManager
from hyrisecockpit.settings import (
    DB_MANAGER_HOST,
    DB_MANAGER_PORT,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)


class TestDatabaseManager:
    """Tests for the DatabaseManager class."""

    def test_initializes(self):
        """A DatabaseManager initializes."""
        database_manager = DatabaseManager(
            DB_MANAGER_HOST, DB_MANAGER_PORT, WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT
        )
        assert isinstance(database_manager, DatabaseManager)

"""Tests for the database_manager module."""
from pytest import fixture
from zmq import Context, Socket

from hyrisecockpit.database_manager.manager import DatabaseManager
from hyrisecockpit.settings import (
    DB_MANAGER_HOST,
    DB_MANAGER_PORT,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)


class TestDatabaseManager:
    """Tests for the DatabaseManager class."""

    @fixture
    def database_manager(self) -> DatabaseManager:
        """Get a new DatabaseManager."""
        with DatabaseManager(
            DB_MANAGER_HOST, DB_MANAGER_PORT, WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT
        ) as database_manager:
            return database_manager

    def test_initializes(self, database_manager: DatabaseManager):
        """A DatabaseManager initializes."""
        assert isinstance(database_manager, DatabaseManager)

    def test_has_a_context(self, database_manager: DatabaseManager):
        """A DatabaseManager has a ZMQ Context."""
        assert isinstance(database_manager._context, Context)

    def test_has_a_socket(self, database_manager: DatabaseManager):
        """A DatabaseManager has a ZMQ Socket."""
        assert isinstance(database_manager._socket, Socket)

"""Tests for the database_manager module."""
from typing import Dict
from unittest.mock import patch

from pytest import fixture, mark
from zmq import Context, Socket

from hyrisecockpit.database_manager.database import Database
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

    @fixture
    def mock_database(self) -> Database:
        """Get a mock Database."""
        with patch(
            "hyrisecockpit.database_manager.database.Database"
        ) as mock_database_class:
            return mock_database_class()

    def test_initializes(self, database_manager: DatabaseManager):
        """A DatabaseManager initializes."""
        assert isinstance(database_manager, DatabaseManager)

    def test_has_a_context(self, database_manager: DatabaseManager):
        """A DatabaseManager has a ZMQ Context."""
        assert isinstance(database_manager._context, Context)

    def test_has_a_socket(self, database_manager: DatabaseManager):
        """A DatabaseManager has a ZMQ Socket."""
        assert isinstance(database_manager._socket, Socket)

    def test_has_no_databases(self, database_manager: DatabaseManager):
        """A DatabaseManager has no databases."""
        assert database_manager._databases == {}

    @mark.parametrize(
        "call",
        [
            "add database",
            "throughput",
            "storage",
            "system data",
            "delete database",
            "queue length",
            "chunks data",
            "failed tasks",
            "get databases",
        ],
    )
    def test_has_server_call(self, database_manager: DatabaseManager, call: str):
        """A DatabaseManager has a server call."""
        assert call in database_manager._server_calls.keys()

    @mark.parametrize(
        "call",
        [
            "throughput",
            "storage",
            "system data",
            "queue length",
            "chunks data",
            "failed tasks",
            "get databases",
        ],
    )
    def test_returns_a_successful_response_on_an_empty_call(
        self, database_manager: DatabaseManager, call
    ):
        """Returns a status 200 response on a call."""
        response = database_manager._server_calls[call]({})
        assert response["header"]["status"] == 200

    @mark.parametrize(
        "call", ["add database", "delete database"],
    )
    def test_returns_an_failing_response_on_an_empty_call(
        self, database_manager: DatabaseManager, call
    ):
        """Returns a status 400 response on a call."""
        response = database_manager._server_calls[call]({})
        assert response["header"]["status"] == 400

    def test_get_databases_returns_databases(
        self, database_manager: DatabaseManager, mock_database: Database
    ):
        """Returns previously added databases."""
        assert database_manager._databases == {}
        database_manager._databases["test_db1"] = mock_database
        assert database_manager._call_get_databases({})["body"]["databases"] == [
            "test_db1"
        ]
        database_manager._databases["test_db2"] = mock_database
        assert database_manager._call_get_databases({})["body"]["databases"] == [
            "test_db1",
            "test_db2",
        ]

    def test_delete_database_deletes_databases(
        self, database_manager: DatabaseManager, mock_database: Database
    ):
        """Deletes previously added databases."""
        assert database_manager._databases == {}
        database_manager._databases["test_db1"] = mock_database
        database_manager._databases["test_db2"] = mock_database
        call_delete = lambda id: database_manager._call_delete_database(  # noqa: E731
            {"id": id}
        )["header"]["status"]
        assert call_delete("test_db1") == 200
        assert database_manager._databases.keys() == {"test_db2"}
        assert call_delete("test_db1") == 400
        assert database_manager._databases.keys() == {"test_db2"}
        assert call_delete("test_db2") == 200
        assert database_manager._databases.keys() == set()
        assert call_delete("test_db2") == 400
        assert database_manager._databases.keys() == set()

    def test_call_not_found_returns_400(self, database_manager: DatabaseManager):
        """Call not found returns a response with status 400."""
        response: Dict = database_manager._call_not_found({})
        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"
        assert response["body"] == dict()

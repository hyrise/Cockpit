"""Tests for the database_manager module."""
from typing import Callable, Dict
from unittest.mock import patch

from pytest import fixture, mark
from zmq import Context, Socket

from hyrisecockpit.database_manager.database import Database
from hyrisecockpit.database_manager.manager import DatabaseManager
from hyrisecockpit.settings import (
    DB_MANAGER_HOST,
    DB_MANAGER_LISTENING,
    DB_MANAGER_PORT,
    DEFAULT_TABLES,
    GENERATOR_HOST,
    GENERATOR_LISTENING,
    GENERATOR_PORT,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)


class TestDatabaseManager:
    """Tests for the DatabaseManager class."""

    @fixture
    def database_manager(self) -> DatabaseManager:
        """Get a new DatabaseManager."""
        with DatabaseManager(
            DB_MANAGER_HOST,
            DB_MANAGER_LISTENING,
            DB_MANAGER_PORT,
            GENERATOR_HOST,
            GENERATOR_LISTENING,
            GENERATOR_PORT,
            WORKLOAD_SUB_HOST,
            WORKLOAD_PUBSUB_PORT,
            DEFAULT_TABLES,
        ) as database_manager:
            return database_manager

    @fixture
    def mock_database(self) -> Database:
        """Get a mock Database."""
        with patch(
            "hyrisecockpit.database_manager.database.Database"
        ) as mock_database_class:
            return mock_database_class()

    def convenience_data_call(
        self,
        database_manager: DatabaseManager,
        mock_database: Database,
        call: Callable,
        mock_data,
    ):
        """Check whether a data call works."""
        assert call() == dict()
        database_manager._databases["test_db1"] = mock_database
        assert call() == {"test_db1": mock_data}
        database_manager._databases["test_db2"] = mock_database
        assert call() == {"test_db1": mock_data, "test_db2": mock_data}

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
    def test_returns_a_failing_response_on_an_empty_call(
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
        assert response["body"]["error"] == "Call not found"

    def test_call_storage_returns_storage(
        self, database_manager: DatabaseManager, mock_database: Database
    ):
        """Returns storage of previously added databases."""
        call: Callable = lambda: database_manager._call_storage({})["body"]["storage"]
        mock_data = {"Tables": 21}
        mock_database.get_storage_data.return_value = mock_data  # type: ignore
        self.convenience_data_call(database_manager, mock_database, call, mock_data)

    def test_call_chunks_returns_chunks(
        self, database_manager: DatabaseManager, mock_database: Database
    ):
        """Returns chunks data of previously added databases."""
        call: Callable = lambda: database_manager._call_chunks_data({})["body"][
            "chunks_data"
        ]
        mock_data = {"Chunk": 84}
        mock_database.get_chunks_data.return_value = mock_data  # type: ignore
        self.convenience_data_call(database_manager, mock_database, call, mock_data)

    def test_call_queue_length_returns_queue_length(
        self, database_manager: DatabaseManager, mock_database: Database
    ):
        """Returns queue length of previously added databases."""
        call: Callable = lambda: database_manager._call_queue_length({})["body"][
            "queue_length"
        ]
        mock_data = {"queue length": 21}
        mock_database.get_queue_length.return_value = mock_data  # type: ignore
        self.convenience_data_call(database_manager, mock_database, call, mock_data)

    def test_call_system_data_returns_system_data(
        self, database_manager: DatabaseManager, mock_database: Database
    ):
        """Returns system data of previously added databases."""
        call: Callable = lambda: database_manager._call_system_data({})["body"][
            "system_data"
        ]
        mock_data = {"system data": {"cpu": 84.1, "ram": 23.7}}
        mock_database.get_system_data.return_value = mock_data  # type: ignore
        self.convenience_data_call(database_manager, mock_database, call, mock_data)

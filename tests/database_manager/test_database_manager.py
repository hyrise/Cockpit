"""Tests for the database_manager module."""
from typing import Callable, Dict
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.database_manager.database import Database
from hyrisecockpit.database_manager.manager import DatabaseManager

DB_MANAGER_LISTENING = "listening_host"
DB_MANAGER_PORT = "listening_port"
DEFAULT_TABLES = "default_tables"
STORAGE_HOST = "storage_host"
STORAGE_PASSWORD = "storage_password"
STORAGE_PORT = "storage_port"
STORAGE_USER = "storage_user"
WORKLOAD_PUBSUB_PORT = "pubsub_port"
WORKLOAD_SUB_HOST = "pubsub_host"


def fake_server_constructor(self, *args) -> None:
    """Fake server."""
    fake_server = MagicMock()
    fake_server.start.return_value = None
    fake_server.stop.return_value = None

    fake_server_constructor = MagicMock()
    fake_server_constructor.return_value = fake_server
    return fake_server_constructor


class TestDatabaseManager:
    """Tests for the DatabaseManager class."""

    @fixture
    @patch(
        "hyrisecockpit.database_manager.manager.Server", fake_server_constructor,
    )
    def database_manager(self) -> DatabaseManager:
        """Get a new DatabaseManager."""
        with DatabaseManager(
            DB_MANAGER_LISTENING,
            DB_MANAGER_PORT,
            WORKLOAD_SUB_HOST,
            WORKLOAD_PUBSUB_PORT,
            DEFAULT_TABLES,
            STORAGE_HOST,
            STORAGE_PASSWORD,
            STORAGE_PORT,
            STORAGE_USER,
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
        mock_data: Dict[str, int],
    ) -> None:
        """Check whether a data call works."""
        assert call() == {}
        database_manager._databases["test_db1"] = mock_database
        assert call() == {"test_db1": mock_data}
        database_manager._databases["test_db2"] = mock_database
        assert call() == {"test_db1": mock_data, "test_db2": mock_data}

    def test_initializes(self, database_manager: DatabaseManager) -> None:
        """A DatabaseManager initializes."""
        assert isinstance(database_manager, DatabaseManager)

    def test_has_no_databases(self, database_manager: DatabaseManager) -> None:
        """A DatabaseManager has no databases."""
        assert database_manager._databases == {}

    def test_get_databases_returns_databases(
        self, database_manager: DatabaseManager, mock_database: Database
    ) -> None:
        """Returns previously added databases."""
        assert database_manager._databases == {}
        database_manager._databases["test_db1"] = mock_database
        assert (
            database_manager._call_get_databases({})["body"]["databases"][0]["id"]
            == "test_db1"
        )
        database_manager._databases["test_db2"] = mock_database
        assert (
            database_manager._call_get_databases({})["body"]["databases"][0]["id"]
            == "test_db1"
        )
        assert (
            database_manager._call_get_databases({})["body"]["databases"][1]["id"]
            == "test_db2"
        )

    def test_delete_database_deletes_databases(
        self, database_manager: DatabaseManager, mock_database: Database
    ) -> None:
        """Deletes previously added databases."""
        assert database_manager._databases == {}
        database_manager._databases["test_db1"] = mock_database
        database_manager._databases["test_db2"] = mock_database
        assert (
            database_manager._call_delete_database({"id": "test_db1"})["header"][
                "status"
            ]
            == 200
        )
        assert database_manager._databases.keys() == {"test_db2"}
        assert (
            database_manager._call_delete_database({"id": "test_db1"})["header"][
                "status"
            ]
            == 404
        )
        assert database_manager._databases.keys() == {"test_db2"}
        assert (
            database_manager._call_delete_database({"id": "test_db2"})["header"][
                "status"
            ]
            == 200
        )
        assert database_manager._databases.keys() == set()
        assert (
            database_manager._call_delete_database({"id": "test_db2"})["header"][
                "status"
            ]
            == 404
        )
        assert database_manager._databases.keys() == set()

    def test_call_queue_length_returns_queue_length(
        self, database_manager: DatabaseManager, mock_database: Database
    ) -> None:
        """Returns queue length of previously added databases."""
        call: Callable = lambda: database_manager._call_queue_length({})["body"][
            "queue_length"
        ]
        mock_data = {"queue length": 21}
        mock_database.get_queue_length.return_value = mock_data  # type: ignore
        self.convenience_data_call(database_manager, mock_database, call, mock_data)

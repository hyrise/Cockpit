"""Tests for the database_manager module."""
from typing import Callable, Dict
from unittest.mock import MagicMock, patch

from pytest import fixture, mark

from hyrisecockpit.database_manager.database import Database
from hyrisecockpit.database_manager.manager import DatabaseManager
from hyrisecockpit.response import get_response

DB_MANAGER_LISTENING = "listening_host"
DB_MANAGER_PORT = "listening_port"
DEFAULT_TABLES = "default_tables"
STORAGE_HOST = "storage_host"
STORAGE_PASSWORD = "storage_password"
STORAGE_PORT = "storage_port"
STORAGE_USER = "storage_user"
WORKLOAD_PUBSUB_PORT = "pubsub_port"
WORKLOAD_SUB_HOST = "pubsub_host"


def fake_server_constructor(*args) -> MagicMock:
    """Fake server."""
    fake_server = MagicMock()
    fake_server.start.return_value = None
    fake_server.stop.return_value = None

    fake_server_constructor = MagicMock()
    fake_server_constructor.return_value = fake_server
    return fake_server_constructor


def fake_database(*args) -> MagicMock:
    """Fake server."""
    fake_database = MagicMock()
    fake_database.driver.dbname = "database_name"
    fake_database.driver.host = "database_host"
    fake_database.driver.port = 10000
    fake_database.number_workers = 8
    fake_database.close.return_value = None

    return fake_database


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
        assert database_manager._workload_sub_host == "pubsub_host"
        assert database_manager._workload_pubsub_port == "pubsub_port"
        assert database_manager._default_tables == "default_tables"
        assert database_manager._storage_host == "storage_host"
        assert database_manager._storage_port == "storage_port"
        assert database_manager._storage_user == "storage_user"
        assert database_manager._storage_password == "storage_password"

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

    @mark.parametrize(
        "call",
        [
            "add database",
            "delete database",
            "start worker",
            "close worker",
            "queue length",
            "get databases",
            "load data",
            "delete data",
            "status",
            "get plugins",
            "activate plugin",
            "deactivate plugin",
            "set plugin setting",
            "get plugin setting",
        ],
    )
    def test_has_server_call(
        self, database_manager: DatabaseManager, call: str
    ) -> None:
        """Assert DatabaseMnager has a specific call."""
        assert call in database_manager._get_server_calls().keys()

    @patch("hyrisecockpit.database_manager.manager.Driver.validate_connection")
    @patch("hyrisecockpit.database_manager.manager.Database")
    def test_call_add_database(
        self,
        mocked_database_constructor: MagicMock,
        mocked_validate_connection: MagicMock,
        database_manager: DatabaseManager,
    ) -> None:
        """Test add a database."""
        mocked_validate_connection.return_value = True
        body = {
            "id": "database_id",
            "user": "admin",
            "password": "12345678",
            "host": "database_host",
            "port": 5432,
            "dbname": "database_name",
            "number_workers": 8,
        }
        response = database_manager._call_add_database(body)

        mocked_database_constructor.assert_called()
        assert response == get_response(200)
        assert "database_id" in database_manager._databases.keys()

    @patch("hyrisecockpit.database_manager.manager.Driver.validate_connection")
    @patch("hyrisecockpit.database_manager.manager.Database")
    def test_call_add_database_with_invalid_connection(
        self,
        mocked_database_constructor: MagicMock,
        mocked_validate_connection: MagicMock,
        database_manager: DatabaseManager,
    ) -> None:
        """Test add a database with an invalid connection."""
        mocked_validate_connection.return_value = False
        body = {
            "id": "database_id",
            "user": "admin",
            "password": "12345678",
            "host": "database_host",
            "port": 5432,
            "dbname": "database_name",
            "number_workers": 8,
        }
        response = database_manager._call_add_database(body)

        mocked_database_constructor.assert_not_called()
        assert response == get_response(400)
        assert "database_id" not in database_manager._databases.keys()

    @patch("hyrisecockpit.database_manager.manager.Driver.validate_connection")
    @patch("hyrisecockpit.database_manager.manager.Database")
    def test_call_add_existing_database(
        self,
        mocked_database_constructor: MagicMock,
        mocked_validate_connection: MagicMock,
        database_manager: DatabaseManager,
    ) -> None:
        """Test add an existing database."""
        mocked_validate_connection.return_value = True
        body = {
            "id": "database_id",
            "user": "admin",
            "password": "12345678",
            "host": "database_host",
            "port": 5432,
            "dbname": "database_name",
            "number_workers": 8,
        }
        database_manager._databases["database_id"] = "Database"  # type: ignore
        response = database_manager._call_add_database(body)

        mocked_database_constructor.assert_not_called()
        assert response == get_response(400)

    def test_call_get_databases(self, database_manager: DatabaseManager) -> None:
        """Test get databases."""
        database_manager._databases["db1"] = fake_database()
        body: Dict = {}

        expected_databases = [
            {
                "id": "db1",
                "host": "database_host",
                "port": 10000,
                "number_workers": 8,
                "dbname": "database_name",
            }
        ]
        expected_response = get_response(200)
        expected_response["body"]["databases"] = expected_databases

        response = database_manager._call_get_databases(body)

        assert response == expected_response

    def test_delete_database(self, database_manager: DatabaseManager) -> None:
        """Test delete database."""
        database = fake_database()
        database_manager._databases["db1"] = database

        body: Dict = {"id": "db1"}

        response = database_manager._call_delete_database(body)

        assert get_response(200) == response
        assert list(database_manager._databases.values()) == []

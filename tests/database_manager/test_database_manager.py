"""Tests for the database_manager module."""
from typing import Callable, Dict, List
from unittest.mock import MagicMock, patch

from pytest import fixture, mark

from hyrisecockpit.database_manager.database import Database
from hyrisecockpit.database_manager.manager import DatabaseManager
from hyrisecockpit.response import get_error_response, get_response

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
    fake_server.close.return_value = None

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


def get_server_calls() -> List[str]:
    """Server calls of a DatabaseManager."""
    return [
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
    ]


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
        assert database_manager._workload_sub_host == WORKLOAD_SUB_HOST
        assert database_manager._workload_pubsub_port == WORKLOAD_PUBSUB_PORT
        assert database_manager._default_tables == DEFAULT_TABLES
        assert database_manager._storage_host == STORAGE_HOST
        assert database_manager._storage_port == STORAGE_PORT
        assert database_manager._storage_user == STORAGE_USER
        assert database_manager._storage_password == STORAGE_PASSWORD

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
        "call", get_server_calls(),
    )
    def test_has_server_call(
        self, database_manager: DatabaseManager, call: str
    ) -> None:
        """Assert DatabaseManager has a specific call."""
        assert call in database_manager._get_server_calls().keys()

    def test_has_no_additional_server_calls(
        self, database_manager: DatabaseManager
    ) -> None:
        """Assert DatabaseManager has no additional calls."""
        calls = get_server_calls()
        for call in database_manager._get_server_calls().keys():
            assert call in calls

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
            "user": "user",
            "password": "password",
            "host": "database_host",
            "port": 5432,
            "dbname": "database_name",
            "number_workers": 8,
        }
        response = database_manager._call_add_database(body)

        mocked_database_constructor.assert_called_once_with(
            "database_id",
            "user",
            "password",
            "database_host",
            5432,
            "database_name",
            8,
            "tcp://{:s}:{:s}".format(WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT,),
            DEFAULT_TABLES,
            STORAGE_HOST,
            STORAGE_PASSWORD,
            STORAGE_PORT,
            STORAGE_USER,
        )
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
        assert "db1" not in database_manager._databases.keys()

    def test_delete_not_existing_database(
        self, database_manager: DatabaseManager
    ) -> None:
        """Test delete not existing database."""
        body: Dict = {"id": "db1"}
        response = database_manager._call_delete_database(body)

        assert get_response(404) == response

    @patch(
        "hyrisecockpit.database_manager.manager.DatabaseManager._check_if_database_blocked"
    )
    def test_load_data_successful(
        self,
        mocked_check_if_database_blocked: MagicMock,
        database_manager: DatabaseManager,
    ) -> None:
        """Test load data successful."""
        mocked_check_if_database_blocked.return_value = False
        database = fake_database()
        database.load_data.return_value = True
        database_manager._databases["db1"] = database

        body: Dict = {"folder_name": "tpch_0.1"}
        response = database_manager._call_load_data(body)

        database.load_data.assert_called()
        assert get_response(200) == response

    @patch(
        "hyrisecockpit.database_manager.manager.DatabaseManager._check_if_database_blocked"
    )
    def test_load_data_unsuccessful(
        self,
        mocked_check_if_database_blocked: MagicMock,
        database_manager: DatabaseManager,
    ) -> None:
        """Test load data unsuccessful."""
        mocked_check_if_database_blocked.return_value = False
        database = fake_database()
        database.load_data.return_value = False
        database_manager._databases["db1"] = database

        body: Dict = {"folder_name": "tpch_0.1"}
        response = database_manager._call_load_data(body)

        database.load_data.assert_called()
        assert get_response(400) == response

    @patch(
        "hyrisecockpit.database_manager.manager.DatabaseManager._check_if_database_blocked"
    )
    def test_load_data_when_database_blocked(
        self,
        mocked_check_if_database_blocked: MagicMock,
        database_manager: DatabaseManager,
    ) -> None:
        """Test load data when database is blocked."""
        mocked_check_if_database_blocked.return_value = True
        database = fake_database()
        database.delete_data.return_value = True
        database_manager._databases["db1"] = database
        body: Dict = {"folder_name": "tpch_0.1"}
        response = database_manager._call_load_data(body)

        database.delete_data.assert_not_called()
        assert get_error_response(400, "Already loading data") == response

    @patch(
        "hyrisecockpit.database_manager.manager.DatabaseManager._check_if_database_blocked"
    )
    def test_delete_data_successful(
        self,
        mocked_check_if_database_blocked: MagicMock,
        database_manager: DatabaseManager,
    ) -> None:
        """Delete data successful."""
        mocked_check_if_database_blocked.return_value = False
        database = fake_database()
        database.delete_data.return_value = True
        database_manager._databases["db1"] = database

        body: Dict = {"folder_name": "tpch_0.1"}
        response = database_manager._call_delete_data(body)

        database.delete_data.assert_called()
        assert get_response(200) == response

    @patch(
        "hyrisecockpit.database_manager.manager.DatabaseManager._check_if_database_blocked"
    )
    def test_delete_data_unsuccessful(
        self,
        mocked_check_if_database_blocked: MagicMock,
        database_manager: DatabaseManager,
    ) -> None:
        """Delete data unsuccessful."""
        mocked_check_if_database_blocked.return_value = False
        database = fake_database()
        database.delete_data.return_value = False
        database_manager._databases["db1"] = database

        body: Dict = {"folder_name": "tpch_0.1"}
        response = database_manager._call_delete_data(body)

        database.delete_data.assert_called()
        assert get_response(400) == response

    @patch(
        "hyrisecockpit.database_manager.manager.DatabaseManager._check_if_database_blocked"
    )
    def test_delete_data_when_database_blocked(
        self,
        mocked_check_if_database_blocked: MagicMock,
        database_manager: DatabaseManager,
    ) -> None:
        """Delete data when database blocked."""
        mocked_check_if_database_blocked.return_value = True
        database = fake_database()
        database.delete_data.return_value = True
        database_manager._databases["db1"] = database

        body: Dict = {"folder_name": "tpch_0.1"}
        response = database_manager._call_delete_data(body)

        database.delete_data.assert_not_called()
        assert get_error_response(400, "Already loading data") == response

    def test_call_status(self, database_manager: DatabaseManager) -> None:
        """Call status."""
        database = fake_database()
        database.get_database_blocked.return_value = 0
        database.get_hyrise_active.return_value = True
        database.get_worker_pool_status.return_value = "closed"
        database.get_loaded_benchmarks.return_value = ["tpch_0.1"]
        database.get_loaded_tables.return_value = [
            {"table_name": "customer", "benchmark": "tpch_0.1"}
        ]
        database_manager._databases["db1"] = database

        expected_status = [
            {
                "id": "db1",
                "hyrise_active": True,
                "database_blocked_status": 0,
                "worker_pool_status": "closed",
                "loaded_benchmarks": ["tpch_0.1"],
                "loaded_tables": [{"table_name": "customer", "benchmark": "tpch_0.1"}],
            }
        ]
        expected_response = get_response(200)
        expected_response["body"]["status"] = expected_status
        body: Dict = {}
        response = database_manager._call_status(body)

        assert expected_response == response

    def test_call_get_plugins(self, database_manager: DatabaseManager) -> None:
        """Call get plugins."""
        database = fake_database()
        database.get_plugins.return_value = ["Plugin1", "Plugin2"]
        database_manager._databases["db1"] = database

        expected_plugins = [{"id": "db1", "plugins": ["Plugin1", "Plugin2"]}]
        expected_response = get_response(200)
        expected_response["body"]["plugins"] = expected_plugins
        body: Dict = {}
        response = database_manager._call_get_plugins(body)

        assert expected_response == response

    def test_call_activate_plugin(self, database_manager: DatabaseManager) -> None:
        """Call activate plugin."""
        database = fake_database()
        database.activate_plugin.return_value = True
        database_manager._databases["db1"] = database

        body: Dict = {"id": "db1", "plugin": "pluginName"}
        response = database_manager._call_activate_plugin(body)

        assert get_response(200) == response

    def test_call_activate_plugin_unsuccessful(
        self, database_manager: DatabaseManager
    ) -> None:
        """Call activate plugin unsuccessful."""
        database = fake_database()
        database.activate_plugin.return_value = False
        database_manager._databases["db1"] = database

        body: Dict = {"id": "db1", "plugin": "pluginName"}
        response = database_manager._call_activate_plugin(body)

        assert get_response(423) == response

    def test_call_activate_plugin_on_not_existing_database(
        self, database_manager: DatabaseManager
    ) -> None:
        """Call activate plugin on not existing database."""
        body: Dict = {"id": "db1", "plugin": "pluginName"}
        response = database_manager._call_activate_plugin(body)

        assert get_response(400) == response

    def test_call_deactivate_plugin(self, database_manager: DatabaseManager) -> None:
        """Call deactivate plugin."""
        database = fake_database()
        database.deactivate_plugin.return_value = True
        database_manager._databases["db1"] = database

        body: Dict = {"id": "db1", "plugin": "pluginName"}
        response = database_manager._call_deactivate_plugin(body)

        assert get_response(200) == response

    def test_call_deactivate_plugin_unsuccessful(
        self, database_manager: DatabaseManager
    ) -> None:
        """Call deactivate plugin unsuccessful."""
        database = fake_database()
        database.deactivate_plugin.return_value = False
        database_manager._databases["db1"] = database

        body: Dict = {"id": "db1", "plugin": "pluginName"}
        response = database_manager._call_deactivate_plugin(body)

        assert get_response(423) == response

    def test_call_deactivate_plugin_on_not_existing_database(
        self, database_manager: DatabaseManager
    ) -> None:
        """Call deactivate plugin on not existing database."""
        body: Dict = {"id": "db1", "plugin": "pluginName"}
        response = database_manager._call_deactivate_plugin(body)

        assert get_response(400) == response

    def test_call_get_plugin_setting(self, database_manager: DatabaseManager) -> None:
        """Call get plugin setting."""
        database = fake_database()
        database.get_plugin_setting.return_value = [
            {
                "name": "plugin_name",
                "value": "plugin_value",
                "description": "plugin_description",
            }
        ]
        database_manager._databases["db1"] = database
        expected_plugin_settings = [
            {
                "id": "db1",
                "plugin_settings": [
                    {
                        "name": "plugin_name",
                        "value": "plugin_value",
                        "description": "plugin_description",
                    }
                ],
            }
        ]
        expected_response = get_response(200)
        expected_response["body"]["plugin_settings"] = expected_plugin_settings
        body: Dict = {}
        response = database_manager._call_get_plugin_setting(body)

        assert expected_response == response

    def test_check_database_blocked(self, database_manager: DatabaseManager):
        """Test check if database blocked."""
        database = fake_database()
        database.get_database_blocked.return_value = True
        database_manager._databases["db1"] = database

        assert database_manager._check_if_database_blocked()

    def test_check_database_unblocked(self, database_manager: DatabaseManager):
        """Test check if database blocked."""
        database = fake_database()
        database.get_database_blocked.return_value = False
        database_manager._databases["db1"] = database

        assert not database_manager._check_if_database_blocked()

    def test_call_start_worker_successful(self, database_manager: DatabaseManager):
        """Test start worker successful."""
        database = fake_database()
        database.start_worker.return_value = True
        database_manager._databases["db1"] = database
        body: Dict = {}
        response = database_manager._call_start_worker(body)

        assert get_response(200) == response

    def test_call_start_worker_unsuccessful(self, database_manager: DatabaseManager):
        """Test start worker unsuccessful."""
        database = fake_database()
        database.start_worker.return_value = False
        database_manager._databases["db1"] = database
        body: Dict = {}
        response = database_manager._call_start_worker(body)

        assert get_response(400) == response

    def test_call_close_worker_successful(self, database_manager: DatabaseManager):
        """Test stop worker successful."""
        database = fake_database()
        database.close_worker.return_value = True
        database_manager._databases["db1"] = database
        body: Dict = {}
        response = database_manager._call_close_worker(body)

        assert get_response(200) == response

    def test_call_close_worker_unsuccessful(self, database_manager: DatabaseManager):
        """Test close worker unsuccessful."""
        database = fake_database()
        database.close_worker.return_value = False
        database_manager._databases["db1"] = database
        body: Dict = {}
        response = database_manager._call_close_worker(body)

        assert get_response(400) == response

    def test_start_server(self, database_manager: DatabaseManager):
        """Test start server."""
        fake_server = MagicMock()
        fake_server.start.return_value = False
        database_manager._server = fake_server
        database_manager.start()

        fake_server.start.assert_called_once()

    def test_close_server(self, database_manager: DatabaseManager):
        """Test close server."""
        database = fake_database()
        database.close_worker.return_value = False
        database_manager._databases["db1"] = database

        fake_server = MagicMock()
        fake_server.close.return_value = False
        database_manager._server = fake_server

        database_manager.close()

        fake_server.close.assert_called_once()
        database.close.assert_called_once()

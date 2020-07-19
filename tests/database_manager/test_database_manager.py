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
    mocked_connection_information = {
        "id": "database_id",
        "host": "database_host",
        "port": "10000",
        "dbname": "database_name",
        "user": "Jack Black",
        "password": "password1234",
    }

    fake_database.connection_information = mocked_connection_information
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
        "get plugins",
        "activate plugin",
        "deactivate plugin",
        "set plugin setting",
        "execute sql query",
        "database status",
        "workload status",
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

    @patch("hyrisecockpit.database_manager.manager.PoolCursor.validate_connection")
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

    @patch("hyrisecockpit.database_manager.manager.PoolCursor.validate_connection")
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

    @patch("hyrisecockpit.database_manager.manager.PoolCursor.validate_connection")
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
            "port": "5432",
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
                "port": "10000",
                "number_workers": 8,
                "dbname": "database_name",
                "user": "Jack Black",
                "password": "password1234",
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

        body: Dict = {"workload_type": "tpch", "scale_factor": 1.0}
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

        body: Dict = {"workload_type": "tpch", "scale_factor": 1.0}
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
        body: Dict = {"workload_type": "tpch", "scale_factor": 1.0}
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

        body: Dict = {"workload_type": "tpch", "scale_factor": 1.0}
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

        body: Dict = {"workload_type": "tpch", "scale_factor": 1.0}
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

        body: Dict = {"workload_type": "tpch", "scale_factor": 1.0}
        response = database_manager._call_delete_data(body)

        database.delete_data.assert_not_called()
        assert get_error_response(400, "Already loading data") == response

    def test_call_get_detailed_plugins(self, database_manager: DatabaseManager) -> None:
        """Call get plugins."""
        database = fake_database()
        database.get_detailed_plugins.return_value = {
            "Compression": [
                {"name": "MemoryBudget", "value": "55555", "description": "..."}
            ],
            "Clustering": [],
        }
        database_manager._databases["db1"] = database

        expected_plugins = [
            {
                "id": "db1",
                "plugins": {
                    "Compression": [
                        {
                            "name": "MemoryBudget",
                            "value": "55555",
                            "description": "...",
                        }
                    ],
                    "Clustering": [],
                },
            }
        ]
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

    def test_calls_execute_sql_query(self, database_manager: DatabaseManager) -> None:
        """Test call execute sql query."""
        fake_body = {
            "id": "just some ordinary database",
            "query": "SELECT what_is_the_meaning_of_everything FROM all_the_answers_to _all_the_question",
        }
        mocked_database = MagicMock()
        mocked_database.execute_sql_query.return_value = [
            ("42 of course"),
        ]
        database_manager._databases = {"just some ordinary database": mocked_database}

        expected = get_response(200)
        expected["body"]["results"] = [
            ("42 of course"),
        ]

        response = database_manager._call_execute_sql_query(fake_body)

        mocked_database.execute_sql_query.assert_called_once_with(
            "SELECT what_is_the_meaning_of_everything FROM all_the_answers_to _all_the_question"
        )
        assert expected == response

    def test_calls_execute_sql_query_on_not_existing_database(
        self, database_manager: DatabaseManager
    ) -> None:
        """Test call execute sql query on not existing database."""
        fake_body = {
            "id": "just some ordinary database",
            "query": "SELECT when_can_i_get_out_? FROM all_the_answers_to _all_the_question",
        }
        database_manager._databases = {}

        expected = get_response(404)
        response = database_manager._call_execute_sql_query(fake_body)

        assert expected == response

    def test_calls_database_status(self, database_manager: DatabaseManager) -> None:
        """Test calls hyrise status."""
        fake_database = MagicMock()
        fake_database.get_hyrise_active.return_value = True
        fake_database.get_database_blocked.return_value = True
        fake_database.get_worker_pool_status.return_value = "running"
        database_manager._databases = {"fake_db_id": fake_database}

        response = database_manager._call_database_status({})
        assert response["body"]["database_status"][0]["id"] == "fake_db_id"
        assert response["body"]["database_status"][0]["database_blocked_status"]
        assert response["body"]["database_status"][0]["worker_pool_status"] == "running"
        assert response["body"]["database_status"][0]["hyrise_active"]
        assert response["header"]["status"] == 200

    def test_calls_workload_status(self, database_manager: DatabaseManager) -> None:
        """Test calls workload status."""
        fake_database = MagicMock()
        fake_database.get_loaded_workload_data.return_value = (
            [
                {
                    "workload_type": "tpch",
                    "scale_factor": 1.0,
                    "loaded_tables": ["a", "b"],
                }
            ],
            [
                {"workload_type": "tpch", "scale_factor": 1.0},
                {"workload_type": "tpcds", "scale_factor": 0.1},
            ],
        )
        database_manager._databases = {"fake_db_id": fake_database}

        response = database_manager._call_workload_status({})
        assert response["body"]["workload_status"][0]["id"] == "fake_db_id"
        assert response["body"]["workload_status"][0]["loaded_workloads"] == [
            {"workload_type": "tpch", "scale_factor": 1.0},
            {"workload_type": "tpcds", "scale_factor": 0.1},
        ]
        assert response["body"]["workload_status"][0]["loaded_tables"] == [
            {"workload_type": "tpch", "scale_factor": 1.0, "loaded_tables": ["a", "b"]}
        ]
        assert response["header"]["status"] == 200

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

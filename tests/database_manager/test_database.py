"""Tests for the database module."""

from collections import Counter
from multiprocessing.sharedctypes import Synchronized as ValueType
from typing import Dict, List, Optional
from unittest.mock import MagicMock, patch

from psycopg2 import DatabaseError, Error, InterfaceError
from pytest import fixture, mark

from hyrisecockpit.database_manager.database import Database

database_id: str = "MongoDB forever"
database_user: str = "Proform"
database_password: str = "passwort"
database_host: str = "nsa"
database_port: str = "666"
database_name: str = "MongoDB"
number_workers: int = 42
workload_publisher_url: str = "lothar matthäus"
default_tables: str = "Watt_ihr_Volt"
storage_host: str = "xulfni"
storage_password: str = "1234"
storage_port: str = "42"
storage_user: str = "Käptin Blaubär"

mocked_pool_cur: MagicMock = MagicMock()
mocked_pool_cur.fetchall.return_value = []


def get_fake_tables() -> Dict:
    """Return fake table dictionary."""
    fake_dict: Dict[str, List[str]] = {
        "alternative": [
            "The Dough Rollers",
            "Broken Witt Rebels",
            "Bonny Doon",
            "Jack White",
        ],
        "Rock": ["Gary Clark Jr.", "Greta Van Fleet", "Tenacious D"],
    }
    return fake_dict


def get_fake_background_job_manager(*args) -> MagicMock:
    """Return fake  BackgroundJobManager."""
    mocked_job_manager: MagicMock = MagicMock()
    mocked_job_manager.start.side_effect = None
    mocked_job_manager.load_tables.side_effect = None
    return mocked_job_manager


class TestDatabase(object):
    """Tests for the Database class."""

    @fixture
    @patch(
        "hyrisecockpit.database_manager.database.BackgroundJobManager",
        get_fake_background_job_manager,
    )
    @patch("hyrisecockpit.database_manager.database.WorkerPool", MagicMock())
    @patch("hyrisecockpit.database_manager.database.ConnectionFactory", MagicMock())
    @patch(
        "hyrisecockpit.database_manager.database.Database._initialize_influx",
        MagicMock(),
    )
    def database(self) -> Database:
        """Get a new Database."""
        return Database(
            database_id,
            database_user,
            database_password,
            database_host,
            database_port,
            database_name,
            number_workers,
            workload_publisher_url,
            default_tables,
            storage_host,
            storage_password,
            storage_port,
            storage_user,
        )

    def test_inintializes_database(self, database: Database) -> None:
        """Test initialization of database attributes."""
        assert database._id == database_id
        assert database.number_workers == number_workers
        assert database._default_tables == default_tables
        assert type(database._database_blocked) is ValueType
        assert type(database._hyrise_active) is ValueType
        assert database._hyrise_active.value
        assert not database._database_blocked.value
        database._background_scheduler.start.assert_called_once()  # type: ignore

    def test_gets_worker_pool_queue_length(self, database: Database) -> None:
        """Test return of queue length from worker pool."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_queue_length.return_value = 42
        database._worker_pool = mocked_worker_pool

        result: int = database.get_queue_length()

        assert type(result) is int
        assert result == 42

    def test_loads_data_while_worker_pool_is_closed_and_load_table_is_successful(
        self, database: Database
    ) -> None:
        """Test loading data while worker pool is closed and background scheduler is returning true."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.load_data(fake_workload)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_called_once_with("tpch", 1.0)
        assert type(result) is bool
        assert result

    def test_loads_data_while_worker_pool_is_running(self, database: Database) -> None:
        """Test loading data while worker pool is running."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.load_data(fake_workload)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_loads_data_with_no_valid_workload_type(self, database: Database) -> None:
        """Test load data with no valid workload type."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpcc_not_valid", "scale_factor": 1.0}
        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.load_data(fake_workload)

        mocked_background_scheduler.load_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_loads_data_while_worker_pool_is_closed_and_load_table_failed(
        self, database: Database
    ) -> None:
        """Test loading data while worker pool is running."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.load_tables.return_value = False
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.load_data(fake_workload)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_called_once_with("tpch", 1.0)
        assert type(result) is bool
        assert not result

    def test_deletes_data_while_worker_pool_is_closed_and_load_table_is_successful(
        self, database: Database
    ) -> None:
        """Test delete of data while worker pool is closed and background scheduler is returning true."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.delete_tables.return_value = True
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.delete_data(fake_workload)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_called_once_with("tpch", 1.0)
        assert type(result) is bool
        assert result

    def test_deletes_data_while_worker_pool_is_running(
        self, database: Database
    ) -> None:
        """Test delete of  data while worker pool is running."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.delete_tables.return_value = True
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.delete_data(fake_workload)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_delete_data_with_no_valid_workload_type(self, database: Database) -> None:
        """Test delete data with no valid workload type."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpcc_not_valid", "scale_factor": 1.0}
        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.delete_data(fake_workload)

        mocked_background_scheduler.delete_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_deletes_data_while_worker_pool_is_closed_and_load_table_failed(
        self, database: Database
    ) -> None:
        """Test delete of  data while worker pool is running."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.delete_tables.return_value = False
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.delete_data(fake_workload)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_called_once_with("tpch", 1.0)
        assert type(result) is bool
        assert not result

    def test_activates_plugin_with_success(self, database: Database) -> None:
        """Test entry point for plug-in activation with success."""
        mock_background_scheduler: MagicMock = MagicMock()
        mock_background_scheduler.activate_plugin.return_value = True
        mock_get_plugins = MagicMock()
        mock_get_plugins.return_value = []
        database._background_scheduler = mock_background_scheduler
        database._get_plugins = mock_get_plugins  # type: ignore
        fake_plugin: str = "Coolputer"

        result: bool = database.activate_plugin(fake_plugin)

        mock_background_scheduler.activate_plugin.assert_called_once_with(fake_plugin)
        assert type(result) is bool
        assert result

    def test_activates_plugin_with_no_success(self, database: Database) -> None:
        """Test entry point for plug-in activation with no success."""
        mock_background_scheduler: MagicMock = MagicMock()
        mock_background_scheduler.activate_plugin.return_value = False
        mock_get_plugins = MagicMock()
        mock_get_plugins.return_value = []
        database._background_scheduler = mock_background_scheduler
        database._get_plugins = mock_get_plugins  # type: ignore
        fake_plugin: str = "Coolputer"

        result: bool = database.activate_plugin(fake_plugin)

        mock_background_scheduler.activate_plugin.assert_called_once_with(fake_plugin)
        assert type(result) is bool
        assert not result

    def test_activates_already_loaded_plugin_with_no_success(
        self, database: Database
    ) -> None:
        """Test entry point for plug-in activation of the already loaded plugin with no success."""
        mock_background_scheduler: MagicMock = MagicMock()
        mock_background_scheduler.activate_plugin.return_value = False
        mock_get_plugins = MagicMock()
        mock_get_plugins.return_value = ["Coolputer"]
        database._background_scheduler = mock_background_scheduler
        database._get_plugins = mock_get_plugins  # type: ignore
        fake_plugin: str = "Coolputer"

        result: bool = database.activate_plugin(fake_plugin)

        mock_background_scheduler.activate_plugin.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_deactivats_plugin_with_success(self, database: Database) -> None:
        """Test entry point for plug-in deactivation with success."""
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.deactivate_plugin.return_value = True
        fake_plugin: str = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.deactivate_plugin(fake_plugin)

        mocked_background_scheduler.deactivate_plugin.assert_called_once_with(
            fake_plugin
        )
        assert type(result) is bool
        assert result

    def test_deactivats_plugin_with_no_success(self, database: Database) -> None:
        """Test entry point for plug-in deactivation with no success."""
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.deactivate_plugin.return_value = False
        fake_plugin: str = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.deactivate_plugin(fake_plugin)

        mocked_background_scheduler.deactivate_plugin.assert_called_once_with(
            fake_plugin
        )
        assert type(result) is bool
        assert not result

    def test_gets_blocked_database_status(self, database: Database) -> None:
        """Test return value for blocked database."""
        database._database_blocked.value = False
        result: bool = database.get_database_blocked()

        assert type(result) is bool
        assert not result

    def test_gets_unblocked_database_status(self, database: Database) -> None:
        """Test return value for unblocked database."""
        database._database_blocked.value = True
        result: bool = database.get_database_blocked()

        assert type(result) is bool
        assert result

    def test_gets_loaded_workloads_and_tables(self, database: Database) -> None:
        """Test get loaded benchmark for present benchmarks."""
        mock_driver_all_tables_loaded = MagicMock()
        mock_driver_all_tables_loaded.get_table_names.return_value = {
            "customer": "customer_tpch_1",
            "item": "item_tpch_1",
        }
        mock_driver_all_tables_loaded.scale_factors = [1.0]
        mock_driver_not_all_tables_loaded = MagicMock()
        mock_driver_not_all_tables_loaded.get_table_names.return_value = {
            "Gary": "gary_rock_1",
            "Clark": "clark_rock_1",
        }
        mock_driver_not_all_tables_loaded.scale_factors = [1.0]
        database._workload_drivers = {
            "tpch": mock_driver_all_tables_loaded,
            "rock": mock_driver_not_all_tables_loaded,
        }
        fake_loaded_tables = ["customer_tpch_1", "item_tpch_1", "gary_rock_1"]

        expected = [
            {
                "workload_type": "tpch",
                "scale_factor": 1.0,
                "loaded_tables": ["customer", "item"],
                "missing_tables": [],
                "completely_loaded": True,
                "database_representation": {
                    "customer": "customer_tpch_1",
                    "item": "item_tpch_1",
                },
            },
            {
                "workload_type": "rock",
                "scale_factor": 1.0,
                "loaded_tables": ["Gary"],
                "missing_tables": ["Clark"],
                "completely_loaded": False,
                "database_representation": {
                    "Gary": "gary_rock_1",
                    "Clark": "clark_rock_1",
                },
            },
        ]

        results: List = database._workoad_tables_status(fake_loaded_tables)
        assert results == expected

    def test_gets_worker_pool_status(self, database: Database) -> None:
        """Test return of worker pool status."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        database._worker_pool = mocked_worker_pool

        result: str = database.get_worker_pool_status()

        assert type(result) is str
        assert result == "running"

    def test_gets_loaded_tables(self, database: Database) -> None:
        """Test get loaded tables."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        mock_cursor.fetchall.return_value = [("hallo", "type",), ("world", "boring",)]
        database._connection_factory = mock_connection_factory

        results = database.get_loaded_tables_in_database()

        mock_cursor.execute.assert_called_once_with("select * from meta_tables;", None)
        assert results == ["hallo", "world"]  # type: ignore

    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_gets_loaded_tables_with_exception(
        self, database: Database, exceptions
    ) -> None:
        """Test get loaded tables with exception."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory

        results = database.get_loaded_tables_in_database()

        mock_cursor.execute.assert_called_once_with("select * from meta_tables;", None)
        assert results == []

    def test_gets_hyrise_active(self, database: Database) -> None:
        """Test get hyrise active status."""
        database._hyrise_active.value = True
        result: bool = database.get_hyrise_active()

        assert type(result) is bool
        assert result

    def test_starts_successful_worker(self, database: Database) -> None:
        """Test start of successful worker."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.start.return_value = True
        database._worker_pool = mocked_worker_pool
        result: bool = database.start_worker()

        mocked_worker_pool.start.assert_called_once()
        assert type(result) is bool
        assert result

    def test_starts_unsuccessful_worker(self, database: Database) -> None:
        """Test start of unsuccessful worker."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.start.return_value = False
        database._worker_pool = mocked_worker_pool
        result: bool = database.start_worker()

        mocked_worker_pool.start.assert_called_once()
        assert type(result) is bool
        assert not result

    def test_closes_successful_worker(self, database: Database) -> None:
        """Test successful close of worker."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.close.return_value = True
        database._worker_pool = mocked_worker_pool
        result: bool = database.close_worker()

        mocked_worker_pool.close.assert_called_once()
        assert type(result) is bool
        assert result

    def test_closes_unsuccessful_worker(self, database: Database) -> None:
        """Test unsuccessful close of worker."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.close.return_value = False
        database._worker_pool = mocked_worker_pool
        result: bool = database.close_worker()

        mocked_worker_pool.close.assert_called_once()
        assert type(result) is bool
        assert not result

    def test_gets_plugins_when_database_unblocked_and_no_plugins_exists(
        self, database: Database
    ) -> None:
        """Test get not existing plug-ins."""
        mock_cursor = MagicMock()
        mock_cursor.fetchall.return_value = []
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = False

        result: Optional[List] = database._get_plugins()

        mock_cursor.execute.assert_called_once_with(
            ("SELECT name FROM meta_plugins;"), None
        )
        assert type(result) is list
        assert result == []

    def test_gets_plugins_when_database_unblocked_and_plugins_exists(
        self, database: Database
    ) -> None:
        """Test get existing plug-ins."""
        mock_cursor = MagicMock()
        mock_cursor.fetchall.return_value = [
            ("Hildegunst von Mythenmetz", "Lindwurm", "sprachliche Begabung",),
            (
                "Rumo von Zamonien",
                "Wolpertinger",
                "gute Schachspieler und gute Kämpfer",
            ),
        ]
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = False

        expected: List[str] = ["Hildegunst von Mythenmetz", "Rumo von Zamonien"]
        result: Optional[List] = database._get_plugins()

        assert type(result) is list
        assert Counter(result) == Counter(expected)

    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_gets_plugins_when_database_throws_exception(
        self, database: Database, exceptions
    ) -> None:
        """Test get existing plug-ins when database throws exception."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = False

        result: Optional[List] = database._get_plugins()

        assert result is None

    def test_sets_plugin_setting_when_database_is_unblocked(
        self, database: Database
    ) -> None:
        """Test set plug-in setting while the database is not blocked."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = False

        result: bool = database.set_plugin_setting(
            "Compression", "MemoryBudget", "55555"
        )

        mock_cursor.execute.assert_called_once_with(
            "UPDATE meta_settings SET value=%s WHERE name=%s;",
            ("55555", "Plugin::Compression::MemoryBudget",),
        )

        assert type(result) is bool
        assert result

    def test_set_plugin_settings_when_database_blocked(
        self, database: Database
    ) -> None:
        """Test set plug-in setting while the database is blocked."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = True

        result: bool = database.set_plugin_setting(
            "Compression", "MemoryBudget", "55555"
        )

        mock_cursor.execute.assert_not_called()

        assert type(result) is bool
        assert not result

    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_sets_plugin_settings_when_database_throws_exception(
        self, database: Database, exceptions
    ) -> None:
        """Test sets plug-in settings when database throws exception."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = True

        mock_cursor.execute.side_effect = raise_exception
        database._database_blocked.value = False
        result: bool = database.set_plugin_setting(
            "Compression", "MemoryBudget", "55555"
        )

        assert not result

    def test_gets_plugins_settings_when_database_unblocked_and_no_plugins_exist(
        self, database: Database
    ) -> None:
        """Test get not existing plug-ins settings."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = False

        result = database._get_plugin_setting()

        mock_cursor.execute.assert_called_once_with(
            "SELECT name, value, description FROM meta_settings WHERE name LIKE 'Plugin::%';",
            None,
        )

        assert isinstance(result, dict)
        assert result == {}

    def test_gets_plugins_settings_when_database_unblocked_and_plugins_exist(
        self, database: Database
    ) -> None:
        """Test get existing plug-ins settings."""
        mock_cursor = MagicMock()
        mock_cursor.fetchall.return_value = [
            ("Plugin::Compression::MemoryBudget", "55555", "..."),
            ("Plugin::Something::SomeSetting", "true", "this should show up"),
        ]
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = False

        expected = {
            "Compression": [
                {"name": "MemoryBudget", "value": "55555", "description": "..."}
            ],
            "Something": [
                {
                    "name": "SomeSetting",
                    "value": "true",
                    "description": "this should show up",
                }
            ],
        }

        result = database._get_plugin_setting()

        assert isinstance(result, dict)
        assert result == expected

    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_gets_plugin_settings_when_database_throws_exception(
        self, database: Database, exceptions
    ) -> None:
        """Test gets plugin settings when database throws exception."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = False

        result = database._get_plugin_setting()

        assert result is None

    def test_executes_sql_query(self, database: Database) -> None:
        """Test execute sql query."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = False

        database._id = "Identification?"
        mock_cursor.fetchall.return_value = [
            (
                "I'm planning to make a film series on databases",
                "I've got the first part ready, but I can't think of a SQL.",
                None,
                42,
            )
        ]
        mock_cursor.fetch_column_names.return_value = ["bad", "joke"]

        expected = {
            "id": "Identification?",
            "successful": True,
            "results": [
                [
                    "I'm planning to make a film series on databases",
                    "I've got the first part ready, but I can't think of a SQL.",
                    "None",
                    "42",
                ]
            ],
            "col_names": ["bad", "joke"],
            "error_message": "",
        }

        result = database.execute_sql_query("SELECT funny FROM not_funny")

        assert expected == result

    def test_executes_sql_query_with_throwing_exception(
        self, database: Database
    ) -> None:
        """Test execute sql query with throwing exception."""

        def raise_exception(*args) -> Exception:
            """Throw exception."""
            raise Error

        mock_cursor = MagicMock()
        mock_cursor.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = False

        database._id = "Identification?"
        mock_cursor.execute.side_effect = raise_exception

        expected = {
            "id": "Identification?",
            "successful": False,
            "results": [],
            "col_names": [],
            "error_message": "",
        }

        result = database.execute_sql_query("SELECT funny FROM not_funny")

        assert expected == result

    def test_executes_sql_query_while_database_is_blocked(
        self, database: Database
    ) -> None:
        """Test execute sql query while database is blocked."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database._connection_factory = mock_connection_factory
        database._database_blocked.value = True

        result = database.execute_sql_query("SELECT funny FROM not_funny")

        assert result is None
        mock_cursor.execute.assert_not_called()

    def test_closes_database(self, database: Database) -> None:
        """Test closing of database."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.terminate.return_value = None
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.close.return_value = None

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler
        database.close()

        mocked_worker_pool.terminate.assert_called_once()
        mocked_background_scheduler.close.assert_called_once()

    def test_initializes_influx(self, database: Database) -> None:
        """Test intialization of the corresponding influx database."""
        mock_storage_cursor = MagicMock()
        mock_storage_cursor_constructor = MagicMock()
        mock_storage_cursor.create_database.return_value = None
        mock_storage_cursor.drop_database.return_value = None
        mock_storage_cursor.create_continuous_query.return_value = None
        mock_storage_cursor_constructor.create_cursor.return_value.__enter__.return_value = (
            mock_storage_cursor
        )
        database._storage_connection_factory = mock_storage_cursor_constructor

        throughput_query = """SELECT count("latency") AS "throughput"
                INTO "throughput"
                FROM "successful_queries"
                GROUP BY time(1s)"""
        latency_query = """SELECT mean("latency") AS "latency"
                INTO "latency"
                FROM "successful_queries"
                GROUP BY time(1s)"""
        resample_options = "EVERY 1s FOR 5s"

        database._initialize_influx()

        mock_storage_cursor_constructor.create_cursor.assert_called_once()
        mock_storage_cursor.drop_database.assert_called_once()
        mock_storage_cursor.create_database.assert_called_once()
        mock_storage_cursor.create_continuous_query.assert_any_call(
            "throughput_calculation", throughput_query, resample_options
        )
        mock_storage_cursor.create_continuous_query.assert_any_call(
            "latency_calculation", latency_query, resample_options
        )

    def test_get_status_of_workload_tables(self, database: Database):
        """Test get loaded benchmark data."""
        fake_status_of_workload = [
            {
                "workload_type": "tpch",
                "scale_factor": 1.0,
                "loaded_tables": ["customer", "item"],
                "missing_tables": [],
                "completely_loaded": True,
                "database_representation": {
                    "customer": "customer_tpch_1",
                    "item": "item_tpch_1",
                },
            },
            {
                "workload_type": "rock",
                "scale_factor": 1.0,
                "loaded_tables": ["Gary"],
                "missing_tables": ["Clark"],
                "completely_loaded": False,
                "database_representation": {
                    "Gary": "gary_rock_1",
                    "Clark": "clark_rock_1",
                },
            },
        ]
        database.get_loaded_tables_in_database = MagicMock()  # type: ignore
        database.get_loaded_tables_in_database.return_value = ["table1", "table2"]  # type: ignore
        database._workoad_tables_status = MagicMock()  # type: ignore
        database._workoad_tables_status.return_value = fake_status_of_workload  # type: ignore

        loaded_workloads = database.get_workoad_tables_status()

        database.get_loaded_tables_in_database.assert_called_once()  # type: ignore
        database._workoad_tables_status.assert_called_once_with(["table1", "table2"])  # type: ignore
        assert loaded_workloads == fake_status_of_workload

"""Tests for the database module."""

from collections import Counter
from multiprocessing.sharedctypes import Synchronized as ValueType
from typing import Dict, List, Optional
from unittest.mock import MagicMock, patch

from psycopg2 import pool
from pytest import fixture

from hyrisecockpit.database_manager.database import Database
from hyrisecockpit.database_manager.worker_pool import WorkerPool

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


def get_mocked_pool_cursor(*args) -> MagicMock:
    """Return fake PoolCursor."""
    mocked_context_cur: MagicMock = MagicMock()
    mocked_context_cur.__enter__.return_value = mocked_pool_cur
    return mocked_context_cur


def reset_mocked_pool_cursor() -> None:
    """Reset mocked pool cursor."""
    global mocked_pool_cur
    mocked_pool_cur = MagicMock()
    mocked_pool_cur.fetchall.return_value = []


def get_fake_pool_cursor_with_rows_to_return(connection_pool: pool) -> MagicMock:
    """Return fake PoolCursor with return value for fetch all."""
    mocked_context_cur: MagicMock = MagicMock()
    mocked_cur: MagicMock = MagicMock()
    mocked_cur.execute.return_value = None
    mocked_cur.fetchall.return_value = [
        ("Hildegunst von Mythenmetz", "Lindwurm", "sprachliche Begabung",),
        ("Rumo von Zamonien", "Wolpertinger", "gute Schachspieler und gute Kämpfer",),
    ]
    mocked_context_cur.__enter__.return_value = mocked_cur
    return mocked_context_cur


def get_fake_background_job_manager(
    database_id: str,
    database_blocked: ValueType,
    connection_pool: pool,
    loaded_tables: Dict[str, Optional[str]],
    worker_pool: WorkerPool,
    storage_host: str,
    storage_password: str,
    storage_port: str,
    storage_user: str,
) -> MagicMock:
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
    @patch("hyrisecockpit.database_manager.database.Driver", MagicMock())
    @patch(
        "hyrisecockpit.database_manager.database.Database.create_empty_loaded_tables",
        MagicMock(),
    )
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
        """Test initialization of worker pool attributes."""
        assert database._id == database_id
        assert database.number_workers == number_workers
        assert database._default_tables == default_tables
        assert type(database._number_additional_connections) is int
        assert type(database._database_blocked) is ValueType
        assert not database._database_blocked.value
        database._background_scheduler.start.assert_called_once()  # type: ignore
        database._background_scheduler.load_tables.assert_called_once_with(  # type: ignore
            default_tables
        )

    @patch("hyrisecockpit.database_manager.database._table_names", get_fake_tables())
    def test_creates_empty_loaded_tables(self, database: Database) -> None:
        """Test creates empty loaded tables."""
        expected_results: Dict[str, Optional[str]] = {
            "The Dough Rollers": None,
            "Broken Witt Rebels": None,
            "Bonny Doon": None,
            "Jack White": None,
            "Gary Clark Jr.": None,
            "Greta Van Fleet": None,
            "Tenacious D": None,
        }
        result: Dict[str, Optional[str]] = database.create_empty_loaded_tables()
        assert expected_results == result

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

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.load_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_called_once_with(default_tables)
        assert type(result) is bool
        assert result

    def test_loads_data_while_worker_pool_is_running(self, database: Database) -> None:
        """Test loading data while worker pool is running."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.load_tables.return_value = True

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.load_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
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

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.load_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_called_once_with(default_tables)
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

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.delete_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_called_once_with(
            default_tables
        )
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

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.delete_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
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

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.delete_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_called_once_with(
            default_tables
        )
        assert type(result) is bool
        assert not result

    def test_activates_plugin_with_success(self, database: Database) -> None:
        """Test entry point for plug-in activation with success."""
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.activate_plugin.return_value = True
        fake_plugin: str = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.activate_plugin(fake_plugin)

        mocked_background_scheduler.activate_plugin.assert_called_once_with(fake_plugin)
        assert type(result) is bool
        assert result

    def test_activates_plugin_with_no_success(self, database: Database) -> None:
        """Test entry point for plug-in activation with no success."""
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.activate_plugin.return_value = False
        fake_plugin: str = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result: bool = database.activate_plugin(fake_plugin)

        mocked_background_scheduler.activate_plugin.assert_called_once_with(fake_plugin)
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

    @patch("hyrisecockpit.database_manager.database._table_names", get_fake_tables())
    def test_gets_loaded_benchmarks_for_present_benchmarks(
        self, database: Database
    ) -> None:
        """Test get loaded benchmark for present benchmarks."""
        fake_loaded_tables: Dict[str, Optional[str]] = {
            "The Dough Rollers": "alternative",
            "Broken Witt Rebels": "alternative",
            "Bonny Doon": "alternative",
            "Jack White": "alternative",
            "Gary Clark Jr.": "Rock",
            "Greta Van Fleet": "Rock",
            "Tenacious D": "Rock",
        }
        database._loaded_tables = fake_loaded_tables
        expected: List[str] = ["Rock", "alternative"]

        results: List[str] = database.get_loaded_benchmarks()

        assert Counter(results) == Counter(expected)

    @patch("hyrisecockpit.database_manager.database._table_names", get_fake_tables())
    def test_gets_loaded_benchmarks_for_not_present_benchmarks(
        self, database: Database
    ) -> None:
        """Test get loaded benchmark for not present benchmarks."""
        fake_loaded_tables: Dict[str, Optional[str]] = {
            "The Dough Rollers": "alternative",
            "Broken Witt Rebels": "alternative",
            "Bonny Doon": None,
            "Jack White": "alternative",
            "Gary Clark Jr.": "Rock",
            "Greta Van Fleet": "Rock",
            "Tenacious D": "Rock",
        }
        database._loaded_tables = fake_loaded_tables
        expected = ["Rock"]

        results: List[str] = database.get_loaded_benchmarks()

        assert Counter(results) == Counter(expected)

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
        fake_loaded_tables: Dict[str, Optional[str]] = {
            "Broken Witt Rebels": "alternative",
            "Bonny Doon": None,
            "Jack White": "alternative",
            "Greta Van Fleet": None,
            "Tenacious D": "Rock",
        }
        database._loaded_tables = fake_loaded_tables
        expected: List[Dict[str, str]] = [
            {"table_name": "Broken Witt Rebels", "benchmark": "alternative"},
            {"table_name": "Jack White", "benchmark": "alternative"},
            {"table_name": "Tenacious D", "benchmark": "Rock"},
        ]

        received: List[Dict[str, str]] = database.get_loaded_tables()

        assert expected == received

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

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_mocked_pool_cursor,
    )
    def test_gets_plugins_when_database_unblocked_and_no_plugins_exists(
        self, database: Database
    ) -> None:
        """Test get not existing plug-ins."""
        database._database_blocked.value = False
        result: Optional[List] = database.get_plugins()

        global mocked_pool_cur
        mocked_pool_cur.execute.assert_called_once_with(
            ("SELECT name FROM meta_plugins;"), None
        )
        assert type(result) is list
        assert result == []

        reset_mocked_pool_cursor()

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_mocked_pool_cursor,
    )
    def test_gets_plugins_when_database_blocked(self, database: Database) -> None:
        """Test get plug-ins when database is blocked."""
        database._database_blocked.value = True
        result: Optional[List] = database.get_plugins()

        assert not result

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor",
        get_fake_pool_cursor_with_rows_to_return,
    )
    def test_gets_plugins_when_database_unblocked_and_plugins_exists(
        self, database: Database
    ) -> None:
        """Test get existing plug-ins."""
        database._database_blocked.value = False
        expected: List[str] = ["Hildegunst von Mythenmetz", "Rumo von Zamonien"]
        result: Optional[List] = database.get_plugins()

        assert type(result) is list
        assert Counter(result) == Counter(expected)

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_mocked_pool_cursor,
    )
    def test_sets_plugin_setting_when_database_is_unblocked(
        self, database: Database
    ) -> None:
        """Test set plug-in setting while the database is not blocked."""
        database._database_blocked.value = False
        result: bool = database.set_plugin_setting("M. böslich", "Eiskaltius")

        global mocked_pool_cur
        mocked_pool_cur.execute.assert_called_once_with(
            "UPDATE meta_settings SET value=%s WHERE name=%s;",
            ("Eiskaltius", "M. böslich",),
        )

        assert type(result) is bool
        assert result

        reset_mocked_pool_cursor()

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_mocked_pool_cursor,
    )
    def test_set_plugin_settings_when_database_blocked(
        self, database: Database
    ) -> None:
        """Test set plug-in setting while the database is blocked."""
        database._database_blocked.value = True
        result: bool = database.set_plugin_setting("Eiskaltius", "M. böslich")

        global mocked_pool_cur
        mocked_pool_cur.execute.assert_not_called()

        assert type(result) is bool
        assert not result

        reset_mocked_pool_cursor()

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_mocked_pool_cursor,
    )
    def test_gets_plugins_settings_when_database_unblocked_and_no_plugins_exists(
        self, database: Database
    ) -> None:
        """Test get not existing plug-ins settings."""
        database._database_blocked.value = False
        result: Optional[List] = database.get_plugin_setting()

        global mocked_pool_cur
        mocked_pool_cur.execute.assert_called_once_with(
            "SELECT name, value, description FROM meta_settings;", None
        )

        assert type(result) is list
        assert result == []

        reset_mocked_pool_cursor()

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_mocked_pool_cursor,
    )
    def test_gets_plugins_settings_when_database_blocked(
        self, database: Database
    ) -> None:
        """Test get plug-ins settings when database is blocked."""
        database._database_blocked.value = True
        result: Optional[List] = database.get_plugin_setting()

        global mocked_pool_cur
        mocked_pool_cur.execute.assert_not_called()

        assert not result

        reset_mocked_pool_cursor()

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor",
        get_fake_pool_cursor_with_rows_to_return,
    )
    def test_gets_plugins_settings_when_database_unblocked_and_plugins_exists(
        self, database: Database
    ) -> None:
        """Test get existing plug-ins settings."""
        database._database_blocked.value = False
        expected_plugin_one: Dict[str, str] = {
            "name": "Hildegunst von Mythenmetz",
            "value": "Lindwurm",
            "description": "sprachliche Begabung",
        }
        expected_plugin_two: Dict[str, str] = {
            "name": "Rumo von Zamonien",
            "value": "Wolpertinger",
            "description": "gute Schachspieler und gute Kämpfer",
        }

        expected = [expected_plugin_one, expected_plugin_two]
        result: Optional[List] = database.get_plugin_setting()

        assert type(result) is list
        assert result[:] == expected[:]  # type: ignore

    def test_closes_database(self, database: Database) -> None:
        """Test closing of database."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.terminate.return_value = None
        mocked_background_scheduler: MagicMock = MagicMock()
        mocked_background_scheduler.close.return_value = None
        mocked_connection_pool: MagicMock = MagicMock()
        mocked_connection_pool.closeall.return_value = None

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler
        database._connection_pool = mocked_connection_pool

        database.close()

        mocked_worker_pool.terminate.assert_called_once()
        mocked_background_scheduler.close.assert_called_once()
        mocked_connection_pool.closeall.assert_called_once()

    @patch("hyrisecockpit.database_manager.database.StorageCursor",)
    def test_initializes_influx(
        self, mock_storage_cursor_constructor: MagicMock, database: Database
    ) -> None:
        """Test intialization of the corresponding influx database."""
        mock_storage_cursor = MagicMock()
        mock_storage_cursor.create_database.return_value = None
        mock_storage_cursor.drop_database.return_value = None
        mock_storage_cursor.create_continuous_query.return_value = None
        mock_storage_cursor_constructor.return_value.__enter__.return_value = (
            mock_storage_cursor
        )

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

        mock_storage_cursor_constructor.assert_called_once()
        mock_storage_cursor.drop_database.assert_called_once()
        mock_storage_cursor.create_database.assert_called_once()
        mock_storage_cursor.create_continuous_query.assert_any_call(
            "throughput_calculation", throughput_query, resample_options
        )
        mock_storage_cursor.create_continuous_query.assert_any_call(
            "latency_calculation", latency_query, resample_options
        )

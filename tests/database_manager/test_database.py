"""Tests for the database module."""

from collections import Counter
from multiprocessing.sharedctypes import Synchronized as ValueType
from typing import Dict, List, Optional
from unittest.mock import MagicMock, patch

from psycopg2 import pool
from pytest import fixture

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


def get_fake_pool_cursor(connection_pool: pool) -> MagicMock:
    """Return fake PoolCursor."""
    mocked_context_cur: MagicMock = MagicMock()
    mocked_cur: MagicMock = MagicMock()
    mocked_cur.execute.return_value = None
    mocked_cur.fetchall.return_value = []
    mocked_context_cur.__enter__.return_value = mocked_cur
    return mocked_context_cur


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

    def test_inintializes_database(self, database) -> None:
        """Test initialization of worker pool attributes."""
        assert database._id == database_id
        assert database.number_workers == number_workers
        assert database._default_tables == default_tables
        assert type(database._number_additional_connections) is int
        assert type(database._database_blocked) is ValueType
        assert not database._database_blocked.value
        database._background_scheduler.start.assert_called_once()
        database._background_scheduler.load_tables.assert_called_once_with(
            default_tables
        )

    @patch("hyrisecockpit.database_manager.database._table_names", get_fake_tables())
    def test_creates_empty_loaded_tables(self, database) -> None:
        """Test creates empty loaded tables."""
        expected_results = {
            "The Dough Rollers": None,
            "Broken Witt Rebels": None,
            "Bonny Doon": None,
            "Jack White": None,
            "Gary Clark Jr.": None,
            "Greta Van Fleet": None,
            "Tenacious D": None,
        }
        result = database.create_empty_loaded_tables()
        assert expected_results == result

    def test_gets_worker_pool_queue_length(self, database) -> None:
        """Test return of queue length from worker pool."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_queue_length.return_value = 42
        database._worker_pool = mocked_worker_pool

        result = database.get_queue_length()

        assert type(result) is int
        assert result == 42

    def test_loads_data_while_worker_pool_is_closed_and_load_table_is_successful(
        self, database
    ) -> None:
        """Test loading data while worker pool is closed and background scheduler is returning true."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.load_tables.return_value = True

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.load_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_called_once_with(default_tables)
        assert type(result) is bool
        assert result

    def test_loads_data_while_worker_pool_is_running(self, database) -> None:
        """Test loading data while worker pool is running."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.load_tables.return_value = True

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.load_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_loads_data_while_worker_pool_is_closed_and_load_table_failed(
        self, database
    ) -> None:
        """Test loading data while worker pool is running."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.load_tables.return_value = False

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.load_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_called_once_with(default_tables)
        assert type(result) is bool
        assert not result

    def test_deletes_data_while_worker_pool_is_closed_and_load_table_is_successful(
        self, database
    ) -> None:
        """Test delete of data while worker pool is closed and background scheduler is returning true."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.delete_tables.return_value = True

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.delete_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_called_once_with(
            default_tables
        )
        assert type(result) is bool
        assert result

    def test_deletes_data_while_worker_pool_is_running(self, database) -> None:
        """Test delete of  data while worker pool is running."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.delete_tables.return_value = True

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.delete_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_deletes_data_while_worker_pool_is_closed_and_load_table_failed(
        self, database
    ) -> None:
        """Test delete of  data while worker pool is running."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.delete_tables.return_value = False

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.delete_data(default_tables)

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_called_once_with(
            default_tables
        )
        assert type(result) is bool
        assert not result

    def test_activates_plugin_with_success(self, database) -> None:
        """Test entry point for plug-in activation with success."""
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.activate_plugin.return_value = True
        fake_plugin = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result = database.activate_plugin(fake_plugin)

        mocked_background_scheduler.activate_plugin.assert_called_once_with(fake_plugin)
        assert type(result) is bool
        assert result

    def test_activates_plugin_with_no_success(self, database) -> None:
        """Test entry point for plug-in activation with no success."""
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.activate_plugin.return_value = False
        fake_plugin = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result = database.activate_plugin(fake_plugin)

        mocked_background_scheduler.activate_plugin.assert_called_once_with(fake_plugin)
        assert type(result) is bool
        assert not result

    def test_deactivats_plugin_with_success(self, database) -> None:
        """Test entry point for plug-in deactivation with success."""
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.deactivate_plugin.return_value = True
        fake_plugin = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result = database.deactivate_plugin(fake_plugin)

        mocked_background_scheduler.deactivate_plugin.assert_called_once_with(
            fake_plugin
        )
        assert type(result) is bool
        assert result

    def test_deactivats_plugin_with_no_success(self, database) -> None:
        """Test entry point for plug-in deactivation with no success."""
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.deactivate_plugin.return_value = False
        fake_plugin = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result = database.deactivate_plugin(fake_plugin)

        mocked_background_scheduler.deactivate_plugin.assert_called_once_with(
            fake_plugin
        )
        assert type(result) is bool
        assert not result

    def test_gets_blocked_database_status(self, database) -> None:
        """Test return value for blocked database."""
        database._database_blocked.value = False
        result = database.get_database_blocked()

        assert type(result) is int
        assert not result

    def test_gets_unblocked_database_status(self, database) -> None:
        """Test return value for unblocked database."""
        database._database_blocked.value = True
        result = database.get_database_blocked()

        assert type(result) is int
        assert result

    @patch("hyrisecockpit.database_manager.database._table_names", get_fake_tables())
    def test_gets_loaded_benchmarks_for_present_benchmarks(self, database) -> None:
        """Test get loaded benchmark for present benchmarks."""
        fake_loaded_tables = {
            "The Dough Rollers": "alternative",
            "Broken Witt Rebels": "alternative",
            "Bonny Doon": "alternative",
            "Jack White": "alternative",
            "Gary Clark Jr.": "Rock",
            "Greta Van Fleet": "Rock",
            "Tenacious D": "Rock",
        }
        database._loaded_tables = fake_loaded_tables
        expected = ["Rock", "alternative"]

        results = database.get_loaded_benchmarks()

        assert Counter(results) == Counter(expected)

    @patch("hyrisecockpit.database_manager.database._table_names", get_fake_tables())
    def test_gets_loaded_benchmarks_for_not_present_benchmarks(self, database) -> None:
        """Test get loaded benchmark for not present benchmarks."""
        fake_loaded_tables = {
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

        results = database.get_loaded_benchmarks()

        assert Counter(results) == Counter(expected)

    def test_gets_worker_pool_status(self, database) -> None:
        """Test return of worker pool status."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        database._worker_pool = mocked_worker_pool

        result = database.get_worker_pool_status()

        assert type(result) is str

    def test_starts_successful_worker(self, database) -> None:
        """Test start of successful worker."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.start.return_value = True
        database._worker_pool = mocked_worker_pool
        result = database.start_worker()

        mocked_worker_pool.start.assert_called_once()
        assert type(result) is bool
        assert result

    def test_starts_unsuccessful_worker(self, database) -> None:
        """Test start of unsuccessful worker."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.start.return_value = False
        database._worker_pool = mocked_worker_pool
        result = database.start_worker()

        mocked_worker_pool.start.assert_called_once()
        assert type(result) is bool
        assert not result

    def test_closes_successful_worker(self, database) -> None:
        """Test successful close of worker."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.close.return_value = True
        database._worker_pool = mocked_worker_pool
        result = database.close_worker()

        mocked_worker_pool.close.assert_called_once()
        assert type(result) is bool
        assert result

    def test_closes_unsuccessful_worker(self, database) -> None:
        """Test unsuccessful close of worker."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.close.return_value = False
        database._worker_pool = mocked_worker_pool
        result = database.close_worker()

        mocked_worker_pool.close.assert_called_once()
        assert type(result) is bool
        assert not result

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_fake_pool_cursor,
    )
    def test_gets_plugins_when_database_unblocked_and_no_plugins_exists(
        self, database
    ) -> None:
        """Test get not existing plug-ins."""
        database._database_blocked.value = False
        result = database.get_plugins()

        assert type(result) is list
        assert result == []

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_fake_pool_cursor,
    )
    def test_gets_plugins_when_database_blocked(self, database) -> None:
        """Test get plug-ins when database is blocked."""
        database._database_blocked.value = True
        result = database.get_plugins()

        assert not result

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor",
        get_fake_pool_cursor_with_rows_to_return,
    )
    def test_gets_plugins_when_database_unblocked_and_plugins_exists(
        self, database
    ) -> None:
        """Test get existing plug-ins."""
        database._database_blocked.value = False
        expected = ["Hildegunst von Mythenmetz", "Rumo von Zamonien"]
        result = database.get_plugins()

        assert type(result) is list
        assert Counter(result) == Counter(expected)

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_fake_pool_cursor,
    )
    def test_sets_plugin_setting_when_dataabse_is_unblocked(self, database) -> None:
        """Test set plug-in setting while the database is not blocked."""
        database._database_blocked.value = False
        result = database.set_plugin_setting("M. böslich", "Eiskaltius")

        assert type(result) is bool
        assert result

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_fake_pool_cursor,
    )
    def test_set_plugin_settings_when_database_blocked(self, database) -> None:
        """Test set plug-in setting while the database is blocked."""
        database._database_blocked.value = True
        result = database.set_plugin_setting("Eiskaltius", "M. böslich")

        assert type(result) is bool
        assert not result

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_fake_pool_cursor,
    )
    def test_gets_plugins_settings_when_database_unblocked_and_no_plugins_exists(
        self, database
    ) -> None:
        """Test get not existing plug-ins settings."""
        database._database_blocked.value = False
        result = database.get_plugin_setting()

        assert type(result) is list
        assert result == []

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor", get_fake_pool_cursor,
    )
    def test_gets_plugins_settings_when_database_blocked(self, database) -> None:
        """Test get plug-ins settings when database is blocked."""
        database._database_blocked.value = True
        result = database.get_plugin_setting()

        assert not result

    @patch(
        "hyrisecockpit.database_manager.database.PoolCursor",
        get_fake_pool_cursor_with_rows_to_return,
    )
    def test_gets_plugins_settings_when_database_unblocked_and_plugins_exists(
        self, database
    ) -> None:
        """Test get existing plug-ins settings."""
        database._database_blocked.value = False
        expected_plugin_one = {
            "name": "Hildegunst von Mythenmetz",
            "value": "Lindwurm",
            "description": "sprachliche Begabung",
        }
        expected_plugin_two = {
            "name": "Rumo von Zamonien",
            "value": "Wolpertinger",
            "description": "gute Schachspieler und gute Kämpfer",
        }

        expected = [expected_plugin_one, expected_plugin_two]
        result = database.get_plugin_setting()

        assert type(result) is list
        assert result[:] == expected[:]

    def test_closes_database(self, database) -> None:
        """Test closing of database."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.terminate.return_value = None
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.close.return_value = None
        mocked_connection_pool = MagicMock()
        mocked_connection_pool.closeall.return_value = None

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler
        database._connection_pool = mocked_connection_pool

        database.close()

        mocked_worker_pool.terminate.assert_called_once()
        mocked_background_scheduler.close.assert_called_once()
        mocked_connection_pool.closeall.assert_called_once()

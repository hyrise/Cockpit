"""Tests for the database module."""

from multiprocessing.sharedctypes import Synchronized as ValueType
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.database_manager.database import Database


class TestDatabase(object):
    """Tests for the Database class."""

    def get_id(self) -> str:
        """Return database id."""
        return "MongoDB Number One"

    def get_user(self) -> str:
        """Return database user."""
        return "Proform"

    def get_password(self) -> str:
        """Return database password."""
        return "passwort"

    def get_host(self) -> str:
        """Return host."""
        return "nsa"

    def get_port(self) -> str:
        """Return port."""
        return "666"

    def get_dbname(self) -> str:
        """Return database name."""
        return "MongoDB"

    def get_number_workers(self) -> int:
        """Return number of worker."""
        return 42

    def get_workload_publisher_url(self) -> str:
        """Return workload publisher URL."""
        return "lothar matthäus"

    def get_default_tables(self) -> str:
        """Return default tables."""
        return "Watt_ihr_Volt"

    def get_storage_host(self) -> str:
        """Return storage host."""
        return "xulfni"

    def get_storage_password(self) -> str:
        """Return storage password."""
        return "1234"

    def get_storage_port(self) -> str:
        """Return storage port."""
        return "42"

    def get_storage_user(self) -> str:
        """Return storage user."""
        return "Käptin Blaubär"

    def get_fake_background_job_manager(
        id,  # noqa
        database_blocked,
        connection_pool,
        storage_host,
        storage_password,
        storage_port,
        storage_user,
    ) -> MagicMock:
        """Return fake  BackgroundJobManager."""
        m = MagicMock()
        m.start.side_effect = None
        m.load_tables.side_effect = None
        return m

    @fixture
    @patch(
        "hyrisecockpit.database_manager.database.BackgroundJobManager",
        get_fake_background_job_manager,
    )
    @patch("hyrisecockpit.database_manager.database.WorkerPool", MagicMock())
    @patch("hyrisecockpit.database_manager.database.Driver", MagicMock())
    def database(self) -> Database:
        """Get a new Database."""
        return Database(
            self.get_id(),
            self.get_user(),
            self.get_password(),
            self.get_host(),
            self.get_port(),
            self.get_dbname(),
            self.get_number_workers(),
            self.get_workload_publisher_url(),
            self.get_default_tables(),
            self.get_storage_host(),
            self.get_storage_password(),
            self.get_storage_port(),
            self.get_storage_user(),
        )

    def test_inintialize_database(self, database) -> None:
        """Test initialization of worker pool attributes."""
        assert database._id == self.get_id()
        assert database.number_workers == self.get_number_workers()
        assert database._default_tables == self.get_default_tables()
        assert type(database._number_additional_connections) is int
        assert type(database._database_blocked) is ValueType
        assert not database._database_blocked.value
        database._background_scheduler.start.assert_called_once()
        database._background_scheduler.load_tables.assert_called_once_with(
            self.get_default_tables()
        )

    def test_gettting_worker_pool_queue_length(self, database) -> None:
        """Test return of queue length from worker pool."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_queue_length.return_value = 42
        database._worker_pool = mocked_worker_pool

        result = database.get_queue_length()

        assert type(result) is int
        assert result == 42

    def test_loading_data_while_worker_pool_is_closed_and_load_table_is_successful(
        self, database
    ) -> None:
        """Test loading data while worker pool is closed and background scheduler is returning true."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.load_tables.return_value = True

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.load_data(self.get_default_tables())

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_called_once_with(
            self.get_default_tables()
        )
        assert type(result) is bool
        assert result

    def test_loading_data_while_worker_pool_is_running(self, database) -> None:
        """Test loading data while worker pool is running."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.load_tables.return_value = True

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.load_data(self.get_default_tables())

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_loading_data_while_worker_pool_is_closed_and_load_table_failed(
        self, database
    ) -> None:
        """Test loading data while worker pool is running."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.load_tables.return_value = False

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.load_data(self.get_default_tables())

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.load_tables.assert_called_once_with(
            self.get_default_tables()
        )
        assert type(result) is bool
        assert not result

    def test_delete_data_while_worker_pool_is_closed_and_load_table_is_successful(
        self, database
    ) -> None:
        """Test delete of data while worker pool is closed and background scheduler is returning true."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.delete_tables.return_value = True

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.delete_data(self.get_default_tables())

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_called_once_with(
            self.get_default_tables()
        )
        assert type(result) is bool
        assert result

    def test_delete_data_while_worker_pool_is_running(self, database) -> None:
        """Test delete of  data while worker pool is running."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.delete_tables.return_value = True

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.delete_data(self.get_default_tables())

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_delete_data_while_worker_pool_is_closed_and_load_table_failed(
        self, database
    ) -> None:
        """Test delete of  data while worker pool is running."""
        mocked_worker_pool = MagicMock()
        mocked_worker_pool.get_status.return_value = "closed"
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.delete_tables.return_value = False

        database._worker_pool = mocked_worker_pool
        database._background_scheduler = mocked_background_scheduler

        result = database.delete_data(self.get_default_tables())

        mocked_worker_pool.get_status.assert_called_once()
        mocked_background_scheduler.delete_tables.assert_called_once_with(
            self.get_default_tables()
        )
        assert type(result) is bool
        assert not result

    def test_activation_of_plugin_with_success(self, database) -> None:
        """Test entry point for plug-in activation with success."""
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.activate_plugin.return_value = True
        fake_plugin = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result = database.activate_plugin(fake_plugin)

        mocked_background_scheduler.activate_plugin.assert_called_once_with(fake_plugin)
        assert type(result) is bool
        assert result

    def test_activation_of_plugin_with_no_success(self, database) -> None:
        """Test entry point for plug-in activation with no success."""
        mocked_background_scheduler = MagicMock()
        mocked_background_scheduler.activate_plugin.return_value = False
        fake_plugin = "Coolputer"
        database._background_scheduler = mocked_background_scheduler

        result = database.activate_plugin(fake_plugin)

        mocked_background_scheduler.activate_plugin.assert_called_once_with(fake_plugin)
        assert type(result) is bool
        assert not result

    def test_deactivation_of_plugin_with_success(self, database) -> None:
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

    def test_deactivation_of_plugin_with_no_success(self, database) -> None:
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

    def test_getting_blocked_database_status(self, database) -> None:
        """Test return value for blocked database."""
        database._database_blocked.value = False

        result = database.get_database_blocked()

        assert type(result) is int
        assert not result

    def test_getting_unblocked_database_status(self, database) -> None:
        """Test return value for unblocked database."""
        database._database_blocked.value = True

        result = database.get_database_blocked()

        assert type(result) is int
        assert result

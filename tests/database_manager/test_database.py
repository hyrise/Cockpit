"""Tests for the database module."""

from multiprocessing.sharedctypes import Synchronized as ValueType
from unittest.mock import MagicMock, patch

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
storage_host: str = "xulfni"
storage_password: str = "1234"
storage_port: str = "42"
storage_user: str = "Käptin Blaubär"


class TestDatabase(object):
    """Tests for the Database class."""

    @fixture
    @patch("hyrisecockpit.database_manager.database.WorkerPool", MagicMock())
    @patch(
        "hyrisecockpit.database_manager.database.ContinuousJobHandler",
        MagicMock(),
    )
    @patch(
        "hyrisecockpit.database_manager.database.AsynchronousJobHandler", MagicMock()
    )
    @patch("hyrisecockpit.database_manager.database.ConnectionFactory", MagicMock())
    @patch(
        "hyrisecockpit.database_manager.database.StorageConnectionFactory", MagicMock()
    )
    @patch(
        "hyrisecockpit.database_manager.database.Database._initialize_influx",
        MagicMock(),
    )
    @patch(
        "hyrisecockpit.database_manager.database.SynchronousJobHandler",
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
            storage_host,
            storage_password,
            storage_port,
            storage_user,
        )

    @patch("hyrisecockpit.database_manager.database.Connector")
    @patch("hyrisecockpit.database_manager.database.WorkerPool")
    @patch(
        "hyrisecockpit.database_manager.database.ContinuousJobHandler",
    )
    @patch("hyrisecockpit.database_manager.database.AsynchronousJobHandler")
    @patch("hyrisecockpit.database_manager.database.ConnectionFactory")
    @patch("hyrisecockpit.database_manager.database.StorageConnectionFactory")
    @patch("hyrisecockpit.database_manager.database.Database._initialize_influx")
    def test_inintializes_database(
        self,
        mock_initialize_influx: MagicMock,
        mock_storage_connection_factory: MagicMock,
        mock_connection_factory: MagicMock,
        mock_asynchronous_job_handler: MagicMock,
        mock_continuous_job_handler: MagicMock,
        mock_worker_pool: MagicMock,
        mock_connector: MagicMock,
    ) -> None:
        """Test initialization of database attributes."""
        database = Database(
            database_id,
            database_user,
            database_password,
            database_host,
            database_port,
            database_name,
            number_workers,
            workload_publisher_url,
            storage_host,
            storage_password,
            storage_port,
            storage_user,
        )
        mock_connection_factory.assert_called_once_with(
            **database.connection_information
        )
        mock_storage_connection_factory.assert_called_once_with(
            storage_user, storage_password, storage_host, storage_port, database_id
        )
        mock_connector.get_workload_drivers.assert_called_once()
        mock_worker_pool.assert_called_once_with(
            database._connection_factory,
            number_workers,
            database_id,
            workload_publisher_url,
            database._database_blocked,
            database._workload_drivers,
        )
        mock_continuous_job_handler.assert_called_once_with(
            database._connection_factory,
            database._hyrise_active,
            database._worker_pool,
            database._storage_connection_factory,
            database._database_blocked,
        )
        mock_asynchronous_job_handler.assert_called_once_with(
            database._database_blocked,
            database._connection_factory,
            database._workload_drivers,
        )
        database._continuous_job_handler.start.assert_called_once()  # type: ignore
        mock_initialize_influx.assert_called_once()

        assert database._id == database_id
        assert database.number_workers == number_workers
        assert type(database._database_blocked) is ValueType
        assert type(database._hyrise_active) is ValueType
        assert database._hyrise_active.value
        assert not database._database_blocked.value

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
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "closed"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler

        result: bool = database.load_data(fake_workload)

        mock_worker_pool.get_status.assert_called_once()
        mock_asynchronous_job_handler.load_tables.assert_called_once_with("tpch", 1.0)
        assert type(result) is bool
        assert result

    def test_loads_data_while_worker_pool_is_running(self, database: Database) -> None:
        """Test loading data while worker pool is running."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "running"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler

        result: bool = database.load_data(fake_workload)

        mock_worker_pool.get_status.assert_called_once()
        mock_asynchronous_job_handler.load_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_loads_data_with_no_valid_workload_type(self, database: Database) -> None:
        """Test load data with no valid workload type."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "running"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpcc_not_valid", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler
        result: bool = database.load_data(fake_workload)

        mock_asynchronous_job_handler.load_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_loads_data_with_no_valid_scalefactor(self, database: Database) -> None:
        """Test load data with no valid scalefactor."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "running"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpcc", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler
        mock_driver = MagicMock()
        mock_driver.get_scalefactors.return_value = [5.0]
        database._workload_drivers = {"tpcc": mock_driver}

        result: bool = database.load_data(fake_workload)

        mock_asynchronous_job_handler.load_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_loads_data_while_worker_pool_is_closed_and_load_table_failed(
        self, database: Database
    ) -> None:
        """Test loading data while worker pool is running."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "closed"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.load_tables.return_value = False
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler

        result: bool = database.load_data(fake_workload)

        mock_worker_pool.get_status.assert_called_once()
        mock_asynchronous_job_handler.load_tables.assert_called_once_with("tpch", 1.0)
        assert type(result) is bool
        assert not result

    def test_deletes_data_while_worker_pool_is_closed_and_load_table_is_successful(
        self, database: Database
    ) -> None:
        """Test delete of data while worker pool is closed and background scheduler is returning true."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "closed"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.delete_tables.return_value = True
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler

        result: bool = database.delete_data(fake_workload)

        mock_worker_pool.get_status.assert_called_once()
        mock_asynchronous_job_handler.delete_tables.assert_called_once_with("tpch", 1.0)
        assert type(result) is bool
        assert result

    def test_deletes_data_while_worker_pool_is_running(
        self, database: Database
    ) -> None:
        """Test delete of  data while worker pool is running."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "running"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.delete_tables.return_value = True
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler

        result: bool = database.delete_data(fake_workload)

        mock_worker_pool.get_status.assert_called_once()
        mock_asynchronous_job_handler.delete_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_delete_data_with_no_valid_workload_type(self, database: Database) -> None:
        """Test delete data with no valid workload type."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "running"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpcc_not_valid", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler

        result: bool = database.delete_data(fake_workload)

        mock_asynchronous_job_handler.delete_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_delete_data_with_no_valid_scalefactor(self, database: Database) -> None:
        """Test delete data with no valid scalefactor."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "running"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.load_tables.return_value = True
        fake_workload = {"workload_type": "tpcc", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler
        mock_driver = MagicMock()
        mock_driver.get_scalefactors.return_value = [5.0]
        database._workload_drivers = {"tpcc": mock_driver}

        result: bool = database.delete_data(fake_workload)

        mock_asynchronous_job_handler.delete_tables.assert_not_called()
        assert type(result) is bool
        assert not result

    def test_deletes_data_while_worker_pool_is_closed_and_load_table_failed(
        self, database: Database
    ) -> None:
        """Test delete of  data while worker pool is running."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.get_status.return_value = "closed"
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.delete_tables.return_value = False
        fake_workload = {"workload_type": "tpch", "scale_factor": 1.0}
        database._worker_pool = mock_worker_pool
        database._asynchronous_job_handler = mock_asynchronous_job_handler

        result: bool = database.delete_data(fake_workload)

        mock_worker_pool.get_status.assert_called_once()
        mock_asynchronous_job_handler.delete_tables.assert_called_once_with("tpch", 1.0)
        assert type(result) is bool
        assert not result

    def test_activates_plugin_with_success(self, database: Database) -> None:
        """Test entry point for plug-in activation with success."""
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.activate_plugin.return_value = True
        database._asynchronous_job_handler = mock_asynchronous_job_handler
        fake_plugin: str = "Coolputer"

        result: bool = database.activate_plugin(fake_plugin)

        mock_asynchronous_job_handler.activate_plugin.assert_called_once_with(
            fake_plugin
        )
        assert type(result) is bool
        assert result

    def test_activates_plugin_with_no_success(self, database: Database) -> None:
        """Test entry point for plug-in activation with no success."""
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.activate_plugin.return_value = False
        database._asynchronous_job_handler = mock_asynchronous_job_handler
        fake_plugin: str = "Coolputer"

        result: bool = database.activate_plugin(fake_plugin)

        mock_asynchronous_job_handler.activate_plugin.assert_called_once_with(
            fake_plugin
        )
        assert type(result) is bool
        assert not result

    def test_deactivats_plugin_with_success(self, database: Database) -> None:
        """Test entry point for plug-in deactivation with success."""
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.deactivate_plugin.return_value = True

        fake_plugin: str = "Coolputer"
        database._asynchronous_job_handler = mock_asynchronous_job_handler

        result: bool = database.deactivate_plugin(fake_plugin)

        mock_asynchronous_job_handler.deactivate_plugin.assert_called_once_with(
            fake_plugin
        )
        assert type(result) is bool
        assert result

    def test_deactivats_plugin_with_no_success(self, database: Database) -> None:
        """Test entry point for plug-in deactivation with no success."""
        mock_asynchronous_job_handler: MagicMock = MagicMock()
        mock_asynchronous_job_handler.deactivate_plugin.return_value = False
        fake_plugin: str = "Coolputer"
        database._asynchronous_job_handler = mock_asynchronous_job_handler

        result: bool = database.deactivate_plugin(fake_plugin)

        mock_asynchronous_job_handler.deactivate_plugin.assert_called_once_with(
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

    def test_gets_hyrise_active(self, database: Database) -> None:
        """Test get hyrise active status."""
        database._hyrise_active.value = True
        result: bool = database.get_hyrise_active()

        assert type(result) is bool
        assert result

    def test_gets_loaded_tables(self, database: Database) -> None:
        """Test get loaded tables."""
        mock_synchronous_job_handler = MagicMock()
        database._synchronous_job_handler = mock_synchronous_job_handler
        database.get_loaded_tables_in_database()
        mock_synchronous_job_handler.get_loaded_tables_in_database.assert_called_once()

    def test_gets_workload_tables_status(self, database: Database) -> None:
        """Test get workload tables status."""
        mock_synchronous_job_handler = MagicMock()
        database._synchronous_job_handler = mock_synchronous_job_handler
        database.get_workload_tables_status()
        mock_synchronous_job_handler.get_workload_tables_status.assert_called_once()

    def test_gets_detailed_plugins(self, database: Database) -> None:
        """Test get detailed plug-ins."""
        mock_synchronous_job_handler = MagicMock()
        database._synchronous_job_handler = mock_synchronous_job_handler
        database.get_detailed_plugins()
        mock_synchronous_job_handler.get_detailed_plugins.assert_called_once()

    def test_sets_plugin_settings(self, database: Database) -> None:
        """Test set plug-in settings."""
        plugin_name = "compression"
        setting_name = "compression_rate"
        setting_value = "10"
        mock_synchronous_job_handler = MagicMock()
        database._synchronous_job_handler = mock_synchronous_job_handler
        database.set_plugin_setting(plugin_name, setting_name, setting_value)
        mock_synchronous_job_handler.set_plugin_setting.assert_called_once_with(
            plugin_name, setting_name, setting_value
        )

    def test_executes_sql_query(self, database: Database) -> None:
        """Test execute SQL query."""
        query = "SELECT bla bla"
        mock_synchronous_job_handler = MagicMock()
        database._synchronous_job_handler = mock_synchronous_job_handler
        database.execute_sql_query(query)
        mock_synchronous_job_handler.execute_sql_query.assert_called_once_with(query)

    def test_gets_worker_pool_status(self, database: Database) -> None:
        """Test return of worker pool status."""
        mocked_worker_pool: MagicMock = MagicMock()
        mocked_worker_pool.get_status.return_value = "running"
        database._worker_pool = mocked_worker_pool

        result: str = database.get_worker_pool_status()

        assert type(result) is str
        assert result == "running"

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

    def test_closes_database(self, database: Database) -> None:
        """Test closing of database."""
        mock_worker_pool: MagicMock = MagicMock()
        mock_worker_pool.terminate.return_value = None
        mock_continuous_job_handler: MagicMock = MagicMock()
        mock_continuous_job_handler.close.return_value = None

        database._worker_pool = mock_worker_pool
        database._continuous_job_handler = mock_continuous_job_handler
        database.close()

        mock_worker_pool.terminate.assert_called_once()
        mock_continuous_job_handler.close.assert_called_once()

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
                WHERE commited='True'
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

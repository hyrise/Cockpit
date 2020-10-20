"""Test for the synchronous job handler."""
from multiprocessing import Value
from unittest.mock import patch

from pytest import fixture

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.synchronous_job_handler import SynchronousJobHandler


class TestSynchronousJobHandler:
    """Test synchronous job handler."""

    @fixture
    def synchronous_job_handler(self) -> SynchronousJobHandler:
        """Initialize SynchronousJobHandler object."""
        mock_connection_factory = MagicMock()
        database_blocked = Value("b", 0)
        database_id = "Database A"
        workload_drivers = {"tpch": MagicMock()}
        return SynchronousJobHandler(  # type: ignore
            mock_connection_factory, database_blocked, database_id, workload_drivers
        )

    def test_initializing_synchronous_job_handler_correctly(self) -> None:
        """Test if synchronous job handler can be initialized correctly."""
        mock_connection_factory = MagicMock()
        database_blocked = Value("b", 0)
        database_id = "Database A"
        workload_drivers = {"tpch": MagicMock()}

        synchronous_job_handler = SynchronousJobHandler(  # type: ignore
            mock_connection_factory, database_blocked, database_id, workload_drivers
        )

        assert synchronous_job_handler._connection_factory == mock_connection_factory
        assert synchronous_job_handler._database_blocked == database_blocked
        assert synchronous_job_handler._database_id == database_id
        assert synchronous_job_handler._workload_drivers == workload_drivers

    @patch(
        "hyrisecockpit.database_manager.synchronous_job_handler.get_loaded_tables_in_database_job"
    )
    def test_gets_loaded_tables_in_database(
        self,
        mock_get_loaded_tables_in_database_job: MagicMock,
        synchronous_job_handler: SynchronousJobHandler,
    ) -> None:
        """Test gets loaded tables in database."""
        synchronous_job_handler.get_loaded_tables_in_database()
        mock_get_loaded_tables_in_database_job.assert_called_once_with(
            synchronous_job_handler._connection_factory
        )

    @patch(
        "hyrisecockpit.database_manager.synchronous_job_handler.get_workload_tables_status_job"
    )
    def test_gets_workload_tables_status(
        self,
        mock_get_workload_tables_status_job: MagicMock,
        synchronous_job_handler: SynchronousJobHandler,
    ) -> None:
        """Test gets workload tables status."""
        synchronous_job_handler.get_workload_tables_status()
        mock_get_workload_tables_status_job.assert_called_once_with(
            synchronous_job_handler._connection_factory,
            synchronous_job_handler._workload_drivers,
        )

    @patch(
        "hyrisecockpit.database_manager.synchronous_job_handler.get_detailed_plugins_job"
    )
    def test_gets_detailed_plugins(
        self,
        mock_get_detailed_plugins_job: MagicMock,
        synchronous_job_handler: SynchronousJobHandler,
    ) -> None:
        """Test gets detailed plugins."""
        synchronous_job_handler.get_detailed_plugins()
        mock_get_detailed_plugins_job.assert_called_once_with(
            synchronous_job_handler._connection_factory
        )

    @patch(
        "hyrisecockpit.database_manager.synchronous_job_handler.set_plugin_setting_job"
    )
    def test_sets_detailed_plugins(
        self,
        mock_set_plugin_setting_job: MagicMock,
        synchronous_job_handler: SynchronousJobHandler,
    ) -> None:
        """Test sets detailed plugins."""
        plugin_name = "compression"
        setting_name = "compression_rate"
        setting_value = "10"
        synchronous_job_handler.set_plugin_setting(
            plugin_name, setting_name, setting_value
        )
        mock_set_plugin_setting_job.assert_called_once_with(
            plugin_name,
            setting_name,
            setting_value,
            synchronous_job_handler._connection_factory,
            synchronous_job_handler._database_blocked,
        )

    @patch(
        "hyrisecockpit.database_manager.synchronous_job_handler.execute_sql_query_job"
    )
    def test_executes_sql_query(
        self,
        mock_execute_sql_query_job: MagicMock,
        synchronous_job_handler: SynchronousJobHandler,
    ) -> None:
        """Test executes SQL query."""
        query = "SELECT bla bla"
        synchronous_job_handler.execute_sql_query(query)
        mock_execute_sql_query_job.assert_called_once_with(
            query,
            synchronous_job_handler._connection_factory,
            synchronous_job_handler._database_blocked,
            synchronous_job_handler._database_id,
        )

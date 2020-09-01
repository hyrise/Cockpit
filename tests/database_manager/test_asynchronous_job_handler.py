"""Tests for the asynchronous job handler."""
from multiprocessing import Value
from unittest.mock import patch

from pytest import fixture

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.asynchronous_job_handler import (
    AsynchronousJobHandler,
)
from hyrisecockpit.database_manager.cursor import ConnectionFactory
from hyrisecockpit.database_manager.job.activate_plugin import (
    activate_plugin as activate_plugin_job,
)
from hyrisecockpit.database_manager.job.deactivate_plugin import (
    deactivate_plugin as deactivate_plugin_job,
)
from hyrisecockpit.database_manager.job.delete_tables import (
    delete_tables as delete_tables_job,
)
from hyrisecockpit.database_manager.job.load_tables import (
    load_tables as load_tables_job,
)


class TestAsynchronousJobHandler:
    """Tests for the AsynchronousJobHandler class."""

    @fixture
    def asynchronous_job_handler(self) -> AsynchronousJobHandler:
        """Get a new AsynchronousJobHandler."""
        database_blocked = Value("b", False)
        connection_factory = ConnectionFactory(
            user="service", password="service", host="vm", port="1234", dbname="hyrise"
        )
        workload_drivers = {"TPC-C": "some_driver"}
        return AsynchronousJobHandler(
            database_blocked, connection_factory, workload_drivers
        )

    def test_initializes_start_asynchronous_job_handler(self) -> None:
        """Test initializes asynchronous job handler."""
        database_blocked = Value("b", False)
        connection_factory = ConnectionFactory(
            user="service", password="service", host="vm", port="1234", dbname="hyrise"
        )
        workload_drivers = {"TPC-C": "some_driver"}
        asynchronous_job_handler = AsynchronousJobHandler(
            database_blocked, connection_factory, workload_drivers
        )

        assert asynchronous_job_handler._database_blocked == database_blocked
        assert asynchronous_job_handler._connection_factory == connection_factory

    @patch("hyrisecockpit.database_manager.asynchronous_job_handler.Thread")
    def test_successfully_start_loading_tables(
        self, mock_thread: MagicMock, asynchronous_job_handler: AsynchronousJobHandler
    ) -> None:
        """Test successfully start loading tables job."""
        asynchronous_job_handler._database_blocked.value = False
        asynchronous_job_handler._connection_factory = MagicMock()
        mock_job_thread = MagicMock()
        mock_thread.return_value = mock_job_thread
        fake_workload_type = "tpch"
        fake_scale_factor = 1.0

        result: bool = asynchronous_job_handler.load_tables(
            fake_workload_type, fake_scale_factor
        )

        mock_thread.assert_called_once_with(
            target=load_tables_job,
            args=(
                asynchronous_job_handler._database_blocked,
                fake_workload_type,
                fake_scale_factor,
                asynchronous_job_handler._connection_factory,
                {"TPC-C": "some_driver"},
            ),
        )
        mock_job_thread.start.assert_called_once()
        assert result

    @patch("hyrisecockpit.database_manager.asynchronous_job_handler.Thread")
    def test_start_loading_tables_while_database_is_blocked(
        self, mock_thread: MagicMock, asynchronous_job_handler: AsynchronousJobHandler
    ) -> None:
        """Test start loading tables job while database is blocked."""
        asynchronous_job_handler._database_blocked.value = True
        asynchronous_job_handler._connection_factory = MagicMock()
        mock_job_thread = MagicMock()
        mock_thread.return_value = mock_job_thread
        fake_workload_type = "tpch"
        fake_scale_factor = 1.0

        result: bool = asynchronous_job_handler.load_tables(
            fake_workload_type, fake_scale_factor
        )

        mock_thread.assert_not_called()
        mock_job_thread.start.assert_not_called()
        assert not result

    @patch("hyrisecockpit.database_manager.asynchronous_job_handler.Thread")
    def test_successfully_start_delete_tables(
        self, mock_thread: MagicMock, asynchronous_job_handler: AsynchronousJobHandler
    ) -> None:
        """Test successfully start loading tables job."""
        asynchronous_job_handler._database_blocked.value = False
        asynchronous_job_handler._connection_factory = MagicMock()
        mock_job_thread = MagicMock()
        mock_thread.return_value = mock_job_thread
        fake_workload_type = "tpch"
        fake_scale_factor = 1.0

        result: bool = asynchronous_job_handler.delete_tables(
            fake_workload_type, fake_scale_factor
        )

        mock_thread.assert_called_once_with(
            target=delete_tables_job,
            args=(
                asynchronous_job_handler._database_blocked,
                fake_workload_type,
                fake_scale_factor,
                asynchronous_job_handler._connection_factory,
                {"TPC-C": "some_driver"},
            ),
        )
        mock_job_thread.start.assert_called_once()
        assert result

    @patch("hyrisecockpit.database_manager.asynchronous_job_handler.Thread")
    def test_start_delete_tables_while_database_is_blocked(
        self, mock_thread: MagicMock, asynchronous_job_handler: AsynchronousJobHandler
    ) -> None:
        """Test start loading tables job while database is blocked."""
        asynchronous_job_handler._database_blocked.value = True
        asynchronous_job_handler._connection_factory = MagicMock()
        mock_job_thread = MagicMock()
        mock_thread.return_value = mock_job_thread
        fake_workload_type = "tpch"
        fake_scale_factor = 1.0

        result: bool = asynchronous_job_handler.delete_tables(
            fake_workload_type, fake_scale_factor
        )

        mock_thread.assert_not_called()
        mock_job_thread.start.assert_not_called()
        assert not result

    @patch("hyrisecockpit.database_manager.asynchronous_job_handler.Thread")
    def test_successfully_activate_plugin(
        self, mock_thread: MagicMock, asynchronous_job_handler: AsynchronousJobHandler
    ) -> None:
        """Test successfully start activate plug-in job."""
        asynchronous_job_handler._database_blocked.value = False
        asynchronous_job_handler._connection_factory = MagicMock()
        mock_job_thread = MagicMock()
        mock_thread.return_value = mock_job_thread
        fake_plugin = "plugin"

        result: bool = asynchronous_job_handler.activate_plugin(fake_plugin)

        mock_thread.assert_called_once_with(
            target=activate_plugin_job,
            args=(asynchronous_job_handler._connection_factory, fake_plugin),
        )
        mock_job_thread.start.assert_called_once()
        assert result

    @patch("hyrisecockpit.database_manager.asynchronous_job_handler.Thread")
    def test_start_activate_plugin_while_database_is_blocked(
        self, mock_thread: MagicMock, asynchronous_job_handler: AsynchronousJobHandler
    ) -> None:
        """Test start activate plug-in job while database is blocked."""
        asynchronous_job_handler._database_blocked.value = True
        asynchronous_job_handler._connection_factory = MagicMock()
        mock_job_thread = MagicMock()
        mock_thread.return_value = mock_job_thread
        fake_plugin = "plugin"

        result: bool = asynchronous_job_handler.activate_plugin(fake_plugin)

        mock_thread.assert_not_called()
        mock_job_thread.start.assert_not_called()
        assert not result

    @patch("hyrisecockpit.database_manager.asynchronous_job_handler.Thread")
    def test_successfully_deactivate_plugin(
        self, mock_thread: MagicMock, asynchronous_job_handler: AsynchronousJobHandler
    ) -> None:
        """Test successfully start deactivate plug-in job."""
        asynchronous_job_handler._database_blocked.value = False
        asynchronous_job_handler._connection_factory = MagicMock()
        mock_job_thread = MagicMock()
        mock_thread.return_value = mock_job_thread
        fake_plugin = "plugin"

        result: bool = asynchronous_job_handler.deactivate_plugin(fake_plugin)

        mock_thread.assert_called_once_with(
            target=deactivate_plugin_job,
            args=(asynchronous_job_handler._connection_factory, fake_plugin),
        )
        mock_job_thread.start.assert_called_once()
        assert result

    @patch("hyrisecockpit.database_manager.asynchronous_job_handler.Thread")
    def test_start_deactivate_plugin_while_database_is_blocked(
        self, mock_thread: MagicMock, asynchronous_job_handler: AsynchronousJobHandler
    ) -> None:
        """Test start deactivate plug-in job while database is blocked."""
        asynchronous_job_handler._database_blocked.value = True
        asynchronous_job_handler._connection_factory = MagicMock()
        mock_job_thread = MagicMock()
        mock_thread.return_value = mock_job_thread
        fake_plugin = "plugin"

        result: bool = asynchronous_job_handler.deactivate_plugin(fake_plugin)

        mock_thread.assert_not_called()
        mock_job_thread.start.assert_not_called()
        assert not result

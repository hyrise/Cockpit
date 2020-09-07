"""Tests for the background_scheduler module."""
from multiprocessing import Value
from unittest.mock import patch

from pytest import fixture

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.background_scheduler import BackgroundJobManager

database_id: str = "MongoDB"
database_blocked: Value = Value("b", False)
hyrise_active: Value = Value("b", True)
storage_connection_factory: MagicMock = MagicMock()
connection_factory: MagicMock = MagicMock()
worker_pool: MagicMock = MagicMock()
workload_drivers = MagicMock()


class TestBackgroundJobManager:
    """Tests for the BackgroundJobManager class."""

    @fixture
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.ContinuousJobHandler",
        MagicMock(),
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.AsynchronousJobHandler",
        MagicMock(),
    )
    def background_job_manager(self) -> BackgroundJobManager:
        """Get a new BackgrpundJobManager."""
        return BackgroundJobManager(
            database_id,
            database_blocked,
            connection_factory,
            hyrise_active,
            worker_pool,
            storage_connection_factory,
            workload_drivers,
        )

    def test_creates(self, background_job_manager: BackgroundJobManager):
        """A BackgroundJobManager can be created."""
        assert background_job_manager

    @patch("hyrisecockpit.database_manager.background_scheduler.ContinuousJobHandler")
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.AsynchronousJobHandler",
    )
    def test_initializes_correctly(
        self,
        mock_asynchronous_job_handler: MagicMock,
        mock_continuous_job_handler: MagicMock,
    ) -> None:
        """A BackgroundJobManager initializes correctly."""
        background_job_manager = BackgroundJobManager(
            database_id,
            database_blocked,
            connection_factory,
            hyrise_active,
            worker_pool,
            storage_connection_factory,
            workload_drivers,
        )

        assert isinstance(background_job_manager, BackgroundJobManager)
        assert background_job_manager._database_id == database_id
        assert background_job_manager._database_blocked == database_blocked
        assert background_job_manager._connection_factory == connection_factory
        assert background_job_manager._workload_drivers == workload_drivers
        assert (
            background_job_manager._storage_connection_factory
            == storage_connection_factory
        )
        assert background_job_manager._hyrise_active == hyrise_active
        mock_asynchronous_job_handler.assert_called_once_with(
            background_job_manager._database_blocked,
            background_job_manager._connection_factory,
            background_job_manager._workload_drivers,
        )
        mock_continuous_job_handler.assert_called_once_with(
            background_job_manager._connection_factory,
            background_job_manager._hyrise_active,
            background_job_manager._worker_pool,
            background_job_manager._storage_connection_factory,
            background_job_manager._database_blocked,
        )

    def test_background_scheduler_starts(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start of background scheduler."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.start.return_value = None
        background_job_manager._continuous_job_handler = mock_scheduler

        background_job_manager.start()

        mock_scheduler.start.assert_called_once()

    def test_background_scheduler_closes(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test close of background scheduler."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.close.return_value = None
        background_job_manager._continuous_job_handler = mock_scheduler

        background_job_manager.close()

        mock_scheduler.close.assert_called_once()

    def test_start_loading_tables(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully start loading tables job."""
        mock_asynchronous_job_handler = MagicMock()
        mock_asynchronous_job_handler.return_value = True
        background_job_manager._asynchronous_job_handler = mock_asynchronous_job_handler
        workload_type = "TPC-C"
        scalefactor = 5.0

        result = background_job_manager.load_tables(workload_type, scalefactor)

        mock_asynchronous_job_handler.load_tables.assert_called_once_with(
            workload_type, scalefactor
        )
        assert result

    def test_delete_tables(self, background_job_manager: BackgroundJobManager) -> None:
        """Test successfully delete loading tables job."""
        mock_asynchronous_job_handler = MagicMock()
        mock_asynchronous_job_handler.return_value = True
        background_job_manager._asynchronous_job_handler = mock_asynchronous_job_handler
        workload_type = "TPC-C"
        scalefactor = 5.0

        result = background_job_manager.delete_tables(workload_type, scalefactor)

        mock_asynchronous_job_handler.delete_tables.assert_called_once_with(
            workload_type, scalefactor
        )
        assert result

    def test_activate_plugin(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully start activate plug-in job."""
        mock_asynchronous_job_handler = MagicMock()
        mock_asynchronous_job_handler.return_value = True
        background_job_manager._asynchronous_job_handler = mock_asynchronous_job_handler
        plugin = "compression"

        result = background_job_manager.activate_plugin(plugin)

        mock_asynchronous_job_handler.activate_plugin.assert_called_once_with(plugin)
        assert result

    def test_successfully_deactivate_plugin(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully start deactivate plug-in job."""
        mock_asynchronous_job_handler = MagicMock()
        mock_asynchronous_job_handler.return_value = True
        background_job_manager._asynchronous_job_handler = mock_asynchronous_job_handler
        plugin = "compression"

        result = background_job_manager.deactivate_plugin(plugin)

        mock_asynchronous_job_handler.deactivate_plugin.assert_called_once_with(plugin)
        assert result

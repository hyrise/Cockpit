"""Tests for the background_scheduler module."""
from multiprocessing import Value
from typing import Any, Callable, Tuple
from unittest.mock import call, patch

from pytest import fixture

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.background_scheduler import BackgroundJobManager
from hyrisecockpit.database_manager.job.ping_hyrise import ping_hyrise
from hyrisecockpit.database_manager.job.update_chunks_data import update_chunks_data
from hyrisecockpit.database_manager.job.update_plugin_log import update_plugin_log
from hyrisecockpit.database_manager.job.update_queue_length import update_queue_length
from hyrisecockpit.database_manager.job.update_storage_data import update_storage_data
from hyrisecockpit.database_manager.job.update_system_data import update_system_data
from hyrisecockpit.database_manager.job.update_workload_operator_information import (
    update_workload_operator_information,
)
from hyrisecockpit.database_manager.job.update_workload_statement_information import (
    update_workload_statement_information,
)

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
        "hyrisecockpit.database_manager.background_scheduler.BackgroundScheduler",
        MagicMock(),
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.BackgroundJobManager._init_jobs",
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

    @patch("hyrisecockpit.database_manager.background_scheduler.BackgroundScheduler")
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.BackgroundJobManager._init_jobs"
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.AsynchronousJobHandler",
    )
    def test_initializes_correctly(
        self,
        mock_asynchronous_job_handler: MagicMock,
        mock_init_jobs: MagicMock,
        mock_background_scheduler: MagicMock,
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
        mock_init_jobs.assert_called_once()
        mock_background_scheduler.assert_called_once()
        mock_asynchronous_job_handler.assert_called_once_with(
            background_job_manager._database_blocked,
            background_job_manager._connection_factory,
            background_job_manager._workload_drivers,
        )

    def test_initializes_background_scheduler_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test initialization of background scheduler job."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.add_job.return_value = None
        background_job_manager._scheduler = mock_scheduler

        jobs: Tuple[Callable[..., Any], str, int] = [
            (
                update_queue_length,
                "interval",
                1,
                (
                    background_job_manager._worker_pool,
                    background_job_manager._hyrise_active,
                ),
            ),
            (
                update_workload_statement_information,
                "interval",
                5,
                (background_job_manager._storage_connection_factory,),
            ),
            (
                update_chunks_data,
                "interval",
                5,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (
                update_system_data,
                "interval",
                1,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (
                update_storage_data,
                "interval",
                5,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (
                update_plugin_log,
                "interval",
                1,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (
                update_workload_statement_information,
                "interval",
                1,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (
                update_workload_operator_information,
                "interval",
                1,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (ping_hyrise, "interval", 0.5, (background_job_manager._connection_factory, background_job_manager._hyrise_active)),  # type: ignore
        ]

        expected = [
            call.add_job(func=job[0], trigger=job[1], seconds=job[2], args=job[3])  # type: ignore
            for job in jobs
        ]

        background_job_manager._init_jobs()

        mock_scheduler.mock_calls == expected

    def test_background_scheduler_starts(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start of background scheduler."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.start.return_value = None
        background_job_manager._scheduler = mock_scheduler

        background_job_manager.start()

        mock_scheduler.start.assert_called_once()

    def test_background_scheduler_closes(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test close of background scheduler object."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.shutdown.return_value = None
        background_job_manager._scheduler = mock_scheduler
        background_job_manager._update_workload_statement_information_job = MagicMock()
        background_job_manager._update_system_data_job = MagicMock()
        background_job_manager._update_chunks_data_job = MagicMock()
        background_job_manager._update_storage_data_job = MagicMock()
        background_job_manager._update_plugin_log_job = MagicMock()
        background_job_manager._ping_hyrise_job = MagicMock()
        background_job_manager._update_queue_length_job = MagicMock()
        background_job_manager._update_workload_operator_information_job = MagicMock()

        background_job_manager.close()

        background_job_manager._update_workload_statement_information_job.remove.assert_called_once()
        background_job_manager._update_system_data_job.remove.assert_called_once()
        background_job_manager._update_chunks_data_job.remove.assert_called_once()
        background_job_manager._update_storage_data_job.remove.assert_called_once()
        background_job_manager._update_plugin_log_job.remove.assert_called_once()
        background_job_manager._ping_hyrise_job.remove.assert_called_once()
        background_job_manager._update_queue_length_job.remove.assert_called_once()
        background_job_manager._update_workload_operator_information_job.remove.assert_called_once()
        mock_scheduler.shutdown.assert_called_once()

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

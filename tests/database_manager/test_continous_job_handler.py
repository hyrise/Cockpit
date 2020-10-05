# noqa
# type: ignore
# flake8: noqa
"""Test for continuous job handler."""

from typing import Any, Callable, Tuple
from unittest.mock import MagicMock, call, patch

from hyrisecockpit.database_manager.continuous_job_handler import ContinuousJobHandler
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


class TestContinuousJobHandler:
    """This class tests the continuous job handler."""

    @patch("hyrisecockpit.database_manager.continuous_job_handler.BackgroundScheduler")
    def test_inintializes_continuous_job_handler(
        self, mock_background_scheduler: MagicMock
    ) -> None:
        """Test if continuous job handler is created correctly."""
        mock_background_scheduler_obj = MagicMock()
        mock_background_scheduler.return_value = mock_background_scheduler_obj
        continuous_job_handler = ContinuousJobHandler(
            "connection_factory",
            "hyrise_active",
            "worker_pool",
            "storage_connection_factory",
            "database_blocked",
        )

        assert continuous_job_handler._connection_factory == "connection_factory"
        assert continuous_job_handler._hyrise_active == "hyrise_active"
        assert continuous_job_handler._worker_pool == "worker_pool"
        assert (
            continuous_job_handler._storage_connection_factory
            == "storage_connection_factory"
        )
        assert continuous_job_handler._previous_system_data == {
            "previous_system_usage": None,
            "previous_process_usage": None,
        }
        assert continuous_job_handler._previous_chunk_data == {
            "value": None,
        }
        assert continuous_job_handler._scheduler == mock_background_scheduler_obj

    @patch(
        "hyrisecockpit.database_manager.continuous_job_handler.BackgroundScheduler",
        MagicMock(),
    )
    def test_initializes_background_scheduler_job(self) -> None:
        """Test initialization of background scheduler job."""
        continuous_job_handler = ContinuousJobHandler(
            "connection_factory",
            "hyrise_active",
            "worker_pool",
            "storage_connection_factory",
            "database_blocked",
        )
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.add_job.return_value = None
        continuous_job_handler._scheduler = mock_scheduler

        jobs: Tuple[Callable[..., Any], str, int] = [
            (
                update_queue_length,
                "interval",
                1,
                (
                    continuous_job_handler._worker_pool,
                    continuous_job_handler._hyrise_active,
                ),
            ),
            (
                update_workload_statement_information,
                "interval",
                5,
                (continuous_job_handler._storage_connection_factory,),
            ),
            (
                update_chunks_data,
                "interval",
                5,
                (
                    continuous_job_handler._database_blocked,
                    continuous_job_handler._connection_factory,
                    continuous_job_handler._storage_connection_factory,
                ),
            ),
            (
                update_system_data,
                "interval",
                1,
                (
                    continuous_job_handler._database_blocked,
                    continuous_job_handler._connection_factory,
                    continuous_job_handler._storage_connection_factory,
                ),
            ),
            (
                update_storage_data,
                "interval",
                5,
                (
                    continuous_job_handler._database_blocked,
                    continuous_job_handler._connection_factory,
                    continuous_job_handler._storage_connection_factory,
                ),
            ),
            (
                update_plugin_log,
                "interval",
                1,
                (
                    continuous_job_handler._database_blocked,
                    continuous_job_handler._connection_factory,
                    continuous_job_handler._storage_connection_factory,
                ),
            ),
            (
                update_workload_statement_information,
                "interval",
                1,
                (
                    continuous_job_handler._database_blocked,
                    continuous_job_handler._connection_factory,
                    continuous_job_handler._storage_connection_factory,
                ),
            ),
            (
                update_workload_operator_information,
                "interval",
                1,
                (
                    continuous_job_handler._database_blocked,
                    continuous_job_handler._connection_factory,
                    continuous_job_handler._storage_connection_factory,
                ),
            ),
            (
                ping_hyrise,
                "interval",
                0.5,
                (
                    continuous_job_handler._connection_factory,
                    continuous_job_handler._hyrise_active,
                ),
            ),
        ]

        expected = [
            call.add_job(func=job[0], trigger=job[1], seconds=job[2], args=job[3])
            for job in jobs
        ]

        continuous_job_handler._init_jobs()

        mock_scheduler.mock_calls == expected

    def test_background_scheduler_closes(self) -> None:
        """Test close of background scheduler object."""
        continuous_job_handler = ContinuousJobHandler(
            "connection_factory",
            "hyrise_active",
            "worker_pool",
            "storage_connection_factory",
            "database_blocked",
        )
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.shutdown.return_value = None
        continuous_job_handler._scheduler = mock_scheduler
        continuous_job_handler._update_workload_statement_information_job = MagicMock()
        continuous_job_handler._update_system_data_job = MagicMock()
        continuous_job_handler._update_chunks_data_job = MagicMock()
        continuous_job_handler._update_storage_data_job = MagicMock()
        continuous_job_handler._update_plugin_log_job = MagicMock()
        continuous_job_handler._ping_hyrise_job = MagicMock()
        continuous_job_handler._update_queue_length_job = MagicMock()
        continuous_job_handler._update_workload_operator_information_job = MagicMock()

        continuous_job_handler.close()

        continuous_job_handler._update_workload_statement_information_job.remove.assert_called_once()
        continuous_job_handler._update_system_data_job.remove.assert_called_once()
        continuous_job_handler._update_chunks_data_job.remove.assert_called_once()
        continuous_job_handler._update_storage_data_job.remove.assert_called_once()
        continuous_job_handler._update_plugin_log_job.remove.assert_called_once()
        continuous_job_handler._ping_hyrise_job.remove.assert_called_once()
        continuous_job_handler._update_queue_length_job.remove.assert_called_once()
        continuous_job_handler._update_workload_operator_information_job.remove.assert_called_once()
        mock_scheduler.shutdown.assert_called_once()

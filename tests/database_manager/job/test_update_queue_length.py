"""Tests for the update queue length job."""
from unittest.mock import patch

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_queue_length import update_queue_length


class TestUpdateQueueLength:
    """Tests for the update queue length."""

    @patch("hyrisecockpit.database_manager.job.update_queue_length.time_ns", lambda: 42)
    def test_logs_queue_length(self) -> None:
        """Test logging of the queue length."""
        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        mock_worker_pool = MagicMock()
        mock_worker_pool.get_queue_length.return_value = 100

        update_queue_length(
            mock_worker_pool, mock_storage_connection_factory,
        )

        mock_cursor.log_meta_information.assert_called_once_with(
            "queue_length", {"queue_length": 100}, 42
        )

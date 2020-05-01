"""Tests for the update queue length job."""
from unittest.mock import patch

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_queue_length import update_queue_length

fake_storage_host = "influx"
fake_storage_port = "666"
fake_storage_user = "Me"
fake_storage_password = "super password"
fake_database_id = (
    "Was muss beim Installieren von Windows gedrückt werden? Beide Daumen"
)


class TestUpdateQueueLength:
    """Tests for the update queue length."""

    @patch("hyrisecockpit.database_manager.job.update_queue_length.StorageCursor")
    @patch("hyrisecockpit.database_manager.job.update_queue_length.time_ns", lambda: 42)
    def test_logs_queue_length(
        self, mock_storage_cursor_constructor: MagicMock
    ) -> None:
        """Test logging of the queue length."""
        mock_storage_cursor = MagicMock()
        mock_storage_cursor.log_meta_information.return_value = None
        mock_storage_cursor_constructor.return_value.__enter__.return_value = (
            mock_storage_cursor
        )
        mock_worker_pool = MagicMock()
        mock_worker_pool.get_queue_length.return_value = 100

        update_queue_length(
            mock_worker_pool,
            fake_storage_host,
            fake_storage_port,
            fake_storage_user,
            fake_storage_password,
            fake_database_id,
        )

        mock_storage_cursor.log_meta_information.assert_called_once_with(
            "queue_length", {"queue_length": 100}, 42
        )

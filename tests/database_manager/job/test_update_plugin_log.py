"""Tests for the update plug-in log job."""

from typing import List, Tuple
from unittest.mock import patch

from pandas import DataFrame

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_plugin_log import update_plugin_log

fake_database_blocked = "blocked"
fake_connection_factory = "connection_factory"
fake_storage_host = "influx"
fake_storage_port = "666"
fake_storage_user = "Me"
fake_storage_password = "super password"
fake_database_id = "Was ist Spider-Man's Trumberuf? Webdesigner!"


class TestUpdatePluginLogJob:
    """Tests for the update chunk data job."""

    @patch("hyrisecockpit.database_manager.job.update_plugin_log.StorageCursor")
    @patch("hyrisecockpit.database_manager.job.update_plugin_log.sql_to_data_frame")
    @patch(
        "hyrisecockpit.database_manager.job.update_plugin_log.time_ns",
        lambda: 1_000_000,
    )
    def test_logs_plugin_log(
        self, mock_sql_to_data_frame: MagicMock, mock_storage_cursor: MagicMock
    ) -> None:
        """Test logs plugin log."""
        mock_cursor = MagicMock()
        mock_storage_cursor.return_value.__enter__.return_value = mock_cursor
        fake_not_empty_data_frame: DataFrame = DataFrame(
            {
                "timestamp": [0, 42],
                "reporter": ["KeepHyriseRunning", "HyrisePleaseStayAlive"],
                "message": ["error", "error"],
            }
        )
        mock_sql_to_data_frame.return_value = fake_not_empty_data_frame

        update_plugin_log(
            fake_database_blocked,
            fake_connection_factory,
            fake_storage_host,
            fake_storage_port,
            fake_storage_user,
            fake_storage_password,
            fake_database_id,
        )

        expected_function_argument: List[Tuple[int, str, str]] = [
            (0, "KeepHyriseRunning", "error"),
            (42, "HyrisePleaseStayAlive", "error"),
        ]

        mock_sql_to_data_frame.assert_called_once_with(
            fake_database_blocked,
            fake_connection_factory,
            """SELECT * FROM meta_log WHERE "timestamp" >= %s AND "timestamp" < %s;""",
            params=(-4999, 1),
        )
        mock_cursor.log_plugin_log.assert_called_once_with(expected_function_argument)

    @patch("hyrisecockpit.database_manager.job.update_plugin_log.StorageCursor")
    @patch("hyrisecockpit.database_manager.job.update_plugin_log.sql_to_data_frame")
    @patch(
        "hyrisecockpit.database_manager.job.update_plugin_log.time_ns",
        lambda: 1_000_000,
    )
    def test_doesnt_log_plugin_log_when_empty(
        self, mock_sql_to_data_frame: MagicMock, mock_storage_cursor: MagicMock
    ) -> None:
        """Test logs plugin log."""
        mock_cursor = MagicMock()
        mock_storage_cursor.return_value.__enter__.return_value = mock_cursor
        fake_empty_data_frame: DataFrame = DataFrame()
        mock_sql_to_data_frame.return_value = fake_empty_data_frame

        update_plugin_log(
            fake_database_blocked,
            fake_connection_factory,
            fake_storage_host,
            fake_storage_port,
            fake_storage_user,
            fake_storage_password,
            fake_database_id,
        )

        mock_cursor.log_plugin_log.assert_not_called()

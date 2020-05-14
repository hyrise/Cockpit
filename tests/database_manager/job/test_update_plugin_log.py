"""Tests for the update plug-in log job."""

from typing import List, Tuple
from unittest.mock import patch

from pandas import DataFrame

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_plugin_log import update_plugin_log

fake_database_blocked = "blocked?"
fake_connection_factory = "Was ist Spider-Man's Trumberuf? Webdesigner!"


class TestUpdatePluginLogJob:
    """Tests for the update chunk data job."""

    @patch("hyrisecockpit.database_manager.job.update_plugin_log.sql_to_data_frame")
    @patch(
        "hyrisecockpit.database_manager.job.update_plugin_log.time_ns",
        lambda: 1_000_000,
    )
    def test_logs_plugin_log(self, mock_sql_to_data_frame: MagicMock) -> None:
        """Test logs plugin log."""
        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        fake_not_empty_data_frame: DataFrame = DataFrame(
            {
                "timestamp": [0, 42],
                "reporter": ["KeepHyriseRunning", "HyrisePleaseStayAlive"],
                "message": ["error", "error"],
                "log_level": ["Warning", "Warning"],
            }
        )
        mock_sql_to_data_frame.return_value = fake_not_empty_data_frame

        update_plugin_log(
            fake_database_blocked,
            fake_connection_factory,
            mock_storage_connection_factory,
        )

        expected_function_argument: List[Tuple[int, str, str, str]] = [
            (0, "KeepHyriseRunning", "error", "Warning"),
            (42, "HyrisePleaseStayAlive", "error", "Warning"),
        ]

        mock_sql_to_data_frame.assert_called_once_with(
            fake_database_blocked,
            fake_connection_factory,
            """SELECT * FROM meta_log WHERE "timestamp" >= %s AND "timestamp" < %s;""",
            params=(-4999, 1),
        )
        mock_cursor.log_plugin_log.assert_called_once_with(expected_function_argument)

    @patch("hyrisecockpit.database_manager.job.update_plugin_log.sql_to_data_frame")
    @patch(
        "hyrisecockpit.database_manager.job.update_plugin_log.time_ns",
        lambda: 1_000_000,
    )
    def test_doesnt_log_plugin_log_when_empty(
        self, mock_sql_to_data_frame: MagicMock
    ) -> None:
        """Test logs plugin log."""
        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        fake_empty_data_frame: DataFrame = DataFrame()
        mock_sql_to_data_frame.return_value = fake_empty_data_frame

        update_plugin_log(
            fake_database_blocked,
            fake_connection_factory,
            mock_storage_connection_factory,
        )

        mock_cursor.log_plugin_log.assert_not_called()

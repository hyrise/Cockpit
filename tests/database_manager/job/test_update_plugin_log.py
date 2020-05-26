"""Tests for the update plug-in log job."""

from datetime import datetime
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
        "hyrisecockpit.database_manager.job.update_plugin_log.time",
        lambda: 1_000_000.0,
    )
    @patch(
        "hyrisecockpit.database_manager.job.update_plugin_log._datetime_str_to_unix_timestamp",
        lambda x: 10,
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
                "timestamp": ["2020-05-15 14:12:24", "2020-05-15 14:25:24"],
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
            (10, "KeepHyriseRunning", "error", "Warning"),
            (10, "HyrisePleaseStayAlive", "error", "Warning"),
        ]

        expected_startts = str(datetime.fromtimestamp(1_000_000.0 - 5.0))
        expected_endts = str(datetime.fromtimestamp(1_000_000.0))

        mock_sql_to_data_frame.assert_called_once_with(
            fake_database_blocked,
            fake_connection_factory,
            """SELECT * FROM meta_log WHERE "timestamp" >= %s AND "timestamp" < %s;""",
            params=(expected_startts, expected_endts),
        )
        mock_cursor.log_plugin_log.assert_called_once_with(expected_function_argument)

    @patch("hyrisecockpit.database_manager.job.update_plugin_log.sql_to_data_frame")
    @patch(
        "hyrisecockpit.database_manager.job.update_plugin_log.time",
        lambda: 1_000_000.0,
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

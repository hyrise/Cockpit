"""Tests for the update operator data job."""
from json import dumps
from unittest.mock import patch

from pandas import DataFrame

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_operator_data import update_operator_data


class TestUpdateOperatorDataJob:
    """Tests update operator data job."""

    @patch("hyrisecockpit.database_manager.job.update_operator_data.sql_to_data_frame")
    @patch(
        "hyrisecockpit.database_manager.job.update_operator_data.time_ns", lambda: 42
    )
    def test_logs_operator_data(self, mock_sql_to_data_frame: MagicMock,) -> None:
        """Test logging of the operator data."""
        fake_storage_df: DataFrame = DataFrame(
            {
                "operator": ["Projection", "TableWrapper"],
                "total_time_ns": [2060976830, 61949034],
            }
        )
        mock_sql_to_data_frame.return_value = fake_storage_df

        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        mock_database_blocked = False
        mock_connection_factory = MagicMock()

        update_operator_data(
            mock_database_blocked,
            mock_connection_factory,
            mock_storage_connection_factory,
        )

        expected_output = list(fake_storage_df.to_dict("index").values())

        mock_cursor.log_meta_information.assert_called_with(
            "operator_data", {"operator_data": dumps(expected_output)}, 42
        )

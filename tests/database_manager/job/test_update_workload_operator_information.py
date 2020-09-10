"""Tests for the update workload operator information job."""
from json import dumps
from unittest.mock import patch

from pandas import DataFrame

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_workload_operator_information import (
    update_workload_operator_information,
)


class TestUpdateWorkloadOperatorInformation:
    """Tests update workload operator information job."""

    @patch(
        "hyrisecockpit.database_manager.job.update_workload_operator_information.sql_to_data_frame"
    )
    @patch(
        "hyrisecockpit.database_manager.job.update_workload_operator_information.time_ns",
        lambda: 42,
    )
    def test_logs_workload_operator_information(
        self, mock_sql_to_data_frame: MagicMock,
    ) -> None:
        """Test logging of the workload operator information."""
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

        update_workload_operator_information(
            mock_database_blocked,
            mock_connection_factory,
            mock_storage_connection_factory,
        )

        expected_workload_operator_information = list(
            fake_storage_df.to_dict("index").values()
        )

        mock_cursor.log_meta_information.assert_called_with(
            "workload_operator_information",
            {
                "workload_operator_information": dumps(
                    expected_workload_operator_information
                )
            },
            42,
        )

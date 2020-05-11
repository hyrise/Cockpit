"""Tests for the update system data job."""
from typing import Dict, Union
from unittest.mock import patch

from pandas import DataFrame

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_system_data import (
    _create_system_data_dict,
    update_system_data,
)

fake_database_blocked = "blocked"
fake_connection_factory = (
    "Warum stehen Studenten schon um 7 uhr auf? Weil um 8 uhr der Supermarkt schließt"
)


class TestUpdateSystemDataJob:
    """Tests update system data job."""

    def test_successfully_create_system_data_dict(self) -> None:
        """Test creates system data dict successfully."""
        fake_utilization_df: DataFrame = DataFrame(
            {
                "cpu_system_time": [120],
                "cpu_process_time": [300],
                "system_memory_free": [0],
                "system_memory_available": [0],
                "process_virtual_memory": [42],
                "cpu_affinity_count": [16],
            }
        )
        fake_system_df: DataFrame = DataFrame(
            {
                "cpu_count": [10],
                "cpu_model": [120],
                "system_memory_total_bytes": [1234],
            }
        )
        expected_dict: Dict[str, float] = {
            "cpu_system_time": 12.0,
            "cpu_process_time": 30.0,
            "cpu_count": 10,
            "cpu_model": 120,
            "free_memory": 0,
            "available_memory": 0,
            "total_memory": 1234,
            "database_threads": 16,
        }

        received_dict: Dict[str, Union[int, float]] = _create_system_data_dict(
            fake_utilization_df, fake_system_df
        )

        assert received_dict == expected_dict

    @patch(
        "hyrisecockpit.database_manager.job.update_system_data._create_system_data_dict"
    )
    @patch("hyrisecockpit.database_manager.job.update_system_data.sql_to_data_frame")
    @patch("hyrisecockpit.database_manager.job.update_system_data.time_ns", lambda: 42)
    def test_logs_updated_system_data(
        self,
        mock_sql_to_data_frame: MagicMock,
        mock_create_system_data_dict: MagicMock,
    ) -> None:
        """Test logs updated system data."""
        fake_not_empty_df: DataFrame = DataFrame({"column1": [1]})
        fake_system_dict: Dict[str, float] = {
            "cpu_system_usage": 120.0,
            "cpu_process_usage": 300.0,
            "cpu_count": 16,
            "cpu_clock_speed": 120,
            "free_memory": 0,
            "used_memory": 42,
            "total_memory": 1234,
            "database_threads": 16,
        }
        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        mock_sql_to_data_frame.return_value = fake_not_empty_df

        mock_create_system_data_dict.return_value = fake_system_dict

        update_system_data(
            fake_database_blocked,
            fake_connection_factory,
            mock_storage_connection_factory,
        )

        mock_cursor.log_meta_information.assert_called_once_with(
            "system_data", fake_system_dict, 42
        )

    @patch(
        "hyrisecockpit.database_manager.job.update_system_data._create_system_data_dict"
    )
    @patch("hyrisecockpit.database_manager.job.update_system_data.sql_to_data_frame")
    @patch("hyrisecockpit.database_manager.job.update_system_data.time_ns", lambda: 42)
    def test_doesnt_log_updated_system_data(
        self,
        mock_sql_to_data_frame: MagicMock,
        mock_create_system_data_dict: MagicMock,
    ) -> None:
        """Test doesn't log updated system data when it's emtpy."""
        fake_empty_df: DataFrame = DataFrame()

        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        mock_sql_to_data_frame.return_value = fake_empty_df

        update_system_data(
            fake_database_blocked,
            fake_connection_factory,
            mock_storage_connection_factory,
        )

        mock_create_system_data_dict.assert_not_called()
        mock_cursor.log_meta_information.assert_not_called()

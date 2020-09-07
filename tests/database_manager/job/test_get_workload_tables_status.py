"""Tests for the get workload tables status job."""

from typing import List
from unittest.mock import patch

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.get_workload_tables_status import (
    get_workload_tables_status,
    workload_tables_status,
)


class TestGetWorkloadTablesStatusJob:
    """Tests for the get workload tables status job."""

    def test_gets_loaded_workloads_and_tables(self) -> None:
        """Test get loaded benchmark for present benchmarks."""
        mock_driver_all_tables_loaded = MagicMock()
        mock_driver_all_tables_loaded.get_table_names.return_value = {
            "customer": "customer_tpch_1",
            "item": "item_tpch_1",
        }
        mock_driver_all_tables_loaded.get_scalefactors.return_value = [1.0]
        mock_driver_not_all_tables_loaded = MagicMock()
        mock_driver_not_all_tables_loaded.get_table_names.return_value = {
            "Gary": "gary_rock_1",
            "Clark": "clark_rock_1",
        }
        mock_driver_not_all_tables_loaded.get_scalefactors.return_value = [1.0]
        workload_drivers = {
            "tpch": mock_driver_all_tables_loaded,
            "rock": mock_driver_not_all_tables_loaded,
        }
        fake_loaded_tables = ["customer_tpch_1", "item_tpch_1", "gary_rock_1"]

        expected = [
            {
                "workload_type": "tpch",
                "scale_factor": 1.0,
                "loaded_tables": ["customer", "item"],
                "missing_tables": [],
                "completely_loaded": True,
                "database_representation": {
                    "customer": "customer_tpch_1",
                    "item": "item_tpch_1",
                },
            },
            {
                "workload_type": "rock",
                "scale_factor": 1.0,
                "loaded_tables": ["Gary"],
                "missing_tables": ["Clark"],
                "completely_loaded": False,
                "database_representation": {
                    "Gary": "gary_rock_1",
                    "Clark": "clark_rock_1",
                },
            },
        ]

        results: List = workload_tables_status(fake_loaded_tables, workload_drivers)
        assert results == expected

    @patch(
        "hyrisecockpit.database_manager.job.get_workload_tables_status.get_loaded_tables_in_database_job"
    )
    @patch(
        "hyrisecockpit.database_manager.job.get_workload_tables_status.workload_tables_status"
    )
    def test_get_status_of_workload_tables(
        self,
        mock_workload_tables_status: MagicMock,
        mock_get_loaded_tables_in_database_job: MagicMock,
    ):
        """Test get loaded benchmark data."""
        mock_workoad_status = [
            {
                "workload_type": "tpch",
                "scale_factor": 1.0,
                "loaded_tables": ["customer", "item"],
                "missing_tables": [],
                "completely_loaded": True,
                "database_representation": {
                    "customer": "customer_tpch_1",
                    "item": "item_tpch_1",
                },
            }
        ]
        mock_get_loaded_tables_in_database_job.return_value = ["table1", "table2"]
        mock_workload_tables_status.return_value = mock_workoad_status
        mock_connection_factory = MagicMock()
        mock_workload_driver = {"tpch": "tpch_driver"}
        loaded_workloads = get_workload_tables_status(
            mock_connection_factory, mock_workload_driver
        )

        mock_get_loaded_tables_in_database_job.assert_called_once()
        mock_workload_tables_status.assert_called_once_with(
            ["table1", "table2"], {"tpch": "tpch_driver"}
        )
        assert loaded_workloads == mock_workoad_status

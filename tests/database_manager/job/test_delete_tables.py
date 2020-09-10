"""Tests for the delete tables job."""
from multiprocessing import Value
from unittest.mock import patch

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.delete_tables import delete_tables


class TestDeleteTablesJob:
    """Tests for the delete tables job."""

    @patch("hyrisecockpit.database_manager.job.delete_tables.get_loaded_tables")
    @patch("hyrisecockpit.database_manager.job.delete_tables.execute_queries_parallel")
    def test_delete_tables(
        self,
        mock_execute_queries_parallel: MagicMock,
        mock_get_loaded_tables: MagicMock,
    ) -> None:
        """Test delete tables job."""
        fake_database_blocked = Value("b", 1)
        fake_workload_type = "tpch"
        fake_scale_factor = 1.0
        mock_driver = MagicMock()
        mock_driver.get_delete_queries.return_value = {
            "customer_1": "delete customer_1",
            "warehouse_1": "delete warehouse_1",
        }
        fake_workload_drivers = {"tpch": mock_driver}
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        mock_get_loaded_tables.return_value = ["customer_1"]

        delete_tables(
            fake_database_blocked,
            fake_workload_type,
            fake_scale_factor,
            mock_connection_factory,
            fake_workload_drivers,
        )

        mock_get_loaded_tables.assert_called_once_with(
            ["customer_1", "warehouse_1"], mock_connection_factory
        )
        mock_execute_queries_parallel.assert_called_once_with(
            ["delete customer_1"], mock_connection_factory,
        )

"""Tests for the update storage data job."""
from json import dumps
from unittest.mock import patch

from pandas import DataFrame

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.interfaces import StorageDataType
from hyrisecockpit.database_manager.job.update_storage_data import update_storage_data

fake_database_blocked = "blocked"
fake_connection_factory = "connection_factory"
fake_storage_host = "influx"
fake_storage_port = "666"
fake_storage_user = "Me"
fake_storage_password = "super password"
fake_database_id = "Wie bezahlen die Dinosaurier? Mit Tyrannosaurus Schecks!"


class TestUpdateStorageDataJob:
    """Test update storage data job."""

    @patch("hyrisecockpit.database_manager.job.update_storage_data.StorageCursor")
    @patch("hyrisecockpit.database_manager.job.update_storage_data.sql_to_data_frame")
    @patch("hyrisecockpit.database_manager.job.update_storage_data.time_ns", lambda: 42)
    def test_successfully_logs_storage_data(
        self,
        mock_sql_to_data_frame: MagicMock,
        mock_storage_cursor_constructor: MagicMock,
    ) -> None:
        """Test successfully logs storage data."""
        mock_storage_cursor = MagicMock()
        mock_storage_cursor.log_meta_information.return_value = None
        mock_storage_cursor_constructor.return_value.__enter__.return_value = (
            mock_storage_cursor
        )
        fake_storage_df: DataFrame = DataFrame(
            {
                "table_name": ["customer", "customer", "supplier"],
                "chunk_id": [0, 0, 0],
                "column_id": [0, 1, 2],
                "column_name": ["c_custkey", "c_nationkey", "s_address"],
                "column_data_type": ["int", "string", "string"],
                "encoding_type": ["Dictionary", "Dictionary", "Dictionary"],
                "vector_compression_type": [
                    "FixedSize2ByteAligned",
                    "FixedSize2ByteAligned",
                    "FixedSize2ByteAligned",
                ],
                "estimated_size_in_bytes": [9000, 1000, 400],
            }
        )

        mock_sql_to_data_frame.return_value = fake_storage_df

        expected_storage_dict: StorageDataType = {
            "customer": {
                "size": 10000,
                "number_columns": 2,
                "data": {
                    "c_custkey": {
                        "size": 9000,
                        "data_type": "int",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    },
                    "c_nationkey": {
                        "size": 1000,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    },
                },
            },
            "supplier": {
                "size": 400,
                "number_columns": 1,
                "data": {
                    "s_address": {
                        "size": 400,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    }
                },
            },
        }

        update_storage_data(
            fake_database_blocked,
            fake_connection_factory,
            fake_storage_host,
            fake_storage_port,
            fake_storage_user,
            fake_storage_password,
            fake_database_id,
        )

        mock_storage_cursor.log_meta_information.assert_called_with(
            "storage", {"storage_meta_information": dumps(expected_storage_dict)}, 42
        )

    @patch("hyrisecockpit.database_manager.job.update_storage_data.StorageCursor")
    @patch("hyrisecockpit.database_manager.job.update_storage_data.sql_to_data_frame")
    @patch("hyrisecockpit.database_manager.job.update_storage_data.time_ns", lambda: 42)
    def test_logs_empty_storage_data(
        self,
        mock_sql_to_data_frame: MagicMock,
        mock_storage_cursor_constructor: MagicMock,
    ) -> None:
        """Test doesn't log storage data when it's empty."""
        mock_storage_cursor = MagicMock()
        mock_storage_cursor.log_meta_information.return_value = None
        mock_storage_cursor_constructor.return_value.__enter__.return_value = (
            mock_storage_cursor
        )
        fake_empty_storage_df: DataFrame = DataFrame()
        mock_sql_to_data_frame.return_value = fake_empty_storage_df

        update_storage_data(
            fake_database_blocked,
            fake_connection_factory,
            fake_storage_host,
            fake_storage_port,
            fake_storage_user,
            fake_storage_password,
            fake_database_id,
        )

        mock_storage_cursor.log_meta_information.assert_called_with(
            "storage", {"storage_meta_information": dumps({})}, 42
        )

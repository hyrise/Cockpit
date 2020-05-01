"""Tests for the update chunks data job."""

from typing import Dict, List, Union
from unittest.mock import patch

from pandas import DataFrame

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_chunks_data import (
    _calculate_chunks_difference,
    _create_chunks_dictionary,
    update_chunks_data,
)


class TestUpdateChunksData:
    """Tests for the update chunk data job."""

    def test_successfully_calculates_chunk_differences(self) -> None:
        """Test successfully calculates chunks differences."""
        fake_base_dict: Dict[str, Dict[str, List[int]]] = {
            "customer": {"c_custkey": [15000], "c_name": [15000]},
            "supplier": {"s_address": [1000], "s_comment": [600]},
        }
        fake_substractor_dict: Dict[str, Dict[str, List[int]]] = {
            "customer": {"c_custkey": [1000], "c_name": [5000]},
            "supplier": {"s_address": [1000], "s_comment": [555]},
        }
        expected_dict: Dict[str, Dict[str, List[int]]] = {
            "customer": {"c_custkey": [14000], "c_name": [10000]},
            "supplier": {"s_address": [0], "s_comment": [45]},
        }

        received_dict: Dict = _calculate_chunks_difference(
            fake_base_dict, fake_substractor_dict
        )

        assert expected_dict == received_dict

    def test_successfully_creates_chunks_data_frame(self) -> None:
        """Test successfully creates chunks dataframe from sql."""
        fake_data_frame_data: Dict[str, List[Union[str, int]]] = {
            "table_name": ["customer", "customer", "supplier", "supplier"],
            "column_name": ["c_custkey", "c_name", "s_address", "s_comment"],
            "chunk_id": [0, 0, 42, 5],
            "access_count": [15000, 15000, 1000, 600],
        }

        fake_chunks_df: DataFrame = DataFrame(data=fake_data_frame_data)
        fake_chunks_dict: Dict = _create_chunks_dictionary(fake_chunks_df)

        expected_dict: Dict[str, Dict[str, List[int]]] = {
            "customer": {"c_custkey": [15000], "c_name": [15000]},
            "supplier": {"s_address": [1000], "s_comment": [600]},
        }

        assert fake_chunks_dict == expected_dict

    @patch("hyrisecockpit.database_manager.job.update_chunks_data.StorageCursor",)
    @patch("hyrisecockpit.database_manager.job.update_chunks_data.sql_to_data_frame",)
    @patch(
        "hyrisecockpit.database_manager.job.update_chunks_data._create_chunks_dictionary",
    )
    @patch(
        "hyrisecockpit.database_manager.job.update_chunks_data._calculate_chunks_difference",
    )
    @patch("hyrisecockpit.database_manager.job.update_chunks_data.time_ns", lambda: 42)
    def test_logs_updated_chunks_data_with_empty_meta_chunks(
        self,
        mock_calculate_chunks_difference: MagicMock,
        mock_create_chunks_dictionary: MagicMock,
        mock_sql_to_data_frame: MagicMock,
        mock_storage_cursor: MagicMock,
    ) -> None:
        """Test logs updated chunks data when meta chunks is empty."""
        mock_sql_to_data_frame.return_value = DataFrame()
        mock_cursor = MagicMock()
        mock_storage_cursor.return_value.__enter__.return_value = mock_cursor

        fake_database_blocked = "blocked"
        fake_connection_factory = "connection_factory"
        fake_storage_host = "influx"
        fake_storage_port = "666"
        fake_storage_user = "Me"
        fake_storage_password = "super password"
        fake_database_id = "Egal wie dicht du bist Goethe war dichter."
        expected_sql = """SELECT table_name, column_name, chunk_id, (point_accesses + sequential_accesses + monotonic_accesses + random_accesses) as access_count
        FROM meta_segments;"""

        update_chunks_data(
            fake_database_blocked,
            fake_connection_factory,
            fake_storage_host,
            fake_storage_port,
            fake_storage_user,
            fake_storage_password,
            fake_database_id,
        )

        mock_sql_to_data_frame.assert_called_once_with(
            fake_database_blocked, fake_connection_factory, expected_sql, None
        )
        mock_create_chunks_dictionary.assert_not_called()
        mock_calculate_chunks_difference.assert_not_called()
        mock_cursor.log_meta_information.assert_called_once_with(
            "chunks_data", {"chunks_data_meta_information": "{}"}, 42
        )

    @patch("hyrisecockpit.database_manager.job.update_chunks_data.StorageCursor",)
    @patch("hyrisecockpit.database_manager.job.update_chunks_data.sql_to_data_frame",)
    @patch(
        "hyrisecockpit.database_manager.job.update_chunks_data._create_chunks_dictionary",
    )
    @patch(
        "hyrisecockpit.database_manager.job.update_chunks_data._calculate_chunks_difference",
    )
    @patch("hyrisecockpit.database_manager.job.update_chunks_data.deepcopy",)
    @patch("hyrisecockpit.database_manager.job.update_chunks_data.time_ns", lambda: 42)
    @patch(
        "hyrisecockpit.database_manager.job.update_chunks_data.previous_chunks_data", 42
    )
    def test_logs_updated_chunks_data_with_meta_chunks(
        self,
        mock_deep_copy: MagicMock,
        mock_calculate_chunks_difference: MagicMock,
        mock_create_chunks_dictionary: MagicMock,
        mock_sql_to_data_frame: MagicMock,
        mock_storage_cursor: MagicMock,
    ) -> None:
        """Test logs updated chunks data when meta chunks is empty."""
        fake_not_empty_data_frame = DataFrame({"col1": [42]})
        mock_sql_to_data_frame.return_value = fake_not_empty_data_frame
        mock_cursor = MagicMock()
        mock_storage_cursor.return_value.__enter__.return_value = mock_cursor
        mock_deep_copy.return_value = {"new": 55}
        mock_calculate_chunks_difference.return_value = {"new": 55}

        fake_database_blocked = "blocked"
        fake_connection_factory = "connection_factory"
        fake_storage_host = "influx"
        fake_storage_port = "666"
        fake_storage_user = "Me"
        fake_storage_password = "super password"
        fake_database_id = "Egal wie dicht du bist Goethe war dichter."
        expected_sql = """SELECT table_name, column_name, chunk_id, (point_accesses + sequential_accesses + monotonic_accesses + random_accesses) as access_count
        FROM meta_segments;"""

        update_chunks_data(
            fake_database_blocked,
            fake_connection_factory,
            fake_storage_host,
            fake_storage_port,
            fake_storage_user,
            fake_storage_password,
            fake_database_id,
        )

        mock_sql_to_data_frame.assert_called_once_with(
            fake_database_blocked, fake_connection_factory, expected_sql, None
        )
        mock_create_chunks_dictionary.assert_called_once_with(fake_not_empty_data_frame)
        mock_calculate_chunks_difference.assert_called_once_with({"new": 55}, 42)
        mock_cursor.log_meta_information.assert_called_once_with(
            "chunks_data", {"chunks_data_meta_information": '{"new": 55}'}, 42
        )

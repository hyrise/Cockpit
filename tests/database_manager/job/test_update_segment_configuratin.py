from json import dumps
from unittest.mock import patch
from typing import Dict

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_segment_configuration import (
    _format_results,
    update_segment_configuration,
)


class TestUpdateSegmentConfiguration:
    def test_formats_results(self) -> None:
        sql_results = [
            (
                "lineitem_tpch_0_1",
                "l_orderkey",
                0,
                "Dictionary",
            ),
            (
                "lineitem_tpch_0_1",
                "l_partkey",
                0,
                "Dictionary",
            ),
            (
                "lineitem_tpch_0_1",
                "l_orderkey",
                1,
                "Dictionary",
            ),
            (
                "lineitem_tpch_0_1",
                "l_partkey",
                1,
                "Dictionary",
            ),
            (
                "lineitem_tpch_0_1",
                "l_orderkey",
                2,
                "LZ4",
            ),
            (
                "lineitem_tpch_0_1",
                "l_partkey",
                2,
                "LZ4",
            ),
            (
                "region_tpch_0_1",
                "r_regionkey",
                0,
                "Dictionary",
            ),
            (
                "region_tpch_0_1",
                "r_name",
                0,
                "Dictionary",
            ),
        ]
        expected = {
            "columns": {
                "lineitem_tpch_0_1": {
                    "l_orderkey": [0, 0, 1],
                    "l_partkey": [0, 0, 1],
                },
                "region_tpch_0_1": {
                    "r_regionkey": [0],
                    "r_name": [0],
                },
            },
            "mode_mapping": ["Dictionary", "LZ4"],
        }

        results: Dict = _format_results(sql_results)  # type: ignore

        assert expected == results

    @patch(
        "hyrisecockpit.database_manager.job.update_segment_configuration.time_ns",
        lambda: 42,
    )
    @patch(
        "hyrisecockpit.database_manager.job.update_segment_configuration._format_results"
    )
    @patch(
        "hyrisecockpit.database_manager.job.update_segment_configuration.execute_sql"
    )
    def test_updates_segment_configuration(
        self, mock_execute_sql: MagicMock, mock_format_results: MagicMock
    ) -> None:
        mock_results = [
            (
                "lineitem_tpch_0_1",
                "l_orderkey",
                0,
                "Ascending",
            ),
            (
                "lineitem_tpch_0_1",
                "l_partkey",
                0,
                "Ascending",
            ),
        ]
        mock_formatted_results = {
            "columns": {
                "lineitem_tpch_0_1": {
                    "l_orderkey": [0],
                    "l_partkey": [0],
                }
            },
            "mode_mapping": ["Ascending"],
        }
        mock_execute_sql.return_value = mock_results
        mock_format_results.return_value = mock_formatted_results
        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        update_segment_configuration(
            database_blocked=MagicMock(),
            connection_factory=MagicMock(),
            storage_connection_factory=mock_storage_connection_factory,
        )

        mock_format_results.asser_called_with(mock_results)
        mock_cursor.log_meta_information.assert_called_once_with(
            "segment_configuration",
            {
                "segment_configuration_encoding_type": dumps(mock_formatted_results),
                "segment_configuration_order_mode": dumps(mock_formatted_results),
            },
            42,
        )

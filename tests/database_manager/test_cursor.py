"""Tests for the cursor module."""
from typing import Any, Dict
from unittest.mock import MagicMock

from pytest import mark

from hyrisecockpit.database_manager.cursor import StorageCursor


class TestCursor:
    """Tests Cursor classes."""

    def test_logs_queries(self):
        """Test queries logging."""
        query_list = [
            (1, 2, "benchmark1", "query_no_1", "worker1"),
            (3, 4, "benchmark2", "query_no_2", "worker2"),
        ]

        expected_points = [
            {
                "measurement": "successful_queries",
                "tags": {
                    "benchmark": "benchmark1",
                    "query_no": "query_no_1",
                    "worker_id": "worker1",
                },
                "fields": {"latency": 2},
                "time": 1,
            },
            {
                "measurement": "successful_queries",
                "tags": {
                    "benchmark": "benchmark2",
                    "query_no": "query_no_2",
                    "worker_id": "worker2",
                },
                "fields": {"latency": 4},
                "time": 3,
            },
        ]

        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._connection = MagicMock()
        cursor._connection.write_points.return_value = None
        cursor.log_queries(query_list)

        cursor._connection.write_points.assert_called_once_with(
            expected_points, database="database"
        )

    @mark.parametrize(
        "measurement", ["storage_something", "some_chunks"],
    )
    @mark.parametrize(
        "fields", [{"field1": "some_value"}, {"field2": 9000}],
    )
    @mark.parametrize(
        "time_stamp", [123, 456],
    )
    def test_logs_plugin_log(
        self, measurement: str, fields: Dict[str, Any], time_stamp: int
    ):
        """Test meta_information logging."""
        expected_point = {
            "measurement": measurement,
            "fields": fields,
            "time": time_stamp,
        }
        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._connection = MagicMock()
        cursor._connection.write_points.return_value = None
        cursor.log_meta_information(measurement, fields, time_stamp)
        cursor._connection.write_point.assert_called_once_with(
            expected_point, database="database"
        )

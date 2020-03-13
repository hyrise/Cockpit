"""Tests for the cursor module."""
from typing import Any, Dict, List, Tuple
from unittest.mock import MagicMock

from pytest import mark

from hyrisecockpit.database_manager.cursor import StorageCursor


class TestCursor:
    """Tests Cursor classes."""

    @mark.parametrize(
        "queries",
        [
            [(1, 2, "benchmark1", "query_no_1", "worker1")],
            [
                (1, 2, "benchmark1", "query_no_1", "worker1"),
                (3, 4, "benchmark2", "query_no_2", "worker2"),
            ],
        ],
    )
    def test_logs_queries(self, queries: List[Tuple[int, int, str, str, str]]):
        """Test queries logging."""
        expected_points = [
            {
                "measurement": "successful_queries",
                "tags": {
                    "benchmark": query[2],
                    "query_no": query[3],
                    "worker_id": query[4],
                },
                "fields": {"latency": query[1]},
                "time": query[0],
            }
            for query in queries
        ]

        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._connection = MagicMock()
        cursor._connection.write_points.return_value = None
        cursor.log_queries(queries)

        cursor._connection.write_points.assert_called_once_with(
            expected_points, database="database"
        )

    @mark.parametrize(
        "queries",
        [
            [("table1", "column1", 9000, 123)],
            [("table1", "column1", 9000, 123), ("table2", "column2", 0, 456)],
        ],
    )
    def test_logs_access_data(self, queries: List[Tuple[str, str, int, int]]):
        """Test access data logging."""
        expected_points = [
            {
                "measurement": "access_data",
                "tags": {"table": query[0], "column": query[1]},
                "fields": {"access_counter": query[2]},
                "time": query[3],
            }
            for query in queries
        ]
        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._connection = MagicMock()
        cursor._connection.write_points.return_value = None
        cursor.log_access_data(queries)
        cursor._connection.write_points.assert_called_once_with(
            expected_points, database="database"
        )

    @mark.parametrize(
        "measurement", ["storage_something", "some_chunks"],
    )
    @mark.parametrize(
        "fields", [{"field1": "some_value"}, {"field1": "some_value", "field2": 9000}],
    )
    @mark.parametrize(
        "time_stamp", [123, 456789],
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

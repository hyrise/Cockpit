"""Tests for the cursor module."""
from typing import List, Tuple
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
        "query",
        [
            [(123, "CompressionPlugin", "Initialized!")],
            [
                (123, "CompressionPlugin", "Initialized!"),
                (
                    456,
                    "CompressionPlugin",
                    "No optimization possible with given parameters!",
                ),
            ],
        ],
    )
    def test_logs_plugin_log(self, query: List[Tuple[int, str, str]]):
        """Test queries logging."""
        expected_points = [
            {
                "measurement": "plugin_log",
                "tags": {"timestamp": q[0], "reporter": q[1]},
                "fields": {"message": q[2]},
                "time": q[0],
            }
            for q in query
        ]
        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._connection = MagicMock()
        cursor._connection.write_points.return_value = None
        cursor.log_plugin_log(query)
        cursor._connection.write_points.assert_called_once_with(
            expected_points, database="database"
        )

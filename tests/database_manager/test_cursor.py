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

"""Tests for the cursor module."""
from unittest.mock import MagicMock

from hyrisecockpit.database_manager.cursor import StorageCursor


class TestCursor:
    """Tests Cursor classes."""

    def test_logs_queries(self):
        """Test queries logging."""
        query_list = [
            (1, 2, "benchmark1", "query_no_1"),
            (3, 4, "benchmark2", "query_no_2"),
        ]

        expected_points = [
            {
                "measurement": "successful_queries",
                "tags": {"benchmark": "benchmark1", "query_no": "query_no_1"},
                "fields": {"latency": 2},
                "time": 1,
            },
            {
                "measurement": "successful_queries",
                "tags": {"benchmark": "benchmark2", "query_no": "query_no_2"},
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

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
            [(1, "worker1", "task_that_failed", "some_error")],
            [
                (1, "worker1", "task_that_failed", "some_error"),
                (1, "worker2", "other_task_that_failed", "another_error"),
            ],
        ],
    )
    def test_logs_failed_queries(self, queries: List[Tuple[int, str, str, str]]):
        """Test failed queries logging."""
        expected_points = [
            {
                "measurement": "failed_queries",
                "tags": {"worker_id": query[1]},
                "fields": {"task": query[2], "error": query[3]},
                "time": query[0],
            }
            for query in queries
        ]

        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._connection = MagicMock()
        cursor._connection.write_points.return_value = None
        cursor.log_failed_queries(queries)

        cursor._connection.write_points.assert_called_once_with(
            expected_points, database="database"
        )

    @mark.parametrize(
        "queries",
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
    def test_logs_plugin_log(self, queries: List[Tuple[int, str, str]]):
        """Test queries logging."""
        expected_points = [
            {
                "measurement": "plugin_log",
                "tags": {"timestamp": query[0], "reporter": query[1]},
                "fields": {"message": query[2]},
                "time": query[0],
            }
            for query in queries
        ]
        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._connection = MagicMock()
        cursor._connection.write_points.return_value = None
        cursor.log_plugin_log(queries)
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
    def test_logs_meta_information(
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
        cursor._connection.write_points.assert_called_once_with(
            [expected_point], database="database"
        )

    def test_creates_database(self):
        """Test creating of an Influx database."""
        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._database = "database_name"
        cursor._connection = MagicMock()
        cursor._connection.create_database.return_value = None

        cursor.create_database()
        cursor._connection.create_database.assert_called_once_with("database_name")

    def test_drops_database(self):
        """Test dropping of an Influx database."""
        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._database = "database_name"
        cursor._connection = MagicMock()
        cursor._connection.drop_database.return_value = None

        cursor.drop_database()
        cursor._connection.drop_database.assert_called_once_with("database_name")

    def test_creates_continuous_query(self):
        """Test creating of a continuous query in Influx database."""
        cursor = StorageCursor("host", "port", "user", "password", "database")
        cursor._database = "database_name"
        cursor._connection = MagicMock()
        cursor._connection.create_continuous_query.return_value = None

        cursor.create_continuous_query(
            "query_name", "query statement", "resample_options"
        )
        cursor._connection.create_continuous_query.assert_called_once_with(
            "query_name", "query statement", "database_name", "resample_options"
        )

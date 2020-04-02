"""Tests for the cursor module."""
from typing import Any, Dict, List, Tuple
from unittest.mock import MagicMock, patch

from pandas import DataFrame
from pytest import fixture, mark

from hyrisecockpit.database_manager.cursor import PoolCursor, StorageCursor


class TestCursor:
    """Tests Cursor classes."""

    @fixture
    @patch(
        "hyrisecockpit.database_manager.cursor.PoolCursor._initialize", MagicMock(),
    )
    def pool_cursor(self) -> PoolCursor:
        """Return patched pool cursor object."""
        return PoolCursor(MagicMock())

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

    @patch("hyrisecockpit.database_manager.cursor.PoolCursor._initialize",)
    def test_initializes_pool_cursor_correctly(self, mocked_initialize) -> None:
        """Test initializes pool cursor correctly."""
        mocked_pool: MagicMock = MagicMock()
        pool_cursor: PoolCursor = PoolCursor(mocked_pool)

        pool_cursor.pool == mocked_pool
        mocked_initialize.assert_called_once()

    def test_initializes_connection_correctly(self) -> None:
        """Test initialize connection and cursor correctly."""
        mocked_pool: MagicMock = MagicMock()
        mocked_connection: MagicMock = MagicMock()
        mocked_cursor: MagicMock = MagicMock()

        mocked_connection.cursor.return_value = mocked_cursor
        mocked_pool.getconn.return_value = mocked_connection

        pool_cursor: PoolCursor = PoolCursor(mocked_pool)

        assert pool_cursor._connection == mocked_connection
        mocked_connection.set_session.assert_called_once_with(autocommit=True)
        assert pool_cursor._cur == mocked_cursor

    def test_executes(self, pool_cursor) -> None:
        """Test execute witch valid pool cursor and no exception."""
        pool_cursor._cur = MagicMock()
        pool_cursor._cur.execute.return_value = None

        pool_cursor.execute("query", None)

        pool_cursor._cur.execute.assert_called_once_with("query", None)

    def test_fetches_one(self, pool_cursor) -> None:
        """Test fetch one witch valid pool cursor and no exception."""
        pool_cursor._cur = MagicMock()
        pool_cursor._cur.fetchone.return_value = ("hallo",)

        results: Tuple[Any, ...] = pool_cursor.fetchone()

        assert results == ("hallo",)
        pool_cursor._cur.fetchone.assert_called_once()

    def test_fetches_all(self, pool_cursor) -> None:
        """Test fetch all witch valid pool cursor and no exception."""
        pool_cursor._cur = MagicMock()
        pool_cursor._cur.fetchall.return_value = [("hallo",), ("world",)]

        results: List[Tuple[Any, ...]] = pool_cursor.fetchall()

        assert results == [("hallo",), ("world",)]
        pool_cursor._cur.fetchall.assert_called_once()

    @patch("hyrisecockpit.database_manager.cursor.read_sql_query_pandas",)
    def test_reads_sql_query_pandas(
        self, mocked_read_sql_query_pandas, pool_cursor
    ) -> None:
        """Test read sql query witch valid pool cursor and no exception."""
        pool_cursor._cur = MagicMock()
        fake_df: DataFrame = DataFrame({"hallo": [1, 2]})
        moked_connection: MagicMock = MagicMock()
        pool_cursor._connection = moked_connection
        mocked_read_sql_query_pandas.return_value = fake_df

        results: DataFrame = pool_cursor.read_sql_query("query")

        assert results.equals(fake_df)
        mocked_read_sql_query_pandas.assert_called_once_with("query", moked_connection)

"""Tests for the cursor module."""
from typing import Any, Dict, List, Tuple
from unittest.mock import MagicMock, patch

from pandas import DataFrame
from pytest import fixture, mark

from hyrisecockpit.database_manager.cursor import (
    ConnectionFactory,
    PoolCursor,
    StorageConnectionFactory,
    StorageCursor,
)


class TestCursor:
    """Tests Cursor classes."""

    @fixture
    def pool_cursor(self) -> PoolCursor:
        """Return patched pool cursor object."""
        fake_connection_information: Dict[str, str] = {
            "host": "lowrise",
            "port": "666",
            "user": "Eiskaltius",
            "password": "boeslich",
            "dbname": "Mike der Schlitzer",
        }
        return PoolCursor(**fake_connection_information)

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
        cursor = StorageCursor("host", "port", "user", "password", "database_id")
        cursor._connection = MagicMock()
        cursor._connection.create_database.return_value = None

        cursor.create_database()
        cursor._connection.create_database.assert_called_once_with("database_id")

    def test_drops_database(self):
        """Test dropping of an Influx database."""
        cursor = StorageCursor("host", "port", "user", "password", "database_id")
        cursor._connection = MagicMock()
        cursor._connection.drop_database.return_value = None

        cursor.drop_database()
        cursor._connection.drop_database.assert_called_once_with("database_id")

    def test_creates_continuous_query(self):
        """Test creating of a continuous query in Influx database."""
        cursor = StorageCursor("host", "port", "user", "password", "database_id")
        cursor._connection = MagicMock()
        cursor._connection.create_continuous_query.return_value = None

        cursor.create_continuous_query(
            "query_name", "query statement", "resample_options"
        )
        cursor._connection.create_continuous_query.assert_called_once_with(
            "query_name", "query statement", "database_id", "resample_options"
        )

    @patch("hyrisecockpit.database_manager.cursor.connect")
    def test_initializes_pool_cursor_correctly(self, mock_connect: MagicMock) -> None:
        """Test initializes pool cursor correctly."""
        mocked_cursor = MagicMock()
        mocked_connection = MagicMock()
        mocked_connection.cursor.return_value = mocked_cursor
        mock_connect.return_value = mocked_connection

        fake_connection_information: Dict[str, str] = {
            "host": "lowrise",
            "port": "666",
            "user": "Eiskaltius",
            "password": "boeslich",
            "dbname": "Mike der Schlitzer",
        }

        pool_cursor: PoolCursor = PoolCursor(**fake_connection_information)

        with pool_cursor:
            pass

        mock_connect.assert_called_once_with(
            host="lowrise",
            port="666",
            user="Eiskaltius",
            password="boeslich",
            dbname="Mike der Schlitzer",
        )
        mocked_connection.set_session.assert_called_once_with(autocommit=True)
        mocked_connection.cursor.assert_called_once()

        mocked_cursor.close.assert_called_once()
        mocked_connection.close.assert_called_once()

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

    def test_fetches_column_names(self, pool_cursor) -> None:
        """Test fetches column names (in case you're not sure)."""
        pool_cursor._cur = MagicMock()
        pool_cursor._cur.description = [("hallo", "encoding",), ("world", "encoding",)]

        results: List[str] = pool_cursor.fetch_column_names()

        assert results == ["hallo", "world"]

    @patch("hyrisecockpit.database_manager.cursor.read_sql_query_pandas",)
    def test_reads_sql_query_pandas(
        self, mocked_read_sql_query_pandas, pool_cursor
    ) -> None:
        """Test read sql query witch valid pool cursor and no exception."""
        pool_cursor.cur = MagicMock()
        fake_df: DataFrame = DataFrame({"hallo": [1, 2]})
        mocked_connection: MagicMock = MagicMock()
        pool_cursor._connection = mocked_connection
        mocked_read_sql_query_pandas.return_value = fake_df

        results: DataFrame = pool_cursor.read_sql_query("query", None)

        assert results.equals(fake_df)

        mocked_read_sql_query_pandas.assert_called_once_with(
            "query", mocked_connection, params=None
        )

    def test_connection_factory_initializes(self) -> None:
        """Test initialization of ConnectionFactory."""
        fake_user: str = "user"
        fake_password: str = "password"
        fake_host: str = "host"
        fake_port: str = "port"
        fake_dbname: str = "dbname"

        factory = ConnectionFactory(
            fake_user, fake_password, fake_host, fake_port, fake_dbname
        )

        assert factory._user == "user"
        assert factory._password == "password"
        assert factory._host == "host"
        assert factory._port == "port"
        assert factory._dbname == "dbname"

    @patch("hyrisecockpit.database_manager.cursor.PoolCursor",)
    def test_create_cursor(self, mock_pool_cursor_constructor: MagicMock) -> None:
        """Test creation of PoolCursor."""
        fake_user: str = "user"
        fake_password: str = "password"
        fake_host: str = "host"
        fake_port: str = "port"
        fake_dbname: str = "dbname"

        mock_cursor = MagicMock()
        mock_pool_cursor_constructor.return_value = mock_cursor
        factory = ConnectionFactory(
            fake_user, fake_password, fake_host, fake_port, fake_dbname
        )
        cursor = factory.create_cursor()

        assert cursor == mock_cursor
        mock_pool_cursor_constructor.assert_called_once_with(
            "host", "port", "user", "password", "dbname"
        )

    def test_storage_connection_factory_initializes(self) -> None:
        """Test initialization of StorageConnectionFactory."""
        fake_user: str = "user"
        fake_password: str = "password"
        fake_host: str = "host"
        fake_port: str = "port"
        fake_dbname_id: str = "database_id"

        factory = StorageConnectionFactory(
            fake_user, fake_password, fake_host, fake_port, fake_dbname_id
        )

        assert factory._user == "user"
        assert factory._password == "password"
        assert factory._host == "host"
        assert factory._port == "port"
        assert factory._database_id == "database_id"

    @patch("hyrisecockpit.database_manager.cursor.StorageCursor",)
    def test_create_storage_cursor(
        self, mock_storage_cursor_constructor: MagicMock
    ) -> None:
        """Test creation of StorageCursor."""
        fake_user: str = "user"
        fake_password: str = "password"
        fake_host: str = "host"
        fake_port: str = "port"
        fake_dbname: str = "dbname"

        mock_cursor = MagicMock()
        mock_storage_cursor_constructor.return_value = mock_cursor
        factory = StorageConnectionFactory(
            fake_user, fake_password, fake_host, fake_port, fake_dbname
        )
        cursor = factory.create_cursor()

        assert cursor == mock_cursor
        mock_storage_cursor_constructor.assert_called_once_with(
            fake_host, fake_port, fake_user, fake_password, fake_dbname
        )

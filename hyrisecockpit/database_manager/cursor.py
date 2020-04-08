"""Utility custom cursors."""
from types import TracebackType
from typing import Any, Dict, Iterable, List, Optional, Tuple, Type, TypedDict, Union

from influxdb import InfluxDBClient
from pandas import DataFrame
from pandas.io.sql import read_sql_query as read_sql_query_pandas
from psycopg2 import pool


class PointBase(TypedDict):
    """Minimal type of an Influx point for write_points."""

    measurement: str
    fields: Dict[str, Any]


class Point(PointBase, total=False):
    """Type of an Influx point for write_points."""

    tags: Dict[str, Any]
    time: int


class PoolCursor:
    """Context manager for connections from a pool."""

    def __init__(self, connection_pool: pool) -> None:
        """Initialize a PoolCursor."""
        self.pool: pool = connection_pool
        self._connection = self.pool.getconn()
        self._connection.set_session(autocommit=True)
        self.cur = self._connection.cursor()

    def __enter__(self) -> "PoolCursor":
        """Return self for a context manager."""
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self.cur.close()
        self.pool.putconn(self._connection)
        return None

    def execute(
        self, query: str, parameters: Optional[Tuple[Union[str, int], ...]]
    ) -> None:
        """Execute a query."""
        return self.cur.execute(query, parameters)

    def fetchone(self) -> Tuple[Any, ...]:
        """Fetch one."""
        return self.cur.fetchone()

    def fetchall(self) -> List[Tuple[Any, ...]]:
        """Fetch all."""
        return self.cur.fetchall()

    def read_sql_query(self, sql: str) -> DataFrame:
        """Execute query and return result as data-frame."""
        return read_sql_query_pandas(sql, self._connection)


class StorageCursor:
    """Context Manager for a connection to log queries persistently."""

    def __init__(
        self, host: str, port: str, user: str, password: str, database: str
    ) -> None:
        """Initialize a StorageCursor."""
        self._host: str = host
        self._port: str = port
        self._user: str = user
        self._password: str = password
        self._database: str = database

    def __enter__(self) -> "StorageCursor":
        """Establish a connection."""
        self._connection: InfluxDBClient = InfluxDBClient(
            self._host, self._port, self._user, self._password
        )
        self._connection.create_database(self._database)
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self._connection.close()
        return None

    def __write_points(self, points: Iterable[Point]) -> None:
        """Write multiple points to the database."""
        return self._connection.write_points(list(points), database=self._database)

    def __write_point(self, point: Point) -> None:
        """Write a single point to the database."""
        return self.__write_points([point])

    def create_database(self) -> None:
        """Create database."""
        self._connection.create_database(self._database)

    def drop_database(self) -> None:
        """Drop database."""
        self._connection.drop_database(self._database)

    def create_continuous_query(
        self, query_name: str, query: str, resample_options: Optional[str] = None,
    ) -> None:
        """Create continuous query."""
        self._connection.create_continuous_query(
            query_name, query, self._database, resample_options
        )

    def log_meta_information(
        self, measurement: str, fields: Dict[str, Any], time_stamp: int
    ) -> None:
        """Log meta information in table."""
        self.__write_point(
            Point(measurement=measurement, fields=fields, time=time_stamp)
        )

    def log_queries(self, query_list: List[Tuple[int, int, str, str, str]]) -> None:
        """Log a couple of succesfully executed queries."""
        self.__write_points(
            Point(
                measurement="successful_queries",
                tags={
                    "benchmark": query[2],
                    "query_no": query[3],
                    "worker_id": query[4],
                },
                fields={"latency": query[1]},
                time=query[0],
            )
            for query in query_list
        )

    def log_failed_queries(self, query_list: List[Tuple[int, str, str, str]]):
        """Log failed queries."""
        self.__write_points(
            Point(
                measurement="failed_queries",
                tags={"worker_id": query[1]},
                fields={"task": query[2], "error": query[3]},
                time=query[0],
            )
            for query in query_list
        )

    def log_plugin_log(self, plugin_log: List[Tuple[int, str, str]]) -> None:
        """Log a couple of succesfully executed queries."""
        self.__write_points(
            Point(
                measurement="plugin_log",
                tags={"timestamp": row[0], "reporter": row[1]},
                fields={"message": row[2]},
                time=row[0],
            )
            for row in plugin_log
        )

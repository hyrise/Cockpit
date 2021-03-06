"""Utility custom cursors."""
from types import TracebackType
from typing import Any, Dict, Iterable, List, Optional, Tuple, Type, TypedDict, Union

from pandas import DataFrame
from pandas.io.sql import read_sql_query as read_sql_query_pandas
from psycopg2 import Error, connect

from influxdb import InfluxDBClient


class PointBase(TypedDict):
    """Minimal type of an Influx point for write_points."""

    measurement: str
    fields: Dict[str, Any]


class Point(PointBase, total=False):
    """Type of an Influx point for write_points."""

    tags: Dict[str, Any]
    time: int


class HyriseCursor:
    """Context manager for a hyrise connection."""

    def __init__(
        self,
        host: str,
        port: str,
        user: str,
        password: str,
        dbname: str,
        autocommit: bool = True,
    ) -> None:
        """Initialize a HyriseCursor."""
        self._user: str = user
        self._password: str = password
        self._host: str = host
        self._port: str = port
        self._dbname: str = dbname
        self._autocommit: bool = autocommit

    def __enter__(self) -> "HyriseCursor":
        """Return self for a context manager."""
        self.connection = connect(
            host=self._host,
            port=self._port,
            user=self._user,
            password=self._password,
            dbname=self._dbname,
        )
        self.connection.set_session(autocommit=self._autocommit)
        self._cur = self.connection.cursor()
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self._cur.close()
        self.connection.close()
        return None

    def reset(self) -> None:
        """Reset connection."""
        self._cur.close()
        self.connection.close()
        self.connection = connect(
            host=self._host,
            port=self._port,
            user=self._user,
            password=self._password,
            dbname=self._dbname,
        )
        self.connection.set_session(autocommit=self._autocommit)
        self._cur = self.connection.cursor()

    def execute(
        self, query: str, parameters: Optional[Tuple[Union[str, int], ...]]
    ) -> None:
        """Execute a query."""
        return self._cur.execute(query, parameters)

    def fetchone(self) -> Tuple[Any, ...]:
        """Fetch one."""
        return self._cur.fetchone()

    def fetchall(self) -> List[Tuple[Any, ...]]:
        """Fetch all."""
        return self._cur.fetchall()

    def fetch_column_names(self) -> List[str]:
        """Return column names."""
        return [col[0] for col in self._cur.description]

    def read_sql_query(self, sql: str, params: Optional[Tuple]) -> DataFrame:
        """Execute query and return result as data-frame."""
        return read_sql_query_pandas(sql, self.connection, params=params)

    @classmethod
    def validate_connection(
        cls, user: str, password: str, host: str, port: str, dbname: str
    ) -> bool:
        """Validate whether a connection can be established."""
        try:
            connect(
                user=user,
                password=password,
                host=host,
                port=port,
                dbname=dbname,
            ).close()
        except Error:
            return False
        return True


class ConnectionFactory:
    """Factory for creating cursors."""

    def __init__(self, user: str, password: str, host: str, port: str, dbname: str):
        """Initialize the connection attributes."""
        self._user: str = user
        self._password: str = password
        self._host: str = host
        self._port: str = port
        self._dbname: str = dbname

    def create_cursor(self, autocommit: bool = True) -> HyriseCursor:
        """Create new HyriseCursor."""
        return HyriseCursor(
            self._host, self._port, self._user, self._password, self._dbname, autocommit
        )


class StorageCursor:
    """Context Manager for a connection to log queries persistently."""

    def __init__(
        self, host: str, port: str, user: str, password: str, database_id: str
    ) -> None:
        """Initialize a StorageCursor."""
        self._host: str = host
        self._port: str = port
        self._user: str = user
        self._password: str = password
        self._database_id: str = database_id

    def __enter__(self) -> "StorageCursor":
        """Establish a connection."""
        self._connection: InfluxDBClient = InfluxDBClient(
            self._host, self._port, self._user, self._password
        )
        self._connection.create_database(self._database_id)
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
        return self._connection.write_points(list(points), database=self._database_id)

    def __write_point(self, point: Point) -> None:
        """Write a single point to the database."""
        return self.__write_points([point])

    def create_database(self) -> None:
        """Create database."""
        self._connection.create_database(self._database_id)

    def drop_database(self) -> None:
        """Drop database."""
        self._connection.drop_database(self._database_id)

    def create_continuous_query(
        self,
        query_name: str,
        query: str,
        resample_options: Optional[str] = None,
    ) -> None:
        """Create continuous query."""
        self._connection.create_continuous_query(
            query_name, query, self._database_id, resample_options
        )

    def log_meta_information(
        self, measurement: str, fields: Dict[str, Any], time_stamp: int
    ) -> None:
        """Log meta information in table."""
        self.__write_point(
            Point(measurement=measurement, fields=fields, time=time_stamp)
        )

    def log_queries(
        self, query_list: List[Tuple[int, int, str, float, str, str, bool]]
    ) -> None:
        """Log a couple of succesfully executed queries."""
        self.__write_points(
            Point(
                measurement="successful_queries",
                tags={
                    "benchmark": query[2],
                    "scalefactor": query[3],
                    "query_no": query[4],
                    "worker_id": query[5],
                    "commited": query[6],
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

    def log_plugin_log(self, plugin_log: List[Tuple[int, str, str, str]]) -> None:
        """Log a couple of succesfully executed queries."""
        self.__write_points(
            Point(
                measurement="plugin_log",
                tags={"timestamp": row[0], "reporter": row[1], "level": row[3]},
                fields={"message": row[2]},
                time=row[0],
            )
            for row in plugin_log
        )


class StorageConnectionFactory:
    """Factory for creating storage cursors."""

    def __init__(
        self,
        user: str,
        password: str,
        host: str,
        port: str,
        database_id: str,
    ):
        """Initialize the connection attributes."""
        self._host: str = host
        self._port: str = port
        self._user: str = user
        self._password: str = password
        self._database_id: str = database_id

    def create_cursor(self) -> StorageCursor:
        """Create new StorageCursor."""
        return StorageCursor(
            self._host, self._port, self._user, self._password, self._database_id
        )

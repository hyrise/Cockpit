"""The database object represents the instance of a database."""

from multiprocessing import Manager, Process, Queue, Value
from secrets import randbelow
from time import time
from typing import Dict, List

from apscheduler.schedulers.background import BackgroundScheduler
from influxdb import InfluxDBClient
from pandas import DataFrame
from pandas.io.sql import read_sql_query
from psycopg2 import DatabaseError, Error, pool
from psycopg2.extensions import AsIs
from zmq import SUB, SUBSCRIBE, Context

from hyrisecockpit.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)

from .driver import Driver
from .table_names import table_names as _table_names


class StorageCursor:
    """Context Manager for a connection to log queries persistently."""

    def __init__(self, host, port, user, password, database):
        """Initialize a StorageCursor."""
        self._host = host
        self._port = port
        self._user = user
        self._password = password
        self._database = database

    def __enter__(self):
        """Establish a connection."""
        self._connection = InfluxDBClient(
            self._host, self._port, self._user, self._password
        )
        self._connection.create_database(self._database)
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Close the cursor and connection."""
        self._connection.close()

    def log_query(self, startts, endts, benchmark: str, query_no: int) -> None:
        """Log a successful query to permanent in storage."""
        point = [
            {
                "measurement": "successful_queries",
                "tags": {"benchmark": benchmark, "query_no": query_no},
                "fields": {"start": float(startts), "end": float(endts)},
            }
        ]
        self._connection.write_points(point, database=self._database)

    def log_queries(self, query_list) -> None:
        """Log a couple of succesfully executed queries."""
        points = []
        for query in query_list:
            point = [
                {
                    "measurement": "successful_queries",
                    "tags": {"benchmark": query[2], "query_no": query[3]},
                    "fields": {"start": float(query[0]), "end": float(query[1])},
                }
            ]
            points.append(point)
        self._connection.write_points(points, database=self._database)


class PoolCursor:
    """Context manager for connections from a pool."""

    def __init__(self, pool):
        """Initialize a PoolCursor."""
        self.pool = pool
        self.connection = self.pool.getconn()
        self.connection.set_session(autocommit=True)
        self.cur = self.connection.cursor()

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Close the cursor and connection."""
        self.cur.close()
        self.pool.putconn(self.connection)

    def execute(self, query, parameters):
        """Execute a query."""
        return self.cur.execute(query, parameters)

    def fetchone(self):
        """Fetch one."""
        return self.cur.fetchone()


def fill_queue(workload_publisher_url: str, task_queue: Queue) -> None:
    """Fill the queue."""
    context = Context()
    subscriber = context.socket(SUB)
    subscriber.connect(workload_publisher_url)
    subscriber.setsockopt_string(SUBSCRIBE, "")

    while True:
        content = subscriber.recv_json()
        tasks = content["body"]["querylist"]
        for task in tasks:
            task_queue.put(task)


def execute_queries(
    worker_id: str,
    task_queue: Queue,
    connection_pool: pool,
    failed_task_queue: Queue,
    workload_proceed_flag: Value,
    database_id: str,
) -> None:
    """Define workers work loop."""
    with PoolCursor(connection_pool) as cur:
        with StorageCursor(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD, database_id
        ) as log:
            succesful_queries = []
            lastbatched = time()
            while True:
                # If Queue is emty go to wait status
                try:
                    task = task_queue.get(block=True)
                    if workload_proceed_flag.value:
                        query, parameters = task
                        startts = time()
                        cur.execute(query, parameters)
                        endts = time()
                        succesful_queries.append((startts, endts, "none", 0))
                        if lastbatched < time() - 1:
                            lastbatched = time()
                            log.log_queries(succesful_queries)
                            succesful_queries = []
                except (ValueError, Error) as e:
                    failed_task_queue.put(
                        {"worker_id": worker_id, "task": task, "Error": str(e)}
                    )


class Database(object):
    """Represents database."""

    def __init__(
        self,
        id: str,
        user: str,
        password: str,
        host: str,
        port: str,
        dbname: str,
        number_workers: str,
        workload_publisher_url: str,
        default_tables: str,
    ) -> None:
        """Initialize database object."""
        self._id = id
        self._default_tables = default_tables
        self._number_workers = int(number_workers)
        self._number_additional_connections = 1
        self._driver = Driver(
            user,
            password,
            host,
            port,
            dbname,
            self._number_workers + self._number_additional_connections,
        )

        self._connection_pool = self._driver.get_connection_pool()

        self._task_queue: Queue = Queue(0)
        self._failed_task_queue: Queue = Queue(0)
        self._manager = Manager()

        self.workload_publisher_url: str = workload_publisher_url
        self._system_data: Dict = {}
        self._chunks_data: Dict = {}

        self._workload_proceed_flag = self._manager.Value("b", True)
        self._worker_pool: pool = self._init_worker_pool()

        self._start_workers()

        # self.load_data(self._default_tables, sf="0.1")

        self._scheduler = BackgroundScheduler()
        self._update_system_data_job = self._scheduler.add_job(
            func=self._update_system_data, trigger="interval", seconds=1,
        )
        self._update_chunks_data_job = self._scheduler.add_job(
            func=self._update_chunks_data, trigger="interval", seconds=5,
        )
        self._scheduler.start()

    def _init_worker_pool(self) -> pool:
        """Initialize a pool of workers."""
        worker_pool = []
        for i in range(self._number_workers):
            p = Process(
                target=execute_queries,
                args=(
                    i,
                    self._task_queue,
                    self._connection_pool,
                    self._failed_task_queue,
                    self._workload_proceed_flag,
                    self._id,
                ),
            )
            worker_pool.append(p)
        subscriber_process = Process(
            target=fill_queue, args=(self.workload_publisher_url, self._task_queue),
        )
        worker_pool.append(subscriber_process)
        return worker_pool

    def enable_workload_execution(self) -> None:
        """Enable execution of the workload."""
        self._workload_proceed_flag.value = True

    def disable_workload_execution(self) -> None:
        """Disable execution of the workload."""
        self._workload_proceed_flag.value = False

    def _start_workers(self) -> None:
        """Start all workers in pool."""
        for i in range(len(self._worker_pool)):
            self._worker_pool[i].start()

    def load_data(self, datatype: str, sf: str) -> bool:
        """Load pregenerated tables."""
        table_names = _table_names.get(datatype)
        if table_names is None:
            return False
        with PoolCursor(self._connection_pool) as cur:
            success: bool = True
            for name in table_names:
                cur.execute(
                    "SELECT table_name FROM meta_tables WHERE table_name=%s;", (name,)
                )
                if cur.fetchone():
                    continue
                try:
                    # TODO change absolute to relative path
                    cur.execute(
                        "COPY %s FROM '/usr/local/hyrise/%s_cached_tables/sf-%s/%s.bin';",
                        (AsIs(name), AsIs(datatype), AsIs(sf), AsIs(name),),
                    )
                except DatabaseError:
                    success = False  # TODO return tables that could not be imported

        return success

    def delete_data(self, datatype: str) -> bool:
        """Delete tables."""
        table_names = _table_names.get(datatype)
        if not table_names:
            return False
        with PoolCursor(self._connection_pool) as cur:
            for name in table_names:
                try:
                    cur.execute("DROP TABLE %s;", (AsIs(name),))
                except DatabaseError:
                    continue
        return True

    def _update_system_data(self) -> None:
        """Update system data for database instance."""
        # mocking system data
        cpu_data = []
        for _ in range(16):
            cpu_data.append(randbelow(1001) / 10)
        memory_data = {
            "available": 8467795968,
            "used": 2525601792,
            "cached": 4237438976,
            "percent": 32.1,
            "free": 5536755712,
            "inactive": 2687451136,
            "active": 3657117696,
            "shared": 1149366272,
            "total": 12469334016,
            "buffers": 169537536,
        }

        self._system_data = {
            "cpu": cpu_data,
            "memory": memory_data,
            "database_threads": 8,
        }

    def _update_chunks_data(self) -> None:
        """Update chunks data for database instance."""
        # mocking chunks data

        connection = self._connection_pool.getconn()
        connection.set_session(autocommit=True)

        sql = """SELECT table_name, column_name, COUNT(chunk_id) as n_chunks FROM meta_segments GROUP BY table_name, column_name;"""

        meta_segments = read_sql_query(sql, connection)
        self._connection_pool.putconn(connection)

        if meta_segments.empty:
            self._chunks_data = {}
            return None

        chunks_data: Dict = {}
        grouped = meta_segments.reset_index().groupby("table_name")
        for column in grouped.groups:
            chunks_data[column] = {}
            for _, row in grouped.get_group(column).iterrows():
                data = []
                for _ in range(row["n_chunks"]):
                    current = randbelow(500)
                    data.append(current if (current < 100) else 0)
                chunks_data[column][row["column_name"]] = data
        self._chunks_data = chunks_data

    def get_storage_data(self) -> Dict:
        """Get storage data from the database."""
        connection = self._connection_pool.getconn()
        connection.set_session(autocommit=True)
        sql = "SELECT * FROM meta_segments;"

        meta_segments = read_sql_query(sql, connection)
        self._connection_pool.putconn(connection)

        if meta_segments.empty:
            return {}

        meta_segments.set_index(
            ["table_name", "column_name", "chunk_id"],
            inplace=True,
            verify_integrity=True,
        )
        size: DataFrame = DataFrame(
            meta_segments["estimated_size_in_bytes"]
            .groupby(level=["table_name", "column_name"])
            .sum()
        )

        encoding: DataFrame = DataFrame(
            meta_segments["encoding_type"]
            .groupby(level=["table_name", "column_name"])
            .apply(set)
        )
        encoding["encoding_type"] = encoding["encoding_type"].apply(list)
        datatype: DataFrame = meta_segments.reset_index().set_index(
            ["table_name", "column_name"]
        )[["column_data_type"]]

        result: DataFrame = size.join(encoding).join(datatype)
        return self._create_storage_data_dictionary(result)

    def _create_storage_data_dictionary(self, result: DataFrame) -> Dict:
        """Sort storage data to dictionary."""
        output: Dict = {}
        grouped = result.reset_index().groupby("table_name")
        for column in grouped.groups:
            output[column] = {"size": 0, "number_columns": 0, "data": {}}
            for _, row in grouped.get_group(column).iterrows():
                output[column]["number_columns"] = output[column]["number_columns"] + 1
                output[column]["size"] = (
                    output[column]["size"] + row["estimated_size_in_bytes"]
                )
                output[column]["data"][row["column_name"]] = {
                    "size": row["estimated_size_in_bytes"],
                    "data_type": row["column_data_type"],
                    "encoding": row["encoding_type"],
                }
        return output

    def get_system_data(self) -> Dict:
        """Return system data."""
        return self._system_data

    def get_chunks_data(self) -> Dict:
        """Return chunks data."""
        return self._chunks_data

    def get_queue_length(self) -> int:
        """Return queue length."""
        return self._task_queue.qsize()

    def get_failed_tasks(self) -> List:
        """Return faild tasks."""
        failed_task = []
        while not self._failed_task_queue.empty():
            failed_task.append(self._failed_task_queue.get())
        return failed_task

    def close(self) -> None:
        """Close the database."""
        # Remove jobs
        self._update_system_data_job.remove()
        self._update_chunks_data_job.remove()

        # Close the scheduler
        self._scheduler.shutdown()
        # Close worker pool
        for i in range(len(self._worker_pool)):
            self._worker_pool[i].terminate()

        # Close connections
        self._connection_pool.closeall()

        # Close queue
        self._task_queue.close()

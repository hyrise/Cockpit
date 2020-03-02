"""The database object represents the instance of a database."""

from multiprocessing import Manager, Process, Queue
from secrets import randbelow
from typing import Any, Callable, Dict, List, Tuple

from apscheduler.schedulers.background import BackgroundScheduler
from pandas import DataFrame
from pandas.io.sql import read_sql_query
from psycopg2 import pool
from psycopg2.extensions import AsIs

from .cursor import PoolCursor
from .driver import Driver
from .table_names import table_names as _table_names
from .worker import execute_queries, fill_queue


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
        number_workers: int,
        workload_publisher_url: str,
        default_tables: str,
    ) -> None:
        """Initialize database object."""
        self._id = id
        self._default_tables = default_tables
        self.number_workers = number_workers
        self._number_additional_connections = 1
        self.driver = Driver(
            user,
            password,
            host,
            port,
            dbname,
            self.number_workers + self._number_additional_connections,
        )

        self._connection_pool = self.driver.get_connection_pool()
        self._scheduler = BackgroundScheduler()

        self._task_queue: Queue = Queue(0)
        self._failed_task_queue: Queue = Queue(0)
        self._manager = Manager()

        self.workload_publisher_url: str = workload_publisher_url
        self._system_data: Dict = {}
        self._chunks_data: Dict = {}

        self._worker_stay_alive_flag = self._manager.Value("b", True)
        self._processing_tables_flag = self._manager.Value("b", False)
        self._worker_pool: pool = self._init_worker_pool()
        self._subscriber_worker = self._init_subscriber_worker()

        self._start_workers()

        self.load_data(self._default_tables)

        self._update_system_data_job = self._scheduler.add_job(
            func=self._update_system_data, trigger="interval", seconds=1,
        )
        self._update_chunks_data_job = self._scheduler.add_job(
            func=self._update_chunks_data, trigger="interval", seconds=5,
        )
        self._scheduler.start()

    def _init_subscriber_worker(self) -> Process:
        subscriber_process = Process(
            target=fill_queue,
            args=(
                self.workload_publisher_url,
                self._task_queue,
                self._processing_tables_flag,
            ),
        )
        return subscriber_process

    def _init_worker_pool(self) -> pool:
        """Initialize a pool of workers."""
        self._worker_stay_alive_flag.value = True
        worker_pool = []
        for i in range(self.number_workers):
            p = Process(
                target=execute_queries,
                args=(
                    i,
                    self._task_queue,
                    self._connection_pool,
                    self._failed_task_queue,
                    self._worker_stay_alive_flag,
                    self._id,
                ),
            )
            worker_pool.append(p)
        return worker_pool

    def disable_workload_execution(self) -> bool:
        """Disable execution of the workload."""
        if not self._processing_tables_flag.value:
            self._processing_tables_flag.value = True
            self._flush_queue()
            self._processing_tables_flag.value = False
            return True
        else:
            return False

    def _start_workers(self) -> None:
        """Start all workers in pool."""
        self._worker_stay_alive_flag.value = True
        self._subscriber_worker.start()
        for i in range(len(self._worker_pool)):
            self._worker_pool[i].start()

    def _shutdown_workers(self) -> None:
        """Shutdown all task execution workers."""
        self._worker_stay_alive_flag.value = False
        # If the queue is empty we need to wake up the workers
        self._subscriber_worker.terminate()
        self._task_queue.put("wake_up_signal_for_worker")
        for worker in self._worker_pool:
            worker.join()
            worker.terminate()
        self._worker_pool[:] = []

    def _flush_queue(self, default_init_tasks=None) -> None:
        """Flush queue."""
        self._shutdown_workers()
        self._task_queue = Queue(0)
        if default_init_tasks is not None:
            for task in default_init_tasks:
                self._task_queue.put(task)
        self._subscriber_worker = self._init_subscriber_worker()
        self._worker_pool = self._init_worker_pool()
        self._start_workers()

    def _get_existing_tables(self, table_names) -> Dict:
        """Check wich tables exists and which not."""
        existing_tables = []
        not_existing_tables = []
        with PoolCursor(self._connection_pool) as cur:
            for name in table_names:
                cur.execute(
                    "SELECT table_name FROM meta_tables WHERE table_name=%s;", (name,)
                )
                if cur.fetchone():
                    existing_tables.append(name)
                    continue
                not_existing_tables.append(name)
        return {"existing": existing_tables, "not_existing": not_existing_tables}

    def _generate_table_loading_queries(
        self, table_names, folder_name: str
    ) -> List[Tuple[Tuple[str, Any], str, str]]:
        """Generate queries in tuple form that load tables."""
        # TODO change absolute to relative path
        return [
            (
                (
                    "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                    ((name, "as_is"), (folder_name, "as_is"), (name, "as_is"),),
                ),
                "system",
                "generate table query",
            )
            for name in table_names
        ]

    def _generate_table_drop_queries(
        self, table_names, folder_name: str
    ) -> List[Tuple[Tuple[str, Any], str, str]]:
        # TODO folder_name is unused? This deletes all tables
        """Generate queries in tuple form that drop tables."""
        return [
            (("DROP TABLE %s;", ((name, "as_is"),)), "system", "drop table query")
            for name in self._get_existing_tables(table_names)["existing"]
        ]

    def _check_if_tables_processed(self, table_loading_tasks) -> None:
        """Check if all table processing task are taken from the queue and if so flushes it."""
        if not self._processing_tables_flag.value:
            self._processing_tables_flag.value = True
            self._flush_queue(table_loading_tasks)
        if self._task_queue.empty():
            self._flush_queue()
            self._processing_tables_flag.value = False
            self._check_if_tables_processed_job.remove()

    def _start_table_processing_parallel(self, table_loading_tasks) -> None:
        """Flush queue and initialize it with table processing queries."""
        self._check_if_tables_processed_job = self._scheduler.add_job(
            func=self._check_if_tables_processed,
            args=(table_loading_tasks,),
            trigger="interval",
            seconds=0.2,
        )

    def _start_table_processing_sequential(self, table_loading_tasks) -> None:
        """Flush queue and initialize it with table processing queries."""
        self._processing_tables_flag.value = True
        self._flush_queue()
        with PoolCursor(self._connection_pool) as cur:
            for task in table_loading_tasks:
                query, not_formatted_parameters = task
                formatted_parameters = (
                    tuple(
                        AsIs(parameter) if protocol == "as_is" else parameter
                        for parameter, protocol in not_formatted_parameters
                    )
                    if not_formatted_parameters is not None
                    else None
                )
                cur.execute(query, formatted_parameters)
        self._flush_queue()
        self._processing_tables_flag.value = False

    def _process_tables(
        self, table_action: Callable, folder_name: str, processing_action: Callable
    ) -> bool:
        """Process changes on tables by taking a generic function which creates table processing queries."""
        table_names = _table_names.get(folder_name.split("_")[0])
        if table_names is None:
            return False

        table_loading_tasks = table_action(table_names, folder_name)
        if len(table_loading_tasks) == 0:
            return True
        processing_action(table_loading_tasks)
        return True

    def load_data(self, folder_name: str) -> bool:
        """Load pregenerated tables."""
        return self._process_tables(
            self._generate_table_loading_queries,
            folder_name,
            self._start_table_processing_parallel,
        )

    def delete_data(self, folder_name: str) -> bool:
        """Delete tables."""
        return self._process_tables(
            self._generate_table_drop_queries,
            folder_name,
            self._start_table_processing_parallel,
        )

    def _update_system_data(self) -> None:
        """Update system data for database instance."""
        # mocked cpu data
        cpu_data = [randbelow(1001) / 10 for _ in range(16)]
        # mocked memory data
        total_memory = 32 * (1024 ** 3)
        used_memory = randbelow(total_memory)
        available_memory = total_memory - used_memory
        memory_data = {
            "available": available_memory,
            "used": used_memory,
            "cached": 4237438976,
            "percent": used_memory / total_memory,
            "free": 5536755712,
            "inactive": 2687451136,
            "active": 3657117696,
            "shared": 1149366272,
            "total": total_memory,
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
        if self._processing_tables_flag.value:
            return

        connection = self._connection_pool.getconn()
        connection.set_session(autocommit=True)

        sql = """SELECT table_name, column_name, COUNT(chunk_id) as n_chunks FROM meta_segments GROUP BY table_name, column_name;"""

        meta_segments = read_sql_query(sql, connection)
        self._connection_pool.putconn(connection)

        if meta_segments.empty:
            self._chunks_data = {}
            return

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
        if self._processing_tables_flag.value:
            return {}

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

    def get_processing_tables_flag(self) -> bool:
        """Return tables loading flag."""
        return self._processing_tables_flag.value

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
        # Close subscriber worker
        self._subscriber_worker.terminate()
        # Close worker pool
        for i in range(len(self._worker_pool)):
            self._worker_pool[i].terminate()

        # Close connections
        self._connection_pool.closeall()

        # Close queue
        self._task_queue.close()

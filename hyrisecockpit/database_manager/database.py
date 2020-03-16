"""The database object represents the instance of a database."""

from multiprocessing import Process, Queue, Value
from typing import Callable, Dict, List, Optional, Sequence, Tuple

from apscheduler.schedulers.background import BackgroundScheduler
from psycopg2 import pool
from psycopg2.extensions import AsIs

from .background_scheduler import BackgroundJobManager
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
        storage_host: str,
        storage_password: str,
        storage_port: str,
        storage_user: str,
    ) -> None:
        """Initialize database object."""
        self._id = id
        self._default_tables: str = default_tables
        self.number_workers: int = number_workers
        self._number_additional_connections: int = 1
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

        self.workload_publisher_url: str = workload_publisher_url

        self._worker_stay_alive_flag = Value("b", True)
        self._processing_tables_flag = Value("b", False)
        self._worker_pool: pool = self._init_worker_pool()
        self._subscriber_worker = self._init_subscriber_worker()

        self._start_workers()

        self.load_data(self._default_tables)

        self._background_scheduler = BackgroundJobManager(
            self._id,
            self._processing_tables_flag,
            self._connection_pool,
            storage_host,
            storage_password,
            storage_port,
            storage_user,
        )
        self._background_scheduler.start()
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

    def _flush_queue(self, default_init_tasks: Optional[Sequence] = None) -> None:
        """Flush queue."""
        self._shutdown_workers()
        self._task_queue = Queue(0)
        if default_init_tasks is not None:
            for task in default_init_tasks:
                self._task_queue.put(task)
        self._subscriber_worker = self._init_subscriber_worker()
        self._worker_pool = self._init_worker_pool()
        self._start_workers()

    def _get_existing_tables(self, table_names: Sequence) -> Dict:
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
        self, table_names: Sequence, folder_name: str
    ) -> List[Tuple[str, Optional[Tuple[Tuple[str, str], ...]], str, str]]:
        """Generate queries in tuple form that load tables."""
        # TODO change absolute to relative path
        return [
            (
                "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                ((name, "as_is"), (folder_name, "as_is"), (name, "as_is"),),
                "system",
                "generate table query",
            )
            for name in table_names
        ]

    def _generate_table_drop_queries(
        self, table_names: Sequence, folder_name: str
    ) -> List[Tuple[str, Optional[Tuple[Tuple[str, str], ...]], str, str]]:
        # TODO folder_name is unused? This deletes all tables
        """Generate queries in tuple form that drop tables."""
        return [
            ("DROP TABLE %s;", ((name, "as_is"),), "system", "drop table query")
            for name in self._get_existing_tables(table_names)["existing"]
        ]

    def _check_if_tables_processed(
        self, table_loading_tasks: Optional[Sequence]
    ) -> None:
        """Check if all table processing task are taken from the queue and if so flushes it."""
        if not self._processing_tables_flag.value:
            self._processing_tables_flag.value = True
            self._flush_queue(table_loading_tasks)
        if self._task_queue.empty():
            self._flush_queue()
            self._processing_tables_flag.value = False
            self._check_if_tables_processed_job.remove()

    def _start_table_processing_parallel(
        self, table_loading_tasks: Optional[Sequence]
    ) -> None:
        """Flush queue and initialize it with table processing queries."""
        self._check_if_tables_processed_job = self._scheduler.add_job(
            func=self._check_if_tables_processed,
            args=(table_loading_tasks,),
            trigger="interval",
            seconds=0.2,
        )

    def _process_tables(self, table_action: Callable, folder_name: str) -> bool:
        """Process changes on tables by taking a generic function which creates table processing queries."""
        table_names = _table_names.get(folder_name.split("_")[0])
        if table_names is None:
            return False

        table_loading_tasks = table_action(table_names, folder_name)
        if len(table_loading_tasks) == 0:
            self._start_table_processing_parallel(None)
            return True
        self._start_table_processing_parallel(table_loading_tasks)
        return True

    def load_data(self, folder_name: str) -> bool:
        """Load pregenerated tables."""
        return self._process_tables(self._generate_table_loading_queries, folder_name,)

    def delete_data(self, folder_name: str) -> bool:
        """Delete tables."""
        return self._process_tables(self._generate_table_drop_queries, folder_name,)

    def get_processing_tables_flag(self) -> bool:
        """Return tables loading flag."""
        return self._processing_tables_flag.value

    def get_queue_length(self) -> int:
        """Return queue length."""
        return self._task_queue.qsize()

    def get_failed_tasks(self) -> List:
        """Return faild tasks."""
        failed_task = []
        while not self._failed_task_queue.empty():
            failed_task.append(self._failed_task_queue.get())
        return failed_task

    def get_plugins(self) -> Optional[List]:
        """Return all currently activated plugins."""
        if not self._processing_tables_flag.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(("SELECT name FROM meta_plugins;"), (None,))
                rows = cur.fetchall()
                result = [row[0] for row in rows] if rows else []
                return result
        else:
            return None

    def activate_plugin(self, plugin: str) -> bool:
        """Activate Plugin."""
        if not self._processing_tables_flag.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(
                    (
                        "INSERT INTO meta_plugins(name) VALUES ('/usr/local/hyrise/lib/lib%sPlugin.so');"
                    ),
                    (AsIs(plugin),),
                )
            return True
        else:
            return False

    def deactivate_plugin(self, plugin: str) -> bool:
        """Activate Plugin."""
        if not self._processing_tables_flag.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(
                    ("DELETE FROM meta_plugins WHERE name='%sPlugin';"), (AsIs(plugin),)
                )
            return True
        else:
            return False

    def set_plugin_setting(self, name: str, value: str) -> bool:
        """Adjust setting for given plugin."""
        if not self._processing_tables_flag.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(
                    "UPDATE meta_settings SET value=%s WHERE name=%s;", (value, name),
                )
            return True
        else:
            return False

    def get_plugin_setting(self) -> Optional[List]:
        """Read currently set plugin settings."""
        if not self._processing_tables_flag.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute("SELECT * FROM meta_settings", None)
                result = cur.fetchall()
            return result
        else:
            return None

    def close(self) -> None:
        """Close the database."""
        # Remove jobs
        self._background_scheduler.close()

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

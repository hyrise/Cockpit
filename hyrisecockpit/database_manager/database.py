"""The database object represents the instance of a database."""

from multiprocessing import Value
from typing import Dict, List, Optional, Tuple, TypedDict

from .cursor import ConnectionFactory, StorageConnectionFactory
from .interfaces import SqlResultInterface
from .job_manager.asynchronous import AsynchronousJobManager
from .job_manager.background import BackgroundJobManager
from .job_manager.synchronous import SynchronousJobManager
from .worker_pool import WorkerPool

PluginSetting = TypedDict(
    "PluginSetting", {"name": str, "value": str, "description": str}
)
Plugins = Optional[Dict[str, List[PluginSetting]]]


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
        self.number_workers: int = number_workers
        self._default_tables: str = default_tables

        self.connection_information: Dict[str, str] = {
            "host": host,
            "port": port,
            "user": user,
            "password": password,
            "dbname": dbname,
        }

        self._connection_factory: ConnectionFactory = ConnectionFactory(
            **self.connection_information
        )

        self._storage_connection_factory: StorageConnectionFactory = StorageConnectionFactory(
            storage_user, storage_password, storage_host, storage_port, id,
        )

        self._database_blocked: Value = Value("b", False)
        self._hyrise_active: Value = Value("b", True)
        self._worker_pool: WorkerPool = WorkerPool(
            self._connection_factory,
            self.number_workers,
            self._id,
            workload_publisher_url,
            self._database_blocked,
        )
        self._background_job_manager: BackgroundJobManager = BackgroundJobManager(
            self._database_blocked,
            self._connection_factory,
            self._hyrise_active,
            self._worker_pool,
            self._storage_connection_factory,
        )
        self._asynchronous_job_manager = AsynchronousJobManager(
            self._background_job_manager,
            self._database_blocked,
            self._connection_factory,
        )
        self._synchronous_job_manager = SynchronousJobManager(
            self._id, self._database_blocked, self._connection_factory,
        )
        self._initialize_influx()
        self._background_job_manager.start()
        self._asynchronous_job_manager.load_tables(self._default_tables)

    def _initialize_influx(self) -> None:
        """Initialize Influx database."""
        with self._storage_connection_factory.create_cursor() as cursor:
            cursor.drop_database()
            cursor.create_database()
            throughput_continuous_query = """SELECT count("latency") AS "throughput"
                INTO "throughput"
                FROM "successful_queries"
                GROUP BY time(1s)"""
            throughput_resample_options = "EVERY 1s FOR 5s"
            cursor.create_continuous_query(
                "throughput_calculation",
                throughput_continuous_query,
                throughput_resample_options,
            )

            latency_continuous_query = """SELECT mean("latency") AS "latency"
                INTO "latency"
                FROM "successful_queries"
                GROUP BY time(1s)"""
            latency_resample_options = "EVERY 1s FOR 5s"
            cursor.create_continuous_query(
                "latency_calculation",
                latency_continuous_query,
                latency_resample_options,
            )

    def get_queue_length(self) -> int:
        """Return queue length."""
        return self._worker_pool.get_queue_length()

    def load_data(self, folder_name: str) -> bool:
        """Load pre-generated tables."""
        return (
            False
            if self._worker_pool.get_status() != "closed"
            else self._asynchronous_job_manager.load_tables(folder_name)
        )

    def delete_data(self, folder_name: str) -> bool:
        """Delete tables."""
        return (
            False
            if self._worker_pool.get_status() != "closed"
            else self._asynchronous_job_manager.delete_tables(folder_name)
        )

    def activate_plugin(self, plugin: str) -> bool:
        """Activate plugin."""
        return self._asynchronous_job_manager.activate_plugin(plugin)

    def deactivate_plugin(self, plugin: str) -> bool:
        """Deactivate plugin."""
        return self._asynchronous_job_manager.deactivate_plugin(plugin)

    def get_database_blocked(self) -> bool:
        """Return tables loading flag."""
        return bool(self._database_blocked.value)

    def get_worker_pool_status(self) -> str:
        """Return worker pool status."""
        return self._worker_pool.get_status()

    def get_hyrise_active(self) -> bool:
        """Return status of hyrise."""
        return bool(self._hyrise_active.value)

    def get_loaded_tables(self) -> List[Dict[str, str]]:
        """Return already loaded tables."""
        return self._synchronous_job_manager.get_loaded_tables()

    def get_loaded_benchmarks(self, loaded_tables) -> List[str]:
        """Get list of all benchmarks which are completely loaded."""
        return self._synchronous_job_manager.get_loaded_benchmarks()

    def get_loaded_benchmark_data(self) -> Tuple:
        """Get loaded benchmark data."""
        return self._synchronous_job_manager.get_loaded_benchmark_data()

    def start_worker(self) -> bool:
        """Start worker."""
        return self._worker_pool.start()

    def close_worker(self) -> bool:
        """Close worker."""
        return self._worker_pool.close()

    def _get_plugins(self) -> Optional[List[str]]:
        """Return all currently activated plugins."""
        return self._synchronous_job_manager.get_plugins()

    def _get_plugin_setting(self) -> Plugins:
        """Return currently set plugin settings."""
        return self._synchronous_job_manager.get_plugin_setting()

    def get_detailed_plugins(self) -> Plugins:
        """Get all activated plugins with their settings."""
        return self._synchronous_job_manager.get_detailed_plugins()

    def set_plugin_setting(
        self, plugin_name: str, setting_name: str, setting_value: str
    ) -> bool:
        """Set plug-in settings."""
        return self._synchronous_job_manager.set_plugin_setting(
            plugin_name, setting_name, setting_value
        )

    def execute_sql_query(self, query) -> Optional[SqlResultInterface]:
        """Execute sql query on database."""
        return self._synchronous_job_manager.execute_sql_query(query)

    def close(self) -> None:
        """Close the database."""
        self._worker_pool.terminate()
        self._background_job_manager.close()

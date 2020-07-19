"""The database object represents the instance of a database."""

from multiprocessing import Value
from typing import Dict, List, Optional, Tuple, TypedDict

from psycopg2 import DatabaseError, Error, InterfaceError

from hyrisecockpit.drivers.tpch.tpch_driver import TpchDriver

from .background_scheduler import BackgroundJobManager
from .cursor import ConnectionFactory, StorageConnectionFactory
from .interfaces import SqlResultInterface
from .table_names import table_names as _table_names
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
        self._workload_drivers: Dict = {"tpch": TpchDriver()}
        self._worker_pool: WorkerPool = WorkerPool(
            self._connection_factory,
            self.number_workers,
            self._id,
            workload_publisher_url,
            self._database_blocked,
            self._workload_drivers,
        )
        self._background_scheduler: BackgroundJobManager = BackgroundJobManager(
            self._id,
            self._database_blocked,
            self._connection_factory,
            self._hyrise_active,
            self._worker_pool,
            self._storage_connection_factory,
            self._workload_drivers,
        )
        self._initialize_influx()
        self._background_scheduler.start()

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

    def load_data(self, workload: Dict) -> bool:
        """Load pre-generated tables."""
        workload_type = workload["workload_type"]
        scale_factor = workload["scale_factor"]
        return (
            False
            if self._worker_pool.get_status() != "closed"
            else self._background_scheduler.load_tables(
                workload_type, float(scale_factor)
            )
        )

    def delete_data(self, workload: Dict) -> bool:
        """Delete tables."""
        workload_type = workload["workload_type"]
        scale_factor = workload["scale_factor"]
        return (
            False
            if self._worker_pool.get_status() != "closed"
            else self._background_scheduler.delete_tables(
                workload_type, float(scale_factor)
            )
        )

    def activate_plugin(self, plugin: str) -> bool:
        """Activate plugin."""
        active_plugins = self._get_plugins()
        if active_plugins is None or plugin in active_plugins:
            return False
        return self._background_scheduler.activate_plugin(plugin)

    def deactivate_plugin(self, plugin: str) -> bool:
        """Deactivate plugin."""
        return self._background_scheduler.deactivate_plugin(plugin)

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
        # TODO Adjust
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute("select * from meta_tables;", None)
                rows = cur.fetchall()
        except (DatabaseError, InterfaceError):
            return []
        else:
            return [row[0] for row in rows] if rows else []

    def get_loaded_benchmarks(self, loaded_tables) -> List[str]:
        """Get list of all benchmarks which are completely loaded."""
        loaded_benchmarks: List = []
        benchmark_names = _table_names.keys()
        scale_factors = ["0_1", "1"]

        for benchmark_name in benchmark_names:
            for scale_factor in scale_factors:
                required_tables = _table_names[benchmark_name]
                loaded = True
                for table_name in required_tables:
                    loaded = loaded and (
                        f"{table_name}_{benchmark_name}_{scale_factor}" in loaded_tables
                    )

                if loaded:
                    loaded_benchmarks.append(f"{benchmark_name}_{scale_factor}")

        return loaded_benchmarks

    def get_loaded_benchmark_data(self) -> Tuple:
        """Get loaded benchmark data."""
        loaded_tables: List = self.get_loaded_tables()
        loaded_benchmarks: List = self.get_loaded_benchmarks(loaded_tables)
        return (
            loaded_tables,
            loaded_benchmarks,
        )

    def start_worker(self) -> bool:
        """Start worker."""
        return self._worker_pool.start()

    def close_worker(self) -> bool:
        """Close worker."""
        return self._worker_pool.close()

    def _get_plugins(self) -> Optional[List[str]]:
        """Return all currently activated plugins."""
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute(("SELECT name FROM meta_plugins;"), None)
                rows = cur.fetchall()
        except (DatabaseError, InterfaceError):
            return None
        else:
            return [row[0].split("Plugin")[0] for row in rows]

    def _get_plugin_setting(self) -> Plugins:
        """Return currently set plugin settings."""
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute(
                    "SELECT name, value, description FROM meta_settings WHERE name LIKE 'Plugin::%';",
                    None,
                )
                rows = cur.fetchall()
        except (DatabaseError, InterfaceError):
            return None
        else:
            plugins: Dict[str, List[PluginSetting]] = {}
            for row in rows:
                plugin_name, setting_name = row[0].split("::")[1:]
                value, description = row[1], row[2]
                if plugins.get(plugin_name) is None:
                    plugins[plugin_name] = []
                plugins[plugin_name].append(
                    PluginSetting(
                        name=setting_name, value=value, description=description
                    )
                )
            return plugins

    def get_detailed_plugins(self) -> Plugins:
        """Get all activated plugins with their settings."""
        if (plugins := self._get_plugins()) is None:
            return None
        if (settings := self._get_plugin_setting()) is None:
            return None
        return {
            plugin_name: (
                settings[plugin_name] if plugin_name in settings.keys() else []
            )
            for plugin_name in plugins
        }

    def set_plugin_setting(
        self, plugin_name: str, setting_name: str, setting_value: str
    ) -> bool:
        """Adjust setting for given plugin."""
        if not self._database_blocked.value:
            try:
                with self._connection_factory.create_cursor() as cur:
                    cur.execute(
                        "UPDATE meta_settings SET value=%s WHERE name=%s;",
                        (
                            setting_value,
                            "::".join(["Plugin", plugin_name, setting_name]),
                        ),
                    )
                return True
            except (DatabaseError, InterfaceError):
                return False
        return False

    def execute_sql_query(self, query) -> Optional[SqlResultInterface]:
        """Execute sql query on database."""
        if not self._database_blocked.value:
            try:
                with self._connection_factory.create_cursor() as cur:
                    cur.execute(query, None)
                    col_names = cur.fetch_column_names()
                    return SqlResultInterface(
                        id=self._id,
                        successful=True,
                        results=[[str(col) for col in row] for row in cur.fetchall()],
                        col_names=col_names,
                        error_message="",
                    )
            except Error as e:
                return SqlResultInterface(
                    id=self._id,
                    successful=False,
                    results=[],
                    col_names=[],
                    error_message=str(e),
                )
        return None

    def close(self) -> None:
        """Close the database."""
        self._worker_pool.terminate()
        self._background_scheduler.close()

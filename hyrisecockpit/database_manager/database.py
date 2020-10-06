"""The database object represents the instance of a database."""

from multiprocessing import Value
from typing import Dict, List, Optional, TypedDict

from psycopg2 import DatabaseError, Error, InterfaceError

from hyrisecockpit.drivers.connector import Connector

from .asynchronous_job_handler import AsynchronousJobHandler
from .continuous_job_handler import ContinuousJobHandler
from .cursor import ConnectionFactory, StorageConnectionFactory
from .interfaces import SqlResultInterface
from .worker_pool import WorkerPool

PluginSetting = TypedDict(
    "PluginSetting", {"name": str, "value": str, "description": str}
)
Plugins = Optional[Dict[str, List[PluginSetting]]]


class Database(object):
    """Represents database.

    The database class is a representation of a registered Hyrise instance.
    All the communication with the Hyrise is managed by this class and its API.
    A worker pool object that manages the queue and task/queue workers to put the
    Hyrise under pressure is part of this class. This class also initializes an
    influx database for this Hyrise instance.
    """

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
        storage_host: str,
        storage_password: str,
        storage_port: str,
        storage_user: str,
    ) -> None:
        """Initialize database object.

        Args:
            id: A string identifying the Hyrise instance. For example hyrise_1.
            user: The user that connects to the Hyrise instance.
            password: The password needed to connect to the Hyrise instance.
            host: The address of the host machine where the Hyrise instance is running.
            port: The port on which the Hyrise instance is running.
            dbname: The database name of the Hyrise instance. For example psql.
            number_workers: Number of task workers to put the Hyrise instance under
                load. Every worker is running in its own process.
            workload_publisher_url: URL which is publishing the workload to the workers.
                This URL is used by the queue worker to connect to the workload
                generator via zeromq.
            storage_host: Address of the influx database instance.
            storage_password: Password to connect to the influx database.
            storage_port: Port of the influx database.
            storage_user: User of the influx database.

        Note:
            The attributes user, password, host, port and dbname are the same attributes
            that you would use to create a connection to the Hyrise instance with psql.

        Attributes:
            _connection_factory: This factory builds a Hyrise connection.
            _storage_connection_factory: This factory builds a influx connection.
        """
        self._id = id
        self.number_workers: int = number_workers

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

        self._storage_connection_factory: StorageConnectionFactory = (
            StorageConnectionFactory(
                storage_user,
                storage_password,
                storage_host,
                storage_port,
                id,
            )
        )

        self._database_blocked: Value = Value("b", False)
        self._hyrise_active: Value = Value("b", True)
        self._workload_drivers: Dict = Connector.get_workload_drivers()  # type: ignore
        self._worker_pool: WorkerPool = WorkerPool(
            self._connection_factory,
            self.number_workers,
            self._id,
            workload_publisher_url,
            self._database_blocked,
            self._workload_drivers,
        )
        self._continuous_job_handler = ContinuousJobHandler(
            self._connection_factory,
            self._hyrise_active,
            self._worker_pool,
            self._storage_connection_factory,
            self._database_blocked,
        )
        self._asynchronous_job_handler = AsynchronousJobHandler(
            self._database_blocked,
            self._connection_factory,
            self._workload_drivers,
        )
        self._initialize_influx()
        self._continuous_job_handler.start()

    def _initialize_influx(self) -> None:
        """Initialize Influx database.

        We drop the database inside influx that has the same name like the
        database id (Hyrise). We do that to remove all the data from previous
        runs. Then we create a new database inside influx with the database id
        (Hyrise). After that we create a continuous query that the influx is running
        every x seconds. For example, to automatically calculate the throughput
        per second.
        """
        with self._storage_connection_factory.create_cursor() as cursor:
            cursor.drop_database()
            cursor.create_database()

            throughput_continuous_query = """SELECT count("latency") AS "throughput"
                INTO "throughput"
                FROM "successful_queries"
                WHERE commited='True'
                GROUP BY time(1s)"""
            throughput_resample_options = "EVERY 1s FOR 5s"
            cursor.create_continuous_query(
                "throughput_calculation",
                throughput_continuous_query,
                throughput_resample_options,
            )

            negative_throughput_continuous_query = """SELECT count("latency") AS "negative_throughput"
                INTO "negative_throughput"
                FROM "successful_queries"
                WHERE commited='False'
                GROUP BY time(1s)"""
            negative_throughput_resample_options = "EVERY 1s FOR 5s"
            cursor.create_continuous_query(
                "negative_throughput_calculation",
                negative_throughput_continuous_query,
                negative_throughput_resample_options,
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

            queue_length_continuous_query = """SELECT mean("queue_length") AS "queue_length"
                INTO "queue_length"
                FROM "raw_queue_length"
                GROUP BY time(1s)
                FILL(linear)"""
            queue_length_resample_options = "EVERY 1s FOR 5s"
            cursor.create_continuous_query(
                "queue_length_calculation",
                queue_length_continuous_query,
                queue_length_resample_options,
            )

            system_data_metrics = [
                "available_memory",
                "cpu_count",
                "cpu_process_usage",
                "cpu_system_usage",
                "database_threads",
                "free_memory",
                "total_memory",
            ]
            system_data_select_clause = ", ".join(
                [
                    f"""mean("{metric}") AS "{metric}" """
                    for metric in system_data_metrics
                ]
            )
            system_data_continuous_query = f"""SELECT {system_data_select_clause}
                INTO "system_data"
                FROM "raw_system_data"
                GROUP BY time(1s)
                FILL(linear)"""
            system_data_resample_options = "EVERY 1s FOR 5s"
            cursor.create_continuous_query(
                "system_data_calculation",
                system_data_continuous_query,
                system_data_resample_options,
            )

    def get_queue_length(self) -> int:
        """Return queue length.

        We return the number of task that still need to be send to the
        Hyrise instance.
        """
        return self._worker_pool.get_queue_length()

    def load_data(self, workload: Dict) -> bool:
        """Load pre-generated tables.

        First, we check if the workload and scale factor is valid.
        The workload needs to have an equivalent driver and the
        driver needs to support the scale factor. Moreover the worker pool
        needs to be closed. If one of this requirements is not met, the function
        will return false. Otherwise the tables will be loaded via the
        asynchronous job handler.
        """
        workload_type = workload["workload_type"]
        scale_factor = workload["scale_factor"]
        if workload_type not in self._workload_drivers:
            return False
        elif (
            scale_factor not in self._workload_drivers[workload_type].get_scalefactors()
        ):
            return False
        elif self._worker_pool.get_status() != "closed":
            return False
        else:
            return self._asynchronous_job_handler.load_tables(
                workload_type, float(scale_factor)
            )

    def delete_data(self, workload: Dict) -> bool:
        """Delete tables.

        Same procedure like in load_data.
        """
        workload_type = workload["workload_type"]
        scale_factor = workload["scale_factor"]
        if workload_type not in self._workload_drivers:
            return False
        elif (
            scale_factor not in self._workload_drivers[workload_type].get_scalefactors()
        ):
            return False
        elif self._worker_pool.get_status() != "closed":
            return False
        else:
            return self._asynchronous_job_handler.delete_tables(
                workload_type, float(scale_factor)
            )

    def activate_plugin(self, plugin: str) -> bool:
        """Activate plugin."""
        active_plugins = self._get_plugins()
        if active_plugins is None or plugin in active_plugins:
            return False
        return self._asynchronous_job_handler.activate_plugin(plugin)

    def deactivate_plugin(self, plugin: str) -> bool:
        """Deactivate plugin."""
        return self._asynchronous_job_handler.deactivate_plugin(plugin)

    def get_database_blocked(self) -> bool:
        """Return database blocked flag.

        The database is blocked if we load/delete tables.
        """
        return bool(self._database_blocked.value)

    def get_worker_pool_status(self) -> str:
        """Return worker pool status.

        A worker poll can have the status running and closed.
        """
        return self._worker_pool.get_status()

    def get_hyrise_active(self) -> bool:
        """Return status of Hyrise.

        This flag defines if the Hyrise instance is responsive or not.
        """
        return bool(self._hyrise_active.value)

    def get_loaded_tables_in_database(self) -> List[Dict[str, str]]:
        """Return already loaded tables."""
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute("select * from meta_tables;", None)
                rows = cur.fetchall()
        except (DatabaseError, InterfaceError):
            return []
        else:
            return [row[0] for row in rows] if rows else []

    def _workload_tables_status(self, tables_in_database) -> List:
        """Get list of all benchmarks which are completely loaded."""
        workload_tables_status = []
        for workload_type, driver in self._workload_drivers.items():
            for scale_factor in driver.get_scalefactors():
                loaded_tables = []
                missing_tables = []
                workload_tables = driver.get_table_names(scale_factor)
                loaded = True
                for table_name, database_representation in workload_tables.items():
                    if database_representation not in tables_in_database:
                        loaded = False
                        missing_tables.append(table_name)
                    else:
                        loaded_tables.append(table_name)
                table = {
                    "workload_type": workload_type,
                    "scale_factor": scale_factor,
                    "loaded_tables": loaded_tables,
                    "missing_tables": missing_tables,
                    "completely_loaded": loaded,
                    "database_representation": workload_tables,
                }
                workload_tables_status.append(table)
        return workload_tables_status

    def get_workload_tables_status(self) -> List:
        """Get loaded benchmark data."""
        tables_in_database: List = self.get_loaded_tables_in_database()
        return self._workload_tables_status(tables_in_database)

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
        """Return currently set plug-in settings.

        The plug-in settings are obtained from the meta_settings table in the hyrise instance.
        Inside the hyrise instance not just plug-ins have settings. As a result we need to differentiate
        the plug-in settings from the other settings. That's why we use the SQL Statement WHERE name LIKE 'Plugin::%';.
        To get the plug-in name with which we communicate in the cockpit we need to extract it from the name column with
        row[0].split("::")[1]. So for example from Plugin::Compression::MemorySetting we get Compression.
        """
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute(
                    "SELECT name, value, description, display_name FROM meta_settings WHERE name LIKE 'Plugin::%';",
                    None,
                )
                rows = cur.fetchall()
        except (DatabaseError, InterfaceError):
            return None
        else:
            plugins: Dict[str, List[PluginSetting]] = {}
            for row in rows:
                plugin_name = row[0].split("::")[1]
                value, description, display_name = row[1:]
                if plugins.get(plugin_name) is None:
                    plugins[plugin_name] = []
                plugins[plugin_name].append(
                    PluginSetting(
                        name=display_name, value=value, description=description
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
        self._continuous_job_handler.close()

"""The database object represents the instance of a database."""

from multiprocessing import Value
from typing import Dict, List, Optional, TypedDict

from hyrisecockpit.drivers.connector import Connector

from .asynchronous_job_handler import AsynchronousJobHandler
from .continuous_job_handler import ContinuousJobHandler
from .cursor import ConnectionFactory, StorageConnectionFactory
from .synchronous_job_handler import SynchronousJobHandler
from .worker_pool import WorkerPool
from .interfaces import SqlResultInterface

PluginSetting = TypedDict(
    "PluginSetting",
    {"name": str, "display_name": str, "value": str, "description": str},
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
        self._synchronous_job_handler = SynchronousJobHandler(  # type: ignore
            self._connection_factory,
            self._database_blocked,
            self._id,
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
        return self._synchronous_job_handler.get_loaded_tables_in_database()

    def get_workload_tables_status(self) -> List:
        """Get loaded benchmark data."""
        return self._synchronous_job_handler.get_workload_tables_status()

    def start_worker(self) -> bool:
        """Start worker."""
        return self._worker_pool.start()

    def close_worker(self) -> bool:
        """Close worker."""
        return self._worker_pool.close()

    def get_detailed_plugins(self) -> Plugins:
        """Get all activated plugins with their settings."""
        return self._synchronous_job_handler.get_detailed_plugins()

    def set_plugin_setting(
        self, plugin_name: str, setting_name: str, setting_value: str
    ) -> bool:
        """Adjust setting for given plugin."""
        return self._synchronous_job_handler.set_plugin_setting(
            plugin_name, setting_name, setting_value
        )

    def execute_sql_query(self, query) -> Optional[SqlResultInterface]:
        """Execute sql query on database."""
        return self._synchronous_job_handler.execute_sql_query(query)

    def close(self) -> None:
        """Close the database."""
        self._worker_pool.terminate()
        self._continuous_job_handler.close()

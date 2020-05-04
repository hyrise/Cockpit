"""The BackgroundJobManager is managing the background jobs for the apscheduler."""

from multiprocessing import Process, Value
from typing import Any, Dict, List, Optional, Tuple, TypedDict, Union

from apscheduler.schedulers.background import BackgroundScheduler
from psycopg2 import DatabaseError, InterfaceError, ProgrammingError
from psycopg2.extensions import AsIs

from .cursor import ConnectionFactory, StorageConnectionFactory
from .job.ping_hyrise import ping_hyrise
from .job.update_chunks_data import update_chunks_data
from .job.update_krueger_data import update_krueger_data
from .job.update_plugin_log import update_plugin_log
from .job.update_queue_length import update_queue_length
from .job.update_storage_data import update_storage_data
from .job.update_system_data import update_system_data
from .table_names import table_names as _table_names
from .worker_pool import WorkerPool


class Encoding(TypedDict):
    """Type of an encoding in a storage dictionary."""

    name: str
    amount: int
    compression: List[str]


class ColumnData(TypedDict):
    """Type of column data in a storage dictionary."""

    size: int
    data_type: str
    encoding: List[Encoding]


class TableData(TypedDict):
    """Type of table data in a storage dictionary."""

    size: int
    number_columns: int
    data: Dict[str, ColumnData]


StorageDataType = Dict[str, TableData]


def format_query_parameters(parameters) -> Optional[Tuple[Any, ...]]:
    """Format query parameters for execution."""
    formatted_parameters = (
        tuple(
            AsIs(parameter) if protocol == "as_is" else parameter
            for parameter, protocol in parameters
        )
        if parameters is not None
        else None
    )
    return formatted_parameters


def execute_table_query(
    query_tuple: Tuple, success_flag: Value, connection_factory: ConnectionFactory
) -> None:
    """Execute loading or deleting table query."""
    query, parameters = query_tuple
    formatted_parameters = format_query_parameters(parameters)
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(query, formatted_parameters)
            success_flag.value = True
    except (DatabaseError, InterfaceError, ProgrammingError):
        return None  # TODO: log error


class BackgroundJobManager(object):
    """Manage background scheduling jobs."""

    def __init__(
        self,
        database_id: str,
        database_blocked: Value,
        connection_factory: ConnectionFactory,
        hyrise_active: Value,
        worker_pool: WorkerPool,
        storage_connection_factory: StorageConnectionFactory,
    ):
        """Initialize BackgroundJobManager object."""
        self._database_id: str = database_id
        self._database_blocked: Value = database_blocked
        self._connection_factory: ConnectionFactory = connection_factory
        self._storage_connection_factory: StorageConnectionFactory = storage_connection_factory
        self._worker_pool: WorkerPool = worker_pool
        self._scheduler: BackgroundScheduler = BackgroundScheduler()
        self._previous_chunks_data: Dict = {}
        self._hyrise_active: Value = hyrise_active
        self._init_jobs()

    def _init_jobs(self) -> None:
        """Initialize basic background jobs."""
        self._ping_hyrise_job = self._scheduler.add_job(
            func=ping_hyrise,
            trigger="interval",
            seconds=0.5,
            args=(self._connection_factory, self._hyrise_active,),
        )
        self._update_queue_length_job = self._scheduler.add_job(
            func=update_queue_length,
            trigger="interval",
            seconds=1,
            args=(self._worker_pool, self._storage_connection_factory),
        )
        self._update_system_data_job = self._scheduler.add_job(
            func=update_system_data,
            trigger="interval",
            seconds=1,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_storage_data_job = self._scheduler.add_job(
            func=update_storage_data,
            trigger="interval",
            seconds=5,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_plugin_log_job = self._scheduler.add_job(
            func=update_plugin_log,
            trigger="interval",
            seconds=1,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_chunks_data_job = self._scheduler.add_job(
            func=update_chunks_data,
            trigger="interval",
            seconds=5,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_krueger_data_job = self._scheduler.add_job(
            func=update_krueger_data,
            trigger="interval",
            seconds=5,
            args=(self._storage_connection_factory),
        )

    def start(self) -> None:
        """Start background scheduler."""
        self._scheduler.start()

    def close(self) -> None:
        """Close background scheduler."""
        self._update_krueger_data_job.remove()
        self._update_system_data_job.remove()
        self._update_chunks_data_job.remove()
        self._update_storage_data_job.remove()
        self._update_plugin_log_job.remove()
        self._update_queue_length_job.remove()
        self._ping_hyrise_job.remove()
        self._scheduler.shutdown()

    def _get_origin_tables_from_workload_type(
        self, table_names: List[str], workload_type: str
    ):
        return [table_name.split(f"_{workload_type}")[0] for table_name in table_names]

    def _generate_table_loading_queries(
        self, table_names: List[str], folder_name: str
    ) -> List[Tuple[str, Tuple[Tuple[Union[str, int], Optional[str]], ...]]]:
        """Generate queries in tuple form that load tables."""
        # TODO change absolute to relative path

        origin_table_names = self._get_origin_tables_from_workload_type(
            table_names, folder_name
        )

        return [
            (
                "COPY %s_%s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (
                    (name, "as_is"),
                    (folder_name, "as_is"),
                    (folder_name, "as_is"),
                    (name, "as_is"),
                ),
            )
            for name in origin_table_names
        ]

    def _execute_queries_parallel(self, table_names, queries, folder_name) -> None:
        success_flags: List[Value] = [Value("b", False) for _ in queries]
        processes: List[Process] = [
            Process(
                target=execute_table_query,
                args=(query, success_flag, self._connection_factory,),
            )
            for query, success_flag in zip(queries, success_flags)
        ]
        for process in processes:
            process.start()
        for process in processes:
            process.join()
            process.terminate()

    def _load_tables_job(self, table_names: List[str], folder_name: str) -> None:
        table_loading_queries = self._generate_table_loading_queries(
            table_names, folder_name
        )
        self._execute_queries_parallel(table_names, table_loading_queries, folder_name)
        self._database_blocked.value = False

    def _get_load_table_names(self, workload_type: str):
        """Get table names to load."""
        required_table_names = self._get_required_table_names(workload_type)
        return self._get_existing_tables(required_table_names)["not_existing"]

    def load_tables(self, folder_name: str) -> bool:
        """Load tables."""
        if self._database_blocked.value:
            return False

        table_names = self._get_load_table_names(workload_type=folder_name)
        if not table_names:
            return True

        self._database_blocked.value = True
        self._scheduler.add_job(
            func=self._load_tables_job, args=(table_names, folder_name,)
        )
        return True

    def _activate_plugin_job(self, plugin: str) -> None:
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute(
                    (
                        "INSERT INTO meta_plugins(name) VALUES ('/usr/local/hyrise/lib/lib%sPlugin.so');"
                    ),
                    (AsIs(plugin),),
                )
        except (DatabaseError, InterfaceError):
            return None  # TODO: log that activate plug-in failed

    def activate_plugin(self, plugin: str) -> bool:
        """Activate plugin."""
        if not self._database_blocked.value:
            self._scheduler.add_job(func=self._activate_plugin_job, args=(plugin,))
            return True
        else:
            return False

    def _deactivate_plugin_job(self, plugin: str) -> None:
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute(
                    ("DELETE FROM meta_plugins WHERE name='%sPlugin';"), (AsIs(plugin),)
                )
        except (DatabaseError, InterfaceError):
            return None  # TODO: log that deactivate plug-in failed

    def deactivate_plugin(self, plugin: str) -> bool:
        """Dectivate plugin."""
        if not self._database_blocked.value:
            self._scheduler.add_job(func=self._deactivate_plugin_job, args=(plugin,))
            return True
        else:
            return False

    def _get_existing_tables(self, table_names: List[str]) -> Dict:
        """Check which tables exists and which not."""
        existing_tables: List = []
        not_existing_tables: List = []
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute("show tables;", None)
                results = cur.fetchall()
                loaded_tables = [row[0] for row in results] if results else []
                for name in table_names:
                    if name in loaded_tables:
                        existing_tables.append(name)
                        continue
                    not_existing_tables.append(name)
        except (DatabaseError, InterfaceError):
            return {"existing": [], "not_existing": []}
        return {"existing": existing_tables, "not_existing": not_existing_tables}

    def _generate_table_drop_queries(self, table_names: List[str]) -> List[Tuple]:
        # TODO folder_name is unused? This deletes all tables
        """Generate queries in tuple form that drop tables."""
        return [
            ("DROP TABLE %s;", ((name, "as_is"),),)
            for name in self._get_existing_tables(table_names)["existing"]
        ]

    def _delete_tables_job(self, table_names: List[str]) -> None:
        """Delete tables."""
        table_drop_queries = self._generate_table_drop_queries(table_names)
        self._execute_queries_parallel(table_names, table_drop_queries, None)
        self._database_blocked.value = False

    def _get_delete_table_names(self, workload_type: str):
        """Get table names to delete."""
        required_table_names = self._get_required_table_names(workload_type)
        return self._get_existing_tables(required_table_names)["existing"]

    def delete_tables(self, folder_name: str) -> bool:
        """Delete tables."""
        if self._database_blocked.value:
            return False

        table_names = self._get_delete_table_names(folder_name)
        if not table_names:
            return True

        self._database_blocked.value = True
        self._scheduler.add_job(func=self._delete_tables_job, args=(table_names,))
        return True

    def _get_required_table_names(self, workload_type: str):
        """Get required table names for workload_type."""
        benchmark_name = workload_type.split("_")[0]
        origin_table_names = _table_names[benchmark_name]

        return [f"{table}_{workload_type}" for table in origin_table_names]

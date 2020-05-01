"""The BackgroundJobManager is managing the background jobs for the apscheduler."""
from copy import deepcopy
from json import dumps
from multiprocessing import Process, Value
from time import time_ns
from typing import Any, Dict, List, Optional, Tuple, TypedDict, Union

from apscheduler.schedulers.background import BackgroundScheduler
from pandas import DataFrame
from psycopg2 import DatabaseError, InterfaceError, ProgrammingError
from psycopg2.extensions import AsIs

from .cursor import ConnectionFactory, StorageCursor
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
        storage_host: str,
        storage_password: str,
        storage_port: str,
        storage_user: str,
    ):
        """Initialize BackgroundJobManager object."""
        self._database_id: str = database_id
        self._database_blocked: Value = database_blocked
        self._connection_factory: ConnectionFactory = connection_factory
        self._worker_pool: WorkerPool = worker_pool
        self._storage_host: str = storage_host
        self._storage_password: str = storage_password
        self._storage_port: str = storage_port
        self._storage_user: str = storage_user
        self._scheduler: BackgroundScheduler = BackgroundScheduler()
        self._previous_chunks_data: Dict = {}
        self._hyrise_active: Value = hyrise_active
        self._init_jobs()

    def _init_jobs(self) -> None:
        """Initialize basic background jobs."""
        self._update_krueger_data_job = self._scheduler.add_job(
            func=self._update_krueger_data, trigger="interval", seconds=5,
        )
        self._update_chunks_data_job = self._scheduler.add_job(
            func=self._update_chunks_data, trigger="interval", seconds=5,
        )
        self._update_system_data_job = self._scheduler.add_job(
            func=self._update_system_data, trigger="interval", seconds=1,
        )
        self._update_storage_data_job = self._scheduler.add_job(
            func=self._update_storage_data, trigger="interval", seconds=5,
        )
        self._update_plugin_log_job = self._scheduler.add_job(
            func=self._update_plugin_log, trigger="interval", seconds=1,
        )
        self._ping_hyrise_job = self._scheduler.add_job(
            func=self._ping_hyrise, trigger="interval", seconds=0.5,
        )
        self._update_queue_length_job = self._scheduler.add_job(
            func=self._update_queue_length, trigger="interval", seconds=1,
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

    def _ping_hyrise(self) -> None:
        """Check in interval if hyrise is still alive."""
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute("SELECT 1;", None)
                self._hyrise_active.value = True
        except (DatabaseError, InterfaceError):
            self._hyrise_active.value = False

    def _update_queue_length(self) -> None:
        queue_length: int = self._worker_pool.get_queue_length()
        time_stamp: int = time_ns()
        with StorageCursor(
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        ) as log:
            log.log_meta_information(
                "queue_length", {"queue_length": queue_length}, time_stamp,
            )

    def _update_krueger_data(self) -> None:
        time_stamp = time_ns()
        executed_mocked_data = {
            "SELECT": 100,
            "INSERT": 0,
            "UPDATE": 0,
            "DELETE": 0,
        }
        generated_mocked_data = {
            "SELECT": 100,
            "INSERT": 0,
            "UPDATE": 0,
            "DELETE": 0,
        }
        with StorageCursor(
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        ) as log:
            log.log_meta_information(
                "krueger_data",
                {
                    "executed": dumps(executed_mocked_data),
                    "generated": dumps(generated_mocked_data),
                },
                time_stamp,
            )

    def _sql_to_data_frame(self, sql: str, params: Optional[Tuple]) -> DataFrame:
        if self._database_blocked.value:
            return DataFrame()
        try:
            with self._connection_factory.create_cursor() as cur:
                return cur.read_sql_query(sql, params)
        except (DatabaseError, InterfaceError):
            return DataFrame()

    def _calculate_chunks_difference(self, base: Dict, substractor: Dict) -> Dict:
        """Calculate difference base - substractor."""
        for table_name in base.keys():
            if table_name in substractor.keys():
                for column_name in base[table_name].keys():
                    if column_name in substractor[table_name].keys():
                        if len(base[table_name][column_name]) == len(
                            substractor[table_name][column_name]
                        ):
                            base[table_name][column_name] = [
                                base[table_name][column_name][i]
                                - substractor[table_name][column_name][i]
                                for i in range(len(base[table_name][column_name]))
                            ]
        return base

    def _create_chunks_dictionary(
        self, meta_segments: DataFrame
    ) -> Dict:  # TODO refactoring
        chunks_data: Dict = {}
        grouped_tables = meta_segments.reset_index().groupby("table_name")

        for table_name in grouped_tables.groups:
            chunks_data[table_name] = {}
            table = grouped_tables.get_group(table_name)
            grouped_columns = table.reset_index().groupby("column_name")

            for column_name in grouped_columns.groups:
                column = grouped_columns.get_group(column_name)
                access_data = []
                for _, row in column.iterrows():
                    access_data.append(row["access_count"])
                chunks_data[table_name][column_name] = access_data
        return chunks_data

    def _update_chunks_data(self) -> None:
        """Update chunks data for database instance."""
        time_stamp = time_ns()
        sql = """SELECT table_name, column_name, chunk_id, (point_accesses + sequential_accesses + monotonic_accesses + random_accesses) as access_count
            FROM meta_segments;"""

        meta_segments = self._sql_to_data_frame(sql, None)

        chunks_data = {}
        if not meta_segments.empty:
            new_chunks_data = self._create_chunks_dictionary(meta_segments)
            chunks_data = self._calculate_chunks_difference(
                deepcopy(new_chunks_data), self._previous_chunks_data
            )
            self._previous_chunks_data = new_chunks_data

        with StorageCursor(
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        ) as log:
            log.log_meta_information(
                "chunks_data",
                {"chunks_data_meta_information": dumps(chunks_data)},
                time_stamp,
            )

    def _update_plugin_log(self) -> None:
        """Update plugin log."""
        endts = int(time_ns() / 1_000_000)  # timestamps in hyrise are in ms-precision
        startts = endts - 5_000

        log_df = self._sql_to_data_frame(
            """SELECT * FROM meta_log WHERE "timestamp" >= %s AND "timestamp" < %s;""",
            params=(startts, endts),
        )

        if log_df.empty:
            return

        plugin_log = [
            (row["timestamp"], row["reporter"], row["message"])
            for row in log_df.to_dict("index").values()
        ]

        with StorageCursor(
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        ) as log:
            log.log_plugin_log(plugin_log)

    def _create_system_data_dict(
        self, utilization_df, system_df, database_threads: int
    ) -> Dict[str, Union[int, float]]:
        return {
            "cpu_system_usage": float(utilization_df["cpu_system_usage"][0]),
            "cpu_process_usage": float(utilization_df["cpu_process_usage"][0]),
            "cpu_count": int(system_df["cpu_count"][0]),
            "cpu_clock_speed": int(system_df["cpu_clock_speed"][0]),
            "free_memory": int(utilization_df["system_memory_free_bytes"][0]),
            "used_memory": int(utilization_df["process_physical_memory_bytes"][0]),
            "total_memory": int(system_df["system_memory_total_bytes"][0]),
            "database_threads": database_threads,
        }

    def _update_system_data(self) -> None:
        """Update system data for database instance."""
        utilization_df = self._sql_to_data_frame(
            "SELECT * FROM meta_system_utilization;", None
        )
        system_df = self._sql_to_data_frame(
            "SELECT * FROM meta_system_information;", None
        )

        if utilization_df.empty or system_df.empty:
            return

        mocked_database_threads = 16
        system_data: Dict[str, Union[int, float]] = self._create_system_data_dict(
            utilization_df, system_df, mocked_database_threads
        )
        time_stamp = time_ns()

        with StorageCursor(
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        ) as log:
            log.log_meta_information(
                "system_data", system_data, time_stamp,
            )

    def _create_storage_data_dataframe(self, meta_segments: DataFrame) -> DataFrame:
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

        vector_compression_type = DataFrame(
            meta_segments["vector_compression_type"]
            .groupby(level=["table_name", "column_name"])
            .apply(set)
            .apply(list)
        )

        encoding: DataFrame = DataFrame(
            meta_segments["encoding_type"]
            .groupby(level=["table_name", "column_name"])
            .apply(list)
        )

        combined_encoding = encoding.join(vector_compression_type)

        for _, row in combined_encoding.iterrows():
            row["encoding_type"] = [
                {
                    "name": encoding,
                    "amount": row["encoding_type"].count(encoding),
                    "compression": row["vector_compression_type"],
                }
                for encoding in set(row["encoding_type"])
            ]

        datatype: DataFrame = meta_segments.reset_index().set_index(
            ["table_name", "column_name"]
        )[["column_data_type"]]

        result: DataFrame = size.join(combined_encoding).join(datatype)
        return result

    def _create_storage_data_dictionary(self, result: DataFrame) -> StorageDataType:
        """Sort storage data to dictionary."""
        output: StorageDataType = {}
        grouped = result.reset_index().groupby("table_name")
        for column in grouped.groups:
            output[column] = {"size": 0, "number_columns": 0, "data": {}}
            for _, row in grouped.get_group(column).iterrows():
                output[column]["number_columns"] += 1
                output[column]["size"] += row["estimated_size_in_bytes"]
                output[column]["data"][row["column_name"]] = {
                    "size": row["estimated_size_in_bytes"],
                    "data_type": row["column_data_type"],
                    "encoding": row["encoding_type"],
                }
        return output

    def _update_storage_data(self) -> None:
        """Get storage data from the database."""
        time_stamp = time_ns()
        meta_segments = self._sql_to_data_frame("SELECT * FROM meta_segments;", None)

        with StorageCursor(
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        ) as log:
            output = {}
            if not meta_segments.empty:
                result = self._create_storage_data_dataframe(meta_segments)
                output = self._create_storage_data_dictionary(result)
            log.log_meta_information(
                "storage", {"storage_meta_information": dumps(output)}, time_stamp
            )

    def _get_origin_tables_from_workload_type(
        self, table_names: List[str], workload_type: str
    ):
        return [table_name.split(f"_{workload_type}")[0] for table_name in table_names]

    def _generate_table_loading_queries(
        self, table_names: List[str], workload_type: str
    ) -> List[Tuple[str, Tuple[Tuple[Union[str, int], Optional[str]], ...]]]:
        """Generate queries in tuple form that load tables."""
        # TODO change absolute to relative path

        origin_table_names = self._get_origin_tables_from_workload_type(
            table_names, workload_type
        )

        return [
            (
                "COPY %s_%s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (
                    (name, "as_is"),
                    (workload_type, "as_is"),
                    (workload_type, "as_is"),
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

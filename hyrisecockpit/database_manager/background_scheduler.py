"""The BackgroundJobManager is managing the background jobs for the apscheduler."""

from copy import deepcopy
from json import dumps
from multiprocessing import Process, Value
from time import time, time_ns
from typing import Any, Dict, List, Optional, Tuple, Union

from apscheduler.schedulers.background import BackgroundScheduler
from pandas import DataFrame
from psycopg2 import DatabaseError, InterfaceError, ProgrammingError, pool
from psycopg2.extensions import AsIs

from .cursor import PoolCursor, StorageCursor
from .table_names import table_names as _table_names
from .worker_pool import WorkerPool


class BackgroundJobManager(object):
    """Manage background scheduling jobs."""

    def __init__(
        self,
        database_id: str,
        database_blocked: Value,
        connection_pool: pool,
        loaded_tables: Dict[str, Optional[str]],
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
        self._connection_pool: pool = connection_pool
        self._worker_pool: WorkerPool = worker_pool
        self._storage_host: str = storage_host
        self._storage_password: str = storage_password
        self._storage_port: str = storage_port
        self._storage_user: str = storage_user
        self._scheduler: BackgroundScheduler = BackgroundScheduler()
        self._previous_chunks_data: Dict = {}
        self._loaded_tables: Dict[str, Optional[str]] = loaded_tables
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
            with PoolCursor(self._connection_pool) as cur:
                cur.execute("SELECT 1;", None)
                self._hyrise_active.value = True
        except (DatabaseError, InterfaceError):
            self._hyrise_active.value = False

    def _update_queue_length(self) -> None:
        queue_length: int = self._worker_pool.get_queue_length()
        time_stamp: int = int(time()) * 1_000_000_000
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

    def _sql_to_data_frame(self, sql: str) -> DataFrame:
        if self._database_blocked.value:
            return DataFrame()
        try:
            with PoolCursor(self._connection_pool) as cur:
                return cur.read_sql_query(sql)
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

        meta_segments = self._sql_to_data_frame(sql)

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
        log_df = self._sql_to_data_frame("SELECT * FROM meta_log;")

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

    def _create_cpu_data_dict(
        self, utilization_df, system_df
    ) -> Dict[str, Union[int, float]]:
        return {
            "cpu_system_usage": float(utilization_df["cpu_system_usage"][0]),
            "cpu_process_usage": float(utilization_df["cpu_process_usage"][0]),
            "cpu_count": int(system_df["cpu_count"][0]),
            "cpu_clock_speed": int(system_df["cpu_clock_speed"][0]),
        }

    def _create_memory_data_dict(
        self, utilization_df, system_df
    ) -> Dict[str, Union[int, float]]:
        memory_data: Dict[str, Union[int, float]] = {
            "free": int(utilization_df["system_memory_free_bytes"][0]),
            "used": int(utilization_df["process_physical_memory_bytes"][0]),
            "total": int(system_df["system_memory_total_bytes"][0]),
        }

        memory_data["percent"] = memory_data["used"] / memory_data["total"]
        return memory_data

    def _update_system_data(self) -> None:
        """Update system data for database instance."""
        time_stamp = time_ns()

        utilization_df = self._sql_to_data_frame(
            "SELECT * FROM meta_system_utilization;"
        )
        system_df = self._sql_to_data_frame("SELECT * FROM meta_system_information;")

        if utilization_df.empty or system_df.empty:
            return

        cpu_data: Dict[str, Union[int, float]] = self._create_cpu_data_dict(
            utilization_df, system_df
        )
        memory_data: Dict[str, Union[int, float]] = self._create_memory_data_dict(
            utilization_df, system_df
        )
        mocked_database_threads = "16"

        with StorageCursor(
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        ) as log:
            system_data = {
                "cpu": dumps(cpu_data),
                "memory": dumps(memory_data),
                "database_threads": mocked_database_threads,
            }
            log.log_meta_information("system_data", system_data, time_stamp)

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
        return result

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

    def _update_storage_data(self) -> None:
        """Get storage data from the database."""
        time_stamp = time_ns()
        meta_segments = self._sql_to_data_frame("SELECT * FROM meta_segments;")

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

    def _generate_table_loading_queries(
        self, table_names: List[str], folder_name: str
    ) -> List[Tuple[str, Tuple[Tuple[Union[str, int], Optional[str]], ...]]]:
        """Generate queries in tuple form that load tables."""
        # TODO change absolute to relative path
        return [
            (
                "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                ((name, "as_is"), (folder_name, "as_is"), (name, "as_is"),),
            )
            for name in table_names
        ]

    def _format_query_parameters(self, parameters) -> Optional[Tuple[Any, ...]]:
        formatted_parameters = (
            tuple(
                AsIs(parameter) if protocol == "as_is" else parameter
                for parameter, protocol in parameters
            )
            if parameters is not None
            else None
        )
        return formatted_parameters

    def _execute_table_query(self, query_tuple: Tuple, success_flag: Value,) -> None:
        query, parameters = query_tuple
        formatted_parameters = self._format_query_parameters(parameters)
        try:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(query, formatted_parameters)
                success_flag.value = True
        except (DatabaseError, InterfaceError, ProgrammingError):
            return None  # TODO: log error

    def _execute_queries_parallel(self, table_names, queries, folder_name) -> None:
        success_flags: List[Value] = [Value("b", False) for _ in queries]
        processes: List[Process] = [
            Process(target=self._execute_table_query, args=(query, success_flag),)
            for query, success_flag in zip(queries, success_flags)
        ]
        for process in processes:
            process.start()
        for process in processes:
            process.join()
            process.terminate()

        for success_flag, table_name in zip(success_flags, table_names):
            if success_flag.value:
                self._loaded_tables[table_name] = folder_name

    def _load_tables_job(self, table_names: List[str], folder_name: str) -> None:
        table_loading_queries = self._generate_table_loading_queries(
            table_names, folder_name
        )
        self._execute_queries_parallel(table_names, table_loading_queries, folder_name)
        self._database_blocked.value = False

    def _get_load_table_names(self, workload_type: str):
        """Get table names to load."""
        table_names = []
        full_table_names = _table_names.get(workload_type.split("_")[0])
        if full_table_names is not None:
            table_names = [
                table_name
                for table_name in full_table_names
                if self._loaded_tables[table_name] != workload_type
            ]
        return table_names

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
            with PoolCursor(self._connection_pool) as cur:
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
            with PoolCursor(self._connection_pool) as cur:
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
            with PoolCursor(self._connection_pool) as cur:
                cur.execute("SELECT table_name FROM meta_tables;", None)
                results = cur.fetchall()
                loaded_tables = [row[0] for row in results]
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

    def _get_delete_table_names(self, folder_name: str):
        """Get table names to delete."""
        table_names = _table_names.get(folder_name.split("_")[0])
        if table_names is None:
            return []
        else:
            return table_names

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

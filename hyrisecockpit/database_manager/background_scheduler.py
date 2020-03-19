"""The BackgroundJobManager is managing the background jobs for the apscheduler."""

from copy import deepcopy
from json import dumps
from multiprocessing import Process, Value
from time import time_ns
from typing import Dict, List, Optional, Tuple, Union

from apscheduler.schedulers.background import BackgroundScheduler
from pandas import DataFrame
from pandas.io.sql import read_sql_query
from psycopg2 import pool
from psycopg2.extensions import AsIs

from .cursor import PoolCursor, StorageCursor
from .table_names import table_names as _table_names


class BackgroundJobManager(object):
    """Manage background scheduling jobs."""

    def __init__(
        self,
        database_id: str,
        database_blocked: Value,
        connection_pool: pool,
        storage_host: str,
        storage_password: str,
        storage_port: str,
        storage_user: str,
    ):
        """Initialize BackgroundJobManager object."""
        self._database_id = database_id
        self._database_blocked = database_blocked
        self._connection_pool = connection_pool
        self._storage_host = storage_host
        self._storage_password = storage_password
        self._storage_port = storage_port
        self._storage_user = storage_user
        self._scheduler = BackgroundScheduler()
        self._previous_chunks_data: Dict = {}
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
        self._scheduler.shutdown()

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
        else:
            with PoolCursor(self._connection_pool) as cur:
                return read_sql_query(sql, cur.connection)

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

        log_dict = log_df.set_index(["timestamp", "reporter"]).to_dict("index")
        plugin_log = [
            (timestamp, reporter, message["message"])
            for (timestamp, reporter), message in log_dict.items()
        ]

        with StorageCursor(
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        ) as log:
            log.log_plugin_log(plugin_log)

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

    def _create_chunks_dictionary(self, meta_segments: DataFrame) -> Dict:
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

    def _update_system_data(self) -> None:
        """Update system data for database instance."""
        time_stamp = time_ns()

        system_utilization_sql = "SELECT * FROM meta_system_utilization;"
        utilization_segments = self._sql_to_data_frame(system_utilization_sql)

        system_information_sql = "SELECT * FROM meta_system_information;"
        system_segments = self._sql_to_data_frame(system_information_sql)

        if utilization_segments.empty or system_segments.empty:
            return

        cpu_data = {
            "cpu_system_usage": float(utilization_segments["cpu_system_usage"][0]),
            "cpu_process_usage": float(utilization_segments["cpu_process_usage"][0]),
            "cpu_count": int(system_segments["cpu_count"][0]),
            "cpu_clock_speed": int(system_segments["cpu_clock_speed"][0]),
        }
        memory_data: Dict[str, Union[int, float]] = {
            "free": int(utilization_segments["system_memory_free_bytes"][0]),
            "used": int(utilization_segments["process_physical_memory_bytes"][0]),
            "total": int(system_segments["system_memory_total_bytes"][0]),
        }

        memory_data["percent"] = memory_data["used"] / memory_data["total"]

        database_threads = "8"

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
                "database_threads": database_threads,
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

    def _execute_queries(self, execute_query: Tuple) -> None:
        with PoolCursor(self._connection_pool) as cur:
            query, not_formatted_parameters = execute_query
            formatted_parameters = (
                tuple(
                    AsIs(parameter) if protocol == "as_is" else parameter
                    for parameter, protocol in not_formatted_parameters
                )
                if not_formatted_parameters is not None
                else None
            )
            cur.execute(query, formatted_parameters)

    def _load_tables_job(self, table_names: List[str], folder_name: str) -> None:
        table_loading_queries = self._generate_table_loading_queries(
            table_names, folder_name
        )
        processes = []
        for i in range(len(table_loading_queries)):
            p = Process(target=self._execute_queries, args=(table_loading_queries[i],))
            processes.append(p)
            p.start()
        for process in processes:
            process.join()
            process.terminate()
        self._database_blocked.value = False

    def load_tables(self, folder_name: str) -> bool:
        """Load tables."""
        table_names = _table_names.get(folder_name.split("_")[0])
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._scheduler.add_job(
                func=self._load_tables_job, args=(table_names, folder_name)
            )
            return True
        else:
            return False

    def _get_existing_tables(self, table_names: List[str]) -> Dict:
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

    def _generate_table_drop_queries(
        self, table_names: List[str], folder_name: str
    ) -> List[Tuple]:
        # TODO folder_name is unused? This deletes all tables
        """Generate queries in tuple form that drop tables."""
        return [
            ("DROP TABLE %s;", ((name, "as_is"),),)
            for name in self._get_existing_tables(table_names)["existing"]
        ]

    def _delete_tables_job(self, table_names: List[str], folder_name: str) -> None:
        table_drop_queries = self._generate_table_drop_queries(table_names, folder_name)
        processes = []
        for i in range(len(table_drop_queries)):
            p = Process(target=self._execute_queries, args=(table_drop_queries[i],))
            processes.append(p)
            p.start()
        for process in processes:
            process.join()
            process.terminate()
        self._database_blocked.value = False

    def delete_tables(self, folder_name: str) -> bool:
        """Load tables."""
        table_names = _table_names.get(folder_name.split("_")[0])
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._scheduler.add_job(
                func=self._delete_tables_job, args=(table_names, folder_name)
            )
            return True
        else:
            return False

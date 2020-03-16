"""The BackgroundJobManager is managing the background jobs for the apscheduler."""

from copy import deepcopy
from json import dumps
from multiprocessing import Value
from time import time_ns
from typing import Dict, Union

from apscheduler.schedulers.background import BackgroundScheduler
from pandas import DataFrame
from pandas.io.sql import read_sql_query
from psycopg2 import pool

from .cursor import PoolCursor, StorageCursor


class BackgroundJobManager(object):
    """Manage background scheduling jobs."""

    def __init__(
        self,
        database_id: str,
        processing_tables_flag: Value,
        connection_pool: pool,
        storage_host: str,
        storage_password: str,
        storage_port: str,
        storage_user: str,
    ):
        """Initialize BackgroundJobManager object."""
        self._database_id = database_id
        self._processing_tables_flag = processing_tables_flag
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

    def start(self) -> None:
        """Start background scheduler."""
        self._scheduler.start()

    def close(self) -> None:
        """Close background scheduler."""
        self._update_krueger_data_job.remove()
        self._update_system_data_job.remove()
        self._update_chunks_data_job.remove()
        self._update_storage_data_job.remove()
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

    def _read_meta_segments(self, sql: str) -> DataFrame:
        if self._processing_tables_flag.value:
            return DataFrame({"foo": []})  # TODO remove foo
        else:
            with PoolCursor(self._connection_pool) as cur:
                meta_segments = read_sql_query(sql, cur.connection)
            return meta_segments

    def _update_chunks_data(self) -> None:
        """Update chunks data for database instance."""
        time_stamp = time_ns()
        sql = """SELECT table_name, column_name, chunk_id, (point_accesses + sequential_accesses + monotonic_accesses + random_accesses) as access_count
            FROM meta_segments;"""

        meta_segments = self._read_meta_segments(sql)

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

    def _calculate_chunks_difference(self, base: Dict, substractor: Dict) -> Dict:
        """Calculate difference base - substractor."""
        for table_name in base.keys():
            if table_name in substractor.keys():
                for column_name in base[table_name].keys():
                    if column_name in substractor[table_name].keys():
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
        utilization_segments = self._read_meta_segments(system_utilization_sql)

        system_information_sql = "SELECT * FROM meta_system_information;"
        system_segments = self._read_meta_segments(system_information_sql)

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
        meta_segments = self._read_meta_segments("SELECT * FROM meta_segments;")

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

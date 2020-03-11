"""The BackgroundJobManager is managing the background jobs for the apscheduler."""

from json import dumps
from multiprocessing import Value
from secrets import randbelow
from time import time_ns
from typing import Dict

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
        self._init_jobs()

    def _init_jobs(self):
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

    def start(self):
        """Start background scheduler."""
        self._scheduler.start()

    def close(self):
        """Close background scheduler."""
        self._update_krueger_data_job.remove()
        self._update_system_data_job.remove()
        self._update_chunks_data_job.remove()
        self._update_storage_data_job.remove()
        self._scheduler.shutdown()

    def _update_krueger_data(self):
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

    def _read_meta_segments(self, sql) -> DataFrame:
        if self._processing_tables_flag.value:
            return DataFrame({"foo": []})  # TODO remove foo
        else:
            with PoolCursor(self._connection_pool) as cur:
                meta_segments = read_sql_query(sql, cur.connection)
            return meta_segments

    def _update_chunks_data(self) -> None:
        """Update chunks data for database instance."""
        # mocking chunks data
        time_stamp = time_ns()
        sql = """SELECT table_name, column_name, COUNT(chunk_id) as n_chunks FROM meta_segments GROUP BY table_name, column_name;"""
        meta_segments = self._read_meta_segments(sql)

        with StorageCursor(
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        ) as log:
            output = {}
            if not meta_segments.empty:
                output = self._read_chunks_data(meta_segments)
            log.log_meta_information(
                "chunks_data",
                {"chunks_data_meta_information": dumps(output)},
                time_stamp,
            )

    def _read_chunks_data(self, meta_segments) -> Dict:
        chunks_data: Dict = {}
        grouped = meta_segments.reset_index().groupby("table_name")
        for column in grouped.groups:
            chunks_data[column] = {}
            for _, row in grouped.get_group(column).iterrows():
                data = []
                for _ in range(row["n_chunks"]):
                    current = randbelow(500)
                    data.append(current if (current < 100) else 0)
                chunks_data[column][row["column_name"]] = data
        return chunks_data

    def _update_system_data(self) -> None:
        """Update system data for database instance."""
        time_stamp = time_ns()
        # mocked cpu data
        cpu_data = [randbelow(1001) / 10 for _ in range(16)]
        # mocked memory data
        total_memory = 32 * (1024 ** 3)
        used_memory = randbelow(total_memory)
        available_memory = total_memory - used_memory
        memory_data = {
            "available": available_memory,
            "used": used_memory,
            "cached": 4237438976,
            "percent": used_memory / total_memory,
            "free": 5536755712,
            "inactive": 2687451136,
            "active": 3657117696,
            "shared": 1149366272,
            "total": total_memory,
            "buffers": 169537536,
        }

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
                "database_threads": "8",
            }
            log.log_meta_information("system_data", system_data, time_stamp)

    def _create_storage_data_dataframe(self, meta_segments) -> DataFrame:
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

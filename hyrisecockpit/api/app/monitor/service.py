from json import loads
from typing import List, Dict, Union
from hyrisecockpit.api.app.connection_manager import StorageConnection
from hyrisecockpit.api.app.historical_data_handling import (
    get_historical_metric,
    get_interval_limits,
)
from hyrisecockpit.api.app.shared import _get_active_databases
from .model import (
    FailedTasks,
    FailedTaskEntry,
    TimeInterval,
    Cpu,
    Memory,
    SystemDataEntry,
    SystemData,
    SystemEntry,
    ChunksEntry,
)


class MonitorService:
    @staticmethod
    def get_data(
        time_interval: TimeInterval, table_name: str, column_names: List[str]
    ) -> List[Dict[str, Union[str, List]]]:
        """Return metric information in a given time range."""
        precise_startts: int = time_interval.startts
        precise_endts: int = time_interval.endts
        precision_ns: int = time_interval.precision

        (startts, endts) = get_interval_limits(
            precise_startts, precise_endts, precision_ns
        )

        with StorageConnection() as client:
            return get_historical_metric(
                startts, endts, precision_ns, table_name, column_names, client
            )

    @classmethod
    def get_system_data(cls, time_interval: TimeInterval) -> List[SystemEntry]:
        historical_system_data: List[Dict] = cls.get_data(
            time_interval,
            "system_data",
            [
                "cpu_count",
                "cpu_process_usage",
                "cpu_system_usage",
                "database_threads",
                "free_memory",
                "total_memory",
                "available_memory",
            ],
        )
        system_entries: List[SystemEntry] = []
        for database_data in historical_system_data:
            system_data: List[SystemData] = []
            for point in database_data["system_data"]:
                cpu_entry = Cpu(
                    cpu_system_usage=point["cpu_system_usage"],
                    cpu_process_usage=point["cpu_process_usage"],
                    cpu_count=point["cpu_count"],
                )
                memory_entry = Memory(
                    free=point["free_memory"],
                    available=point["available_memory"],
                    total=point["total_memory"],
                    percent=(
                        point["available_memory"] / point["total_memory"]
                        if point["total_memory"] != 0.0
                        else 0.0
                    ),
                )
                system_data_entry = SystemDataEntry(
                    cpu=cpu_entry,
                    memory=memory_entry,
                    database_threads=point["database_threads"],
                )
                system_data.append(
                    SystemData(
                        timestamp=point["timestamp"],
                        system_data_entry=system_data_entry,
                    )
                )
            system_entries.append(
                SystemEntry(database_id=database_data["id"], system_data=system_data)
            )
        return system_entries

    @classmethod
    def get_failed_tasks(cls) -> List[FailedTasks]:
        failed_tasks = []
        with StorageConnection() as client:
            for database in _get_active_databases():
                failed_task_entries = [
                    FailedTaskEntry(
                        timestamp=task["time"],
                        worker_id=task["worker_id"],
                        task=task["task"],
                        error=task["error"],
                    )
                    for task in list(
                        client.query(
                            "SELECT * FROM failed_queries LIMIT 100;",
                            database=database,
                        )["failed_queries", None]
                    )
                ]
            failed_tasks.append(
                FailedTasks(
                    database_id=database, failed_task_entries=failed_task_entries
                )
            )
        return failed_tasks

    @classmethod
    def get_chunks(cls) -> List[ChunksEntry]:
        chunks: List[ChunksEntry] = []
        with StorageConnection() as client:
            for database in _get_active_databases():
                result = client.query(
                    'SELECT LAST("chunks_data_meta_information") FROM chunks_data',
                    database=database,
                )
                chunks_value = list(result["chunks_data", None])
                if len(chunks_value) > 0:
                    chunks.append(
                        ChunksEntry(
                            database_id=database,
                            chunks_data=loads(chunks_value[0]["last"]),
                        )
                    )
                else:
                    chunks.append(ChunksEntry(database_id=database, chunks_data={}))
        return chunks

"""Service for monitor namespace.

The service is responsible for interacting with the entity. This includes
fetching data from the influx or database manager. The data is then if needed
deserialized into a Python entity (model) by using the corresponding schemas.
"""

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
    StorageData,
    SegmentConfigurationEntry,
    WorkloadStatementInformation,
    WorkloadOperatorInformation,
)
from .schema import (
    SegmentConfigurationEntrySchema,
    StorageDataSchema,
    WorkloadStatementInformationSchema,
    WorkloadOperatorInformationSchema,
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
                FailedTasks(database_id=database, failed_queries=failed_task_entries)
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

    @classmethod
    def get_storage(cls) -> List[StorageData]:
        storage_data: List[StorageData] = []
        with StorageConnection() as client:
            for database in _get_active_databases():
                result = client.query(
                    'SELECT LAST("storage_meta_information") FROM storage',
                    database=database,
                )
                storage_value = list(result["storage", None])
                if len(storage_value) > 0:
                    storage_data.append(
                        StorageDataSchema().load(
                            {
                                "id": database,
                                "storage": loads(storage_value[0]["last"]),
                            }
                        )
                    )
                else:
                    storage_data.append(StorageData(id=database, storage={}))
        return storage_data

    @classmethod
    def _get_segment_configuration_type(
        cls, client, database: str, segment_configuration_type: str
    ) -> Dict:
        configuration = client.query(
            f'SELECT LAST("{segment_configuration_type}") FROM segment_configuration',
            database=database,
        )
        segment_configuration = list(configuration["segment_configuration", None])
        if len(segment_configuration) > 0:
            return loads(segment_configuration[0]["last"])
        else:
            return {}

    @classmethod
    def get_segment_configuration(cls) -> List[SegmentConfigurationEntry]:
        segment_configurations: List[SegmentConfigurationEntry] = []
        with StorageConnection() as client:
            for database in _get_active_databases():
                encoding_type = cls._get_segment_configuration_type(
                    client, database, "segment_configuration_encoding_type"
                )
                order_mode = cls._get_segment_configuration_type(
                    client, database, "segment_configuration_order_mode"
                )
                segment_configurations.append(
                    SegmentConfigurationEntrySchema().load(
                        {
                            "id": database,
                            "encoding_type": encoding_type,
                            "order_mode": order_mode,
                        }
                    )
                )
        return segment_configurations

    @classmethod
    def get_workload_statement_information(cls) -> List[WorkloadStatementInformation]:
        workload_statement_information: List[WorkloadStatementInformation] = []
        with StorageConnection() as client:
            for database in _get_active_databases():
                result = client.query(
                    'SELECT LAST("workload_statement_information"), * FROM workload_statement_information',
                    database=database,
                )
                workload_statement_information_values = list(
                    result["workload_statement_information", None]
                )
                workload_statement_information_entries: List[Dict] = []
                if len(workload_statement_information_values) > 0:
                    workload_statement_information_entries = loads(
                        workload_statement_information_values[0]["last"]
                    )

                workload_statement_information.append(
                    WorkloadStatementInformationSchema().load(
                        {
                            "id": database,
                            "workload_statement_information": workload_statement_information_entries,
                        }
                    )
                )
        return workload_statement_information

    @classmethod
    def get_workload_operator_information(cls) -> List[WorkloadOperatorInformation]:
        workload_operation_information: List[WorkloadOperatorInformation] = []
        with StorageConnection() as client:
            for database in _get_active_databases():
                result = client.query(
                    'SELECT LAST("workload_operator_information") FROM workload_operator_information',
                    database=database,
                )
                operator_rows = list(result["workload_operator_information", None])
                workload_operation_information_entries: List[Dict] = []
                if len(operator_rows) > 0:
                    workload_operation_information_entries = loads(
                        operator_rows[0]["last"]
                    )
                workload_operation_information.append(
                    WorkloadOperatorInformationSchema().load(
                        {
                            "id": database,
                            "workload_operator_information": workload_operation_information_entries,
                        }
                    )
                )
        return workload_operation_information

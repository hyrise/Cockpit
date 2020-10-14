"""Model for monitor namespace.

A model is used for type safety and to represent a entity itself as
a Python representation (object). If we for example getting a response
from the database manager or influxdb we convert this response, which
is often a json, to a Python objects. These objects are defined by
the models. These objects are often composed of other objects.
"""

from typing import List, Dict


class FailedTaskEntry:
    def __init__(self, timestamp: int, worker_id: str, task: str, error: str):
        self.timestamp: int = timestamp
        self.worker_id: str = worker_id
        self.task: str = task
        self.error: str = error


class FailedTasks:
    """Defines a FailedTask entity.

    Consists out of a FailedTaskEntry entity.
    """

    def __init__(self, database_id: str, failed_queries: List[FailedTaskEntry]):
        self.id: str = database_id
        self.failed_queries: List[FailedTaskEntry] = failed_queries


class TimeInterval:
    def __init__(self, startts: int, endts: int, precision: int):
        self.startts: int = startts
        self.endts: int = endts
        self.precision: int = precision


class Cpu:
    def __init__(
        self, cpu_system_usage: float, cpu_process_usage: float, cpu_count: int
    ):
        self.cpu_system_usage: float = cpu_system_usage
        self.cpu_process_usage: float = cpu_process_usage
        self.cpu_count: int = cpu_count


class Memory:
    def __init__(self, free: int, available: int, total: int, percent: float):
        self.free: int = free
        self.available: int = available
        self.total: int = total
        self.percent: float = percent


class SystemDataEntry:
    def __init__(self, cpu: Cpu, memory: Memory, database_threads: int):
        self.cpu: Cpu = cpu
        self.memory: Memory = memory
        self.database_threads: int = database_threads


class SystemData:
    def __init__(self, timestamp: int, system_data_entry: SystemDataEntry):
        self.timestamp: int = timestamp
        self.system_data: SystemDataEntry = system_data_entry


class SystemEntry:
    """Defines a SystemEntry entity.

    Consists out of a SystemData entity which consists out of
    a Memory entity and Cpu entity.
    """

    def __init__(self, database_id: str, system_data: List[SystemData]):
        self.id: str = database_id
        self.system_data: List[SystemData] = system_data


class ChunksEntry:
    def __init__(self, database_id: str, chunks_data: Dict):
        self.id: str = database_id
        self.chunks_data = chunks_data


class EncodingEntry:
    def __init__(self, name: str, amount: int, compression: List[str]):
        self.name: str = name
        self.amount: int = amount
        self.compression: List[str] = compression


class ColumnEntry:
    def __init__(self, size: int, data_type: str, encoding: List[EncodingEntry]):
        self.size: int = size
        self.data_type: str = data_type
        self.encoding: List[EncodingEntry] = encoding


class TableData:
    def __init__(self, size: int, number_columns: int, data: Dict[str, ColumnEntry]):
        self.size: int = size
        self.number_columns: int = number_columns
        self.data: Dict[str, ColumnEntry] = data


class StorageData:
    """Defines a StorageData entity.

    Consists out of a TableData entity which consists out of
    a ColumnEntry entity which consists out of a EncodingEntry entity.
    """

    def __init__(self, id: str, storage: Dict[str, TableData]):
        self.id: str = id
        self.storage: Dict[str, TableData] = storage


class EncodingTypeEntry:
    def __init__(self, encoding_type: str):
        self.encoding_type: str = encoding_type


class OrderModeEntry:
    def __init__(self, order_mode: str):
        self.order_mode: str = order_mode


class SegmentConfigurationEntry:
    """Defines a SegmentConfigurationEntry entity.

    Consists out of a EncodingTypeEntry entity and OrderModeEntry entity.
    """

    def __init__(
        self,
        id: str,
        encoding_type: Dict[str, Dict[str, EncodingTypeEntry]],
        order_mode: Dict[str, Dict[str, OrderModeEntry]],
    ):
        self.id: str = id
        self.encoding_type: Dict[str, Dict[str, EncodingTypeEntry]] = encoding_type
        self.order_mode: Dict[str, Dict[str, OrderModeEntry]] = order_mode


class WorkloadStatementInformationEntry:
    def __init__(self, query_type: str, total_latency: int, total_frequency: int):
        self.query_type: str = query_type
        self.total_latency: int = total_latency
        self.total_frequency: int = total_frequency


class WorkloadStatementInformation:
    """Defines a WorkloadStatementInformation entity.

    Consists out of a WorkloadStatementInformationEntry entity.
    """

    def __init__(
        self,
        id: str,
        workload_statement_information: List[WorkloadStatementInformationEntry],
    ):
        self.id: str = id
        self.workload_statement_information: List[
            WorkloadStatementInformationEntry
        ] = workload_statement_information


class WorkloadOperatorInformationEntry:
    def __init__(self, operator: str, total_time_ns: int):
        self.operator: str = operator
        self.total_time_ns: int = total_time_ns


class WorkloadOperatorInformation:
    """Defines a WorkloadStatementInformation entity.

    Consists out of a WorkloadOperatorInformationEntry entity.
    """

    def __init__(
        self,
        id: str,
        workload_operator_information: List[WorkloadOperatorInformationEntry],
    ):
        self.id: str = id
        self.workload_operator_information: List[
            WorkloadOperatorInformationEntry
        ] = workload_operator_information

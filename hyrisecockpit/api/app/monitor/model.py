"""Model for metric namespace.

Models are python representation of entities.
"""

from typing import List


class FailedTaskEntry:
    def __init__(self, timestamp: int, worker_id: str, task: str, error: str):
        self.timestamp: int = timestamp
        self.worker_id: str = worker_id
        self.task: str = task
        self.error: str = error


class FailedTasks:
    def __init__(self, database_id: str, failed_task_entries: List[FailedTaskEntry]):
        self.id: str = database_id
        self.failed_task_entries: List[FailedTaskEntry] = failed_task_entries


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
    def __init__(self, database_id: str, system_data: List[SystemData]):
        self.database_id: str = database_id
        self.system_data: List[SystemData] = system_data
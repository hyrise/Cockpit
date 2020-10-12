from typing import Dict
from hyrisecockpit.api.app.monitor.schema import (
    FailedTaskEntrySchema,
    CpuSchema,
    MemorySchema,
    SystemDataEntrySchema,
    SystemDataSchema,
    SystemEntrySchema,
    ChunksEntrySchema,
)
from hyrisecockpit.api.app.monitor.model import (
    FailedTaskEntry,
    Cpu,
    Memory,
    SystemDataEntry,
    SystemData,
    SystemEntry,
    ChunksEntry,
)


class TestFailedTaskEntrySchema:
    def test_creates(self):
        assert FailedTaskEntrySchema()

    def test_serializes(self):
        timestamp = 123456789
        worker_id = "worker_01"
        task = "select * from foo;"
        error = "Table with name foo does not exist."
        failed_task_model = FailedTaskEntry(
            timestamp=timestamp,
            worker_id=worker_id,
            task=task,
            error=error,
        )

        serialized = FailedTaskEntrySchema().dump(failed_task_model)

        assert timestamp == failed_task_model.timestamp == serialized["timestamp"]
        assert worker_id == failed_task_model.worker_id == serialized["worker_id"]
        assert task == failed_task_model.task == serialized["task"]
        assert error == failed_task_model.error == serialized["error"]


class TestSystemSchema:
    def test_creates_cpu_schema(self):
        assert CpuSchema()

    def test_creates_memory_schema(self):
        assert MemorySchema()

    def test_creates_system_data_entry_schema(self):
        assert SystemDataEntrySchema()

    def test_creates_sytem_data_schema(self):
        assert SystemDataSchema()

    def test_creates_sytem_entry_schema(self):
        assert SystemEntrySchema()

    def test_serializes_cpu_schema(self):
        cpu_system_usage: float = 0.42
        cpu_process_usage: float = 0.12
        cpu_count: int = 32
        cpu_model: Cpu = Cpu(
            cpu_system_usage=cpu_system_usage,
            cpu_process_usage=cpu_process_usage,
            cpu_count=cpu_count,
        )

        serialized = CpuSchema().dump(cpu_model)

        assert cpu_system_usage == serialized["cpu_system_usage"]
        assert cpu_process_usage == serialized["cpu_process_usage"]
        assert cpu_count == serialized["cpu_count"]

    def test_serializes_memory_schema(self):
        free: int = 1234
        available: int = 6789
        total: int = 90000
        percent: float = 10.42
        memory_model: Memory = Memory(
            free=free, available=available, total=total, percent=percent
        )

        serialized = MemorySchema().dump(memory_model)

        assert free == serialized["free"]
        assert available == serialized["available"]
        assert total == serialized["total"]
        assert percent == serialized["percent"]

    def test_serializes_system_data_entry_schema(self):
        cpu_model = Cpu(cpu_system_usage=0.42, cpu_process_usage=0.42, cpu_count=16)
        memory_model = Memory(free=10, available=10, total=20, percent=10.2)
        database_threads: int = 10
        system_data_entry_model: SystemDataEntry = SystemDataEntry(
            cpu=cpu_model, memory=memory_model, database_threads=database_threads
        )

        serialized = SystemDataEntrySchema().dump(system_data_entry_model)

        assert database_threads == serialized["database_threads"]
        assert vars(cpu_model) == serialized["cpu"]
        assert vars(memory_model) == serialized["memory"]

    def test_serializes_system_data_schema(self):
        cpu_model = Cpu(cpu_system_usage=0.42, cpu_process_usage=0.42, cpu_count=16)
        memory_model = Memory(free=10, available=10, total=20, percent=10.2)
        database_threads: int = 10
        system_data_entry_model: SystemDataEntry = SystemDataEntry(
            cpu=cpu_model, memory=memory_model, database_threads=database_threads
        )
        timestamp: int = 42

        sytem_data_model: SystemData = SystemData(
            timestamp=timestamp, system_data_entry=system_data_entry_model
        )

        serialized = SystemDataSchema().dump(sytem_data_model)

        assert timestamp == serialized["timestamp"]
        assert vars(cpu_model) == serialized["system_data"]["cpu"]
        assert vars(memory_model) == serialized["system_data"]["memory"]

    def test_serializes_system_entry_schema(self):
        cpu_model = Cpu(cpu_system_usage=0.42, cpu_process_usage=0.42, cpu_count=16)
        memory_model = Memory(free=10, available=10, total=20, percent=10.2)
        database_threads: int = 10
        system_data_entry_model: SystemDataEntry = SystemDataEntry(
            cpu=cpu_model, memory=memory_model, database_threads=database_threads
        )
        timestamp: int = 42
        sytem_data_model: SystemData = SystemData(
            timestamp=timestamp, system_data_entry=system_data_entry_model
        )
        database_id: str = "database_one"

        system_entry_model: SystemEntry = SystemEntry(
            database_id=database_id, system_data=[sytem_data_model]
        )

        serialized = SystemEntrySchema().dump(system_entry_model)
        assert database_id == serialized["id"]
        assert timestamp == serialized["system_data"][0]["timestamp"]
        assert vars(cpu_model) == serialized["system_data"][0]["system_data"]["cpu"]
        assert (
            vars(memory_model) == serialized["system_data"][0]["system_data"]["memory"]
        )


class TestChunksSchema:
    database_id: str = "database_one"
    chunks_data: Dict = {
        "part_tpch_1": {
            "p_brand": [0, 0, 0, 0],
            "p_comment": [0, 0, 0, 0],
            "p_container": [0, 0, 0, 0],
        }
    }

    chunks_entry_model: ChunksEntry = ChunksEntry(
        database_id=database_id, chunks_data=chunks_data
    )

    serialized = ChunksEntrySchema().dump(chunks_entry_model)

    assert database_id == serialized["id"]
    assert chunks_data == serialized["chunks_data"]

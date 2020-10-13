from typing import Dict, List
from hyrisecockpit.api.app.monitor.schema import (
    FailedTaskEntrySchema,
    CpuSchema,
    MemorySchema,
    SystemDataEntrySchema,
    SystemDataSchema,
    SystemEntrySchema,
    ChunksEntrySchema,
    EncodingEntrySchema,
    ColumnEntrySchema,
    TableDataSchema,
    StorageDataEntrySchema,
    StorageDataSchema,
    EncodingTypeEntrySchema,
    OrderModeEntrySchema,
    SegmentConfigurationEntrySchema,
    WorkloadStatementInformationEntrySchema,
    WorkloadStatementInformationSchema,
    WorkloadOperatorInformationEntrySchema,
    WorkloadOperatorInformationSchema,
)
from hyrisecockpit.api.app.monitor.model import (
    FailedTaskEntry,
    Cpu,
    Memory,
    SystemDataEntry,
    SystemData,
    SystemEntry,
    ChunksEntry,
    EncodingEntry,
    ColumnEntry,
    TableData,
    StorageDataEntry,
    StorageData,
    EncodingTypeEntry,
    OrderModeEntry,
    SegmentConfigurationEntry,
    WorkloadStatementInformationEntry,
    WorkloadStatementInformation,
    WorkloadOperatorInformationEntry,
    WorkloadOperatorInformation,
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
    def test_serializes_chunks_schema(self):
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


class TestStorageSchema:
    def test_serializes_encoding_entry_schema(self):
        name: str = "Dictionary"
        amount: str = 1
        compression: List[str] = ["FixedSize2ByteAligned"]
        encoding_entry_model: EncodingEntry = EncodingEntry(
            name=name, amount=amount, compression=compression
        )

        serialized = EncodingEntrySchema().dump(encoding_entry_model)

        assert name == serialized["name"]
        assert amount == serialized["amount"]
        assert compression == serialized["compression"]

    def test_serializes_column_entry_schema(self):
        size: int = 89644
        data_type: str = "float"
        encoding: List[EncodingEntry] = [
            EncodingEntry(
                name="Dictionary", amount=1, compression=["FixedSize2ByteAligned"]
            )
        ]
        colums_entry_model: ColumnEntry = ColumnEntry(
            size=size, data_type=data_type, encoding=encoding
        )

        serialized = ColumnEntrySchema().dump(colums_entry_model)

        assert size == serialized["size"]
        assert data_type == serialized["data_type"]
        assert vars(encoding[0]) == serialized["encoding"][0]

    def test_serializes_table_data_schema(self):
        size: int = 4374976
        number_columns: int = 1
        encoding: List[EncodingEntry] = [
            EncodingEntry(
                name="Dictionary", amount=1, compression=["FixedSize2ByteAligned"]
            )
        ]
        colums_entry_model: ColumnEntry = ColumnEntry(
            size=89644, data_type="float", encoding=encoding
        )
        data: Dict[str, ColumnEntry] = {"c_acctbal": colums_entry_model}
        table_data_model: TableData = TableData(
            size=size, number_columns=number_columns, data=data
        )

        serialized = TableDataSchema().dump(table_data_model)

        assert size == serialized["size"]
        assert number_columns == serialized["number_columns"]
        assert vars(encoding[0]) == serialized["data"]["c_acctbal"]["encoding"][0]

    def test_serializes_storage_data_entry_schema(self):
        timestamp: str = 42
        encoding: List[EncodingEntry] = [
            EncodingEntry(
                name="Dictionary", amount=1, compression=["FixedSize2ByteAligned"]
            )
        ]
        colums_entry_model: ColumnEntry = ColumnEntry(
            size=89644, data_type="float", encoding=encoding
        )
        data: Dict[str, ColumnEntry] = {"c_acctbal": colums_entry_model}
        table_data_model: TableData = TableData(
            size=4374976, number_columns=1, data=data
        )
        storage_data_entry_model: StorageData = StorageDataEntry(
            timestamp=timestamp, table_data={"customer_tpch_0_1": table_data_model}
        )

        serialized = StorageDataEntrySchema().dump(storage_data_entry_model)

        assert timestamp == serialized["timestamp"]
        assert (
            vars(encoding[0])
            == serialized["table_data"]["customer_tpch_0_1"]["data"]["c_acctbal"][
                "encoding"
            ][0]
        )

    def test_serializes_storage_data_schema(self):
        timestamp: int = 42
        database_id: str = "some_db_id"
        encoding: List[EncodingEntry] = [
            EncodingEntry(
                name="Dictionary", amount=1, compression=["FixedSize2ByteAligned"]
            )
        ]
        colums_entry_model: ColumnEntry = ColumnEntry(
            size=89644, data_type="float", encoding=encoding
        )
        data: Dict[str, ColumnEntry] = {"c_acctbal": colums_entry_model}
        table_data_model: TableData = TableData(
            size=4374976, number_columns=1, data=data
        )
        storage_data_entry_model: StorageData = StorageDataEntry(
            timestamp=timestamp, table_data={"customer_tpch_0_1": table_data_model}
        )
        storage_data_model: StorageData = StorageData(
            database_id=database_id, storage=[storage_data_entry_model]
        )

        serialized = StorageDataSchema().dump(storage_data_model)

        assert database_id == serialized["id"]
        assert timestamp == serialized["storage"][0]["timestamp"]
        assert (
            vars(encoding[0])
            == serialized["storage"][0]["table_data"]["customer_tpch_0_1"]["data"][
                "c_acctbal"
            ]["encoding"][0]
        )

    def test_deserializes_encoding_entry_schema(self):
        name: str = "Dictionary"
        amount: str = 1
        compression: List[str] = ["FixedSize2ByteAligned"]
        encoding_entry_data = {
            "name": name,
            "amount": amount,
            "compression": compression,
        }

        deserialized = EncodingEntrySchema().load(encoding_entry_data)

        assert isinstance(deserialized, EncodingEntry)
        assert name == deserialized.name
        assert amount == deserialized.amount
        assert compression == deserialized.compression

    def test_deserializes_column_entry_schema(self):
        size: int = 89644
        data_type: str = "float"
        encoding_entry_data = {
            "name": "Dictionary",
            "amount": 1,
            "compression": ["FixedSize2ByteAligned"],
        }
        colums_entry_data = {
            "size": size,
            "data_type": data_type,
            "encoding": [encoding_entry_data],
        }

        deserialized = ColumnEntrySchema().load(colums_entry_data)

        assert isinstance(deserialized, ColumnEntry)
        assert isinstance(deserialized.encoding[0], EncodingEntry)
        assert size == deserialized.size
        assert data_type == deserialized.data_type

    def test_deserializes_table_data_schema(self):
        size: int = 4374976
        number_columns: int = 1
        encoding_entry_data = {
            "name": "Dictionary",
            "amount": 1,
            "compression": ["FixedSize2ByteAligned"],
        }
        colums_entry_data = {
            "size": 89644,
            "data_type": "float",
            "encoding": [encoding_entry_data],
        }
        data = {"c_acctbal": colums_entry_data}
        table_data = {
            "size": size,
            "number_columns": number_columns,
            "data": data,
        }

        deserialized = TableDataSchema().load(table_data)

        assert isinstance(deserialized, TableData)
        assert isinstance(deserialized.data["c_acctbal"], ColumnEntry)
        assert isinstance(deserialized.data["c_acctbal"].encoding[0], EncodingEntry)
        assert size == deserialized.size
        assert number_columns == deserialized.number_columns

    def test_deserializes_storage_data_entry_schema(self):
        timestamp: int = 42
        encoding_entry_data = {
            "name": "Dictionary",
            "amount": 1,
            "compression": ["FixedSize2ByteAligned"],
        }
        colums_entry_data = {
            "size": 89644,
            "data_type": "float",
            "encoding": [encoding_entry_data],
        }
        data = {"c_acctbal": colums_entry_data}
        table_data = {
            "size": 4374976,
            "number_columns": 1,
            "data": data,
        }
        storage_data_entry_data = {
            "timestamp": timestamp,
            "table_data": {"customer_tpch_0_1": table_data},
        }

        deserialized = StorageDataEntrySchema().load(storage_data_entry_data)

        assert isinstance(deserialized, StorageDataEntry)
        assert isinstance(deserialized.table_data["customer_tpch_0_1"], TableData)
        assert isinstance(
            deserialized.table_data["customer_tpch_0_1"].data["c_acctbal"], ColumnEntry
        )
        assert isinstance(
            deserialized.table_data["customer_tpch_0_1"].data["c_acctbal"].encoding[0],
            EncodingEntry,
        )
        assert timestamp == deserialized.timestamp


class TestSegmentConfigurationSchema:
    def test_serializes_encoding_type_entry_schema(self):
        encoding_type: str = "Dictionary"
        encoding_type_entry_model: EncodingTypeEntry = EncodingTypeEntry(
            encoding_type=encoding_type
        )

        serialized = EncodingTypeEntrySchema().dump(encoding_type_entry_model)

        assert encoding_type == serialized["encoding_type"]

    def test_serializes_order_mode_entry_schema(self):
        order_mode: str = "Ascending"
        order_mode_entry_model: OrderModeEntry = OrderModeEntry(order_mode=order_mode)

        serialized = OrderModeEntrySchema().dump(order_mode_entry_model)

        assert order_mode == serialized["order_mode"]

    def test_serializes_segment_configuration_enty(self):
        database_id: str = "some_db_id"
        encoding_entry_model: EncodingTypeEntry = EncodingTypeEntry(
            encoding_type="Dictionary"
        )
        order_mode_entry_model: OrderModeEntry = OrderModeEntry(order_mode="Ascending")
        encoding_type: Dict[str, Dict[str, EncodingEntry]] = {
            "customer_tpch_1": {"0": encoding_entry_model}
        }
        order_mode: Dict[str, Dict[str, OrderModeEntry]] = {
            "customer_tpch_1": {"0": order_mode_entry_model}
        }
        segment_configuration_entry: SegmentConfigurationEntry = (
            SegmentConfigurationEntry(
                id=database_id,
                encoding_type=encoding_type,
                order_mode=order_mode,
            )
        )

        serialized = SegmentConfigurationEntrySchema().dump(segment_configuration_entry)

        assert database_id == serialized["id"]
        assert (
            vars(encoding_entry_model)
            == serialized["encoding_type"]["customer_tpch_1"]["0"]
        )
        assert (
            vars(order_mode_entry_model)
            == serialized["order_mode"]["customer_tpch_1"]["0"]
        )


class TestWorkloadStatementInformationSchema:
    def test_serializes_workload_statement_information_enty(self) -> None:
        query_type: str = "SELECT"
        total_latency: int = 9568298895
        total_frequency: int = 1504
        workload_statement_information_entry_model: WorkloadStatementInformationEntry = WorkloadStatementInformationEntry(
            query_type=query_type,
            total_latency=total_latency,
            total_frequency=total_frequency,
        )

        serialized = WorkloadStatementInformationEntrySchema().dump(
            workload_statement_information_entry_model
        )

        assert query_type == serialized["query_type"]
        assert total_latency == serialized["total_latency"]
        assert total_frequency == serialized["total_frequency"]

    def test_serializes_workload_statement_information(self) -> None:
        database_id: str = "some_db_id"
        workload_statement_information_entry_model: WorkloadStatementInformationEntry = WorkloadStatementInformationEntry(
            query_type="SELECT", total_latency=9568298895, total_frequency=1504
        )
        workload_statement_information_model: WorkloadStatementInformation = (
            WorkloadStatementInformation(
                id=database_id,
                workload_statement_information_entries=[
                    workload_statement_information_entry_model
                ],
            )
        )
        serialized = WorkloadStatementInformationSchema().dump(
            workload_statement_information_model
        )

        assert database_id == serialized["id"]
        assert (
            vars(workload_statement_information_entry_model)
            == serialized["workload_statement_information_entries"][0]
        )

    def test_deserializes_workload_statement_information_enty(self) -> None:
        query_type: str = "SELECT"
        total_latency: int = 9568298895
        total_frequency: int = 1504
        workload_statement_information_entry_data: Dict = {
            "query_type": query_type,
            "total_latency": total_latency,
            "total_frequency": total_frequency,
        }

        deserialized = WorkloadStatementInformationEntrySchema().load(
            workload_statement_information_entry_data
        )

        assert isinstance(deserialized, WorkloadStatementInformationEntry)
        assert query_type == deserialized.query_type
        assert total_latency == deserialized.total_latency
        assert total_frequency == deserialized.total_frequency

    def test_deserializes_workload_statement_information(self) -> None:
        database_id: str = "some_db_id"
        query_type: str = "SELECT"
        total_latency: int = 9568298895
        total_frequency: int = 1504
        workload_statement_information_entry_data: Dict = {
            "query_type": query_type,
            "total_latency": total_latency,
            "total_frequency": total_frequency,
        }
        workload_statement_information_data = {
            "id": database_id,
            "workload_statement_information_entries": [
                workload_statement_information_entry_data
            ],
        }

        deserialized = WorkloadStatementInformationSchema().load(
            workload_statement_information_data
        )

        assert isinstance(deserialized, WorkloadStatementInformation)
        assert isinstance(
            deserialized.workload_statement_information_entries[0],
            WorkloadStatementInformationEntry,
        )
        assert database_id == deserialized.id


class TestWorkloadOperatorInformation:
    def test_serializes_workload_operator_information_enty(self) -> None:
        operator: str = "Alias"
        total_time_ns: int = 9568298895

        workload_operator_information_entry_model: WorkloadOperatorInformationEntry = (
            WorkloadOperatorInformationEntry(
                operator=operator,
                total_time_ns=total_time_ns,
            )
        )

        serialized = WorkloadOperatorInformationEntrySchema().dump(
            workload_operator_information_entry_model
        )

        assert operator == serialized["operator"]
        assert total_time_ns == serialized["total_time_ns"]

    def test_serializes_workload_operator_information(self) -> None:
        database_id: str = "some_db_id"
        workload_operator_information_entry_model: WorkloadOperatorInformationEntry = (
            WorkloadOperatorInformationEntry(operator="Alias", total_time_ns=9568298895)
        )

        workload_operator_information_model: WorkloadOperatorInformation = (
            WorkloadOperatorInformation(
                id=database_id,
                workload_operator_information=[
                    workload_operator_information_entry_model
                ],
            )
        )
        serialized = WorkloadOperatorInformationSchema().dump(
            workload_operator_information_model
        )

        assert database_id == serialized["id"]
        assert (
            vars(workload_operator_information_entry_model)
            == serialized["workload_operator_information"][0]
        )

    def test_deserializes_workload_statement_information_enty(self) -> None:
        operator: str = "Alias"
        total_time_ns: int = 9568298895
        workload_operator_information_entry_data: Dict = {
            "operator": operator,
            "total_time_ns": total_time_ns,
        }

        deserialized = WorkloadOperatorInformationEntrySchema().load(
            workload_operator_information_entry_data
        )

        assert isinstance(deserialized, WorkloadOperatorInformationEntry)
        assert operator == deserialized.operator
        assert total_time_ns == deserialized.total_time_ns

    def test_deserializes_workload_operator_information(self) -> None:
        database_id: str = "some_db_id"
        operator: str = "Alias"
        total_time_ns: int = 9568298895
        workload_operator_information_entry_data: Dict = {
            "operator": operator,
            "total_time_ns": total_time_ns,
        }
        workload_operator_information_data = {
            "id": database_id,
            "workload_operator_information": [workload_operator_information_entry_data],
        }

        deserialized = WorkloadOperatorInformationSchema().load(
            workload_operator_information_data
        )

        assert isinstance(deserialized, WorkloadOperatorInformation)
        assert isinstance(
            deserialized.workload_operator_information[0],
            WorkloadOperatorInformationEntry,
        )
        assert database_id == deserialized.id

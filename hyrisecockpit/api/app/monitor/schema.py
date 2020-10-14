"""Schema for monitor namespace.

A schema is responsible for the serialization/deserialization of a given entity.
An entity can be a response from the influxdb or the database manager. This response can
then be deserialized (load) into a python entity (model). On the other hand a python entity (model)
can be serialized (dump) to a JSON-encoded string.
For the deserialization, the post_load decorator is used.
For the schemas, we are using the marshmallow library.
The schemas are also used by the controller for documentation.
"""

from marshmallow import Schema, post_load
from marshmallow.fields import Integer, List, Nested, String, Float, Dict
from .model import (
    EncodingEntry,
    ColumnEntry,
    TableData,
    StorageData,
    EncodingTypeEntry,
    OrderModeEntry,
    SegmentConfigurationEntry,
    WorkloadStatementInformationEntry,
    WorkloadStatementInformation,
    WorkloadOperatorInformationEntry,
    WorkloadOperatorInformation,
)


class FailedTaskEntrySchema(Schema):
    timestamp = Integer(
        title="Timestamp",
        description="Timestamp in nanoseconds since epoch",
        required=True,
        example=1585762457000000000,
    )
    worker_id = String(
        title="Worker ID",
        description="Worker ID that failed to execute the task.",
        required=True,
        example="01",
    )
    task = String(
        title="Task",
        description="SQL query that failed to be executed.",
        required=True,
        example="Select * from foo;",
    )
    error = String(
        title="Error message",
        description="Error message from failed task.",
        required=True,
        example="Table with name foo does not exist.",
    )


class FailedTasksSchema(Schema):
    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    failed_queries = List(Nested(FailedTaskEntrySchema))


class CpuSchema(Schema):
    cpu_system_usage = Float(
        title="CPU system usage",
        description="CPU system usage in %",
        required=True,
        example=0.458248466,
    )
    cpu_process_usage = Float(
        title="CPU process usage",
        description="CPU process usage in %",
        required=True,
        example=10.8125,
    )
    cpu_count = Integer(
        title="Number CPUs",
        description="Number CPUs",
        required=True,
        example=16,
    )


class MemorySchema(Schema):
    free = Integer(
        title="Free memory",
        description="Number of free bytes",
        required=True,
        example=13030227968,
    )
    available = Integer(
        title="Available memory",
        description="Number of available bytes",
        required=True,
        example=579780000,
    )
    total = Integer(
        title="Total memory",
        description="Total number of memory bytes",
        required=True,
        example=33724911616,
    )
    percent = Float(
        title="Percent of available memory",
        description="Percent of available memory",
        required=True,
        example=10.8125,
    )


class SystemDataEntrySchema(Schema):
    cpu = Nested(CpuSchema)
    memory = Nested(MemorySchema)
    database_threads = Integer(
        title="Database threads",
        description="Number of database threads",
        required=True,
        example=16,
    )


class SystemDataSchema(Schema):
    timestamp = Integer(
        title="Timestamp",
        description="Timestamp in nanoseconds since epoch",
        required=True,
        example=1585762457000000000,
    )
    system_data = Nested(SystemDataEntrySchema)


class SystemEntrySchema(Schema):
    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    system_data = List(Nested(SystemDataSchema))


class ChunksEntrySchema(Schema):
    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    chunks_data = Dict(
        title="Chunks",
        description="Used to see chunk information.",
        key="Name of the Table.",
        value="Dictionary with chunks value for every column.",
        required=True,
        example="{ 'customer_tpch_1': { 'c_acctbal': [0, 0, 0] } }",
    )


class EncodingEntrySchema(Schema):
    name = String(
        title="Encoding name",
        required=True,
        example="Dictionary",
    )
    amount = Integer(
        title="Amount of compressions",
        required=True,
        example=1,
    )
    compression = List(
        String(title="Compression type", required=True, example="FixedSize2ByteAligned")
    )

    @post_load
    def make_encoding_entry(self, data, **kwargs):
        return EncodingEntry(**data)


class ColumnEntrySchema(Schema):
    size = Integer(
        title="Column size in bytes",
        required=True,
        example=975528,
    )
    data_type = String(
        title="Data type of column",
        required=True,
        example="string",
    )
    encoding = List(Nested(EncodingEntrySchema))

    @post_load
    def make_column_entry(self, data, **kwargs):
        return ColumnEntry(**data)


class TableDataSchema(Schema):
    size = Integer(
        title="Data size",
        required=True,
        example=4374976,
    )
    number_columns = Integer(
        title="Column number",
        required=True,
        example=10,
    )
    data = Dict(String(title="Data storage information"), Nested(ColumnEntrySchema))

    @post_load
    def make_table_data(self, data, **kwargs):
        return TableData(**data)


class StorageDataSchema(Schema):
    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    storage = Dict(String(title="Table name"), Nested(TableDataSchema))

    @post_load
    def make_storage_data_entry(self, data, **kwargs):
        return StorageData(**data)


class EncodingTypeEntrySchema(Schema):
    encoding_type = String(
        title="Encoding type",
        description="Encoding type of chunk",
        required=True,
        example="Dictionary",
    )

    @post_load
    def make_encoding_type_entry(self, data, **kwargs):
        return EncodingTypeEntry(**data)


class OrderModeEntrySchema(Schema):
    order_mode = String(
        title="Order mode",
        description="Order mode of chunk",
        required=True,
        example="Ascending",
    )

    @post_load
    def make_order_mode_entry(self, data, **kwargs):
        return OrderModeEntry(**data)


class SegmentConfigurationEntrySchema(Schema):
    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    encoding_type = Dict(
        String(title="Table name"),
        Dict(String(title="Chunk ID"), Nested(EncodingTypeEntrySchema)),
    )
    order_mode = Dict(
        String(title="Table name"),
        Dict(String(title="Chunk ID"), Nested(OrderModeEntrySchema)),
    )

    @post_load
    def make_segment_configuration_enty(self, data, **kwargs):
        return SegmentConfigurationEntry(**data)


class WorkloadStatementInformationEntrySchema(Schema):
    query_type = String(
        title="Query type",
        required=True,
        example="SELECT",
    )
    total_latency = Integer(
        title="Total latency",
        required=True,
        example=123456,
    )
    total_frequency = Integer(
        title="Total frequency",
        required=True,
        example=4321,
    )

    @post_load
    def make_workload_statement_information_enty(self, data, **kwargs):
        return WorkloadStatementInformationEntry(**data)


class WorkloadStatementInformationSchema(Schema):
    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    workload_statement_information = List(
        Nested(WorkloadStatementInformationEntrySchema)
    )

    @post_load
    def make_workload_statement_information(self, data, **kwargs):
        return WorkloadStatementInformation(**data)


class WorkloadOperatorInformationEntrySchema(Schema):
    operator = String(
        title="Operator",
        required=True,
        example="Alias",
    )
    total_time_ns = Integer(
        title="Total time ns",
        required=True,
        example=123456,
    )

    @post_load
    def make_workload_operator_information_enty(self, data, **kwargs):
        return WorkloadOperatorInformationEntry(**data)


class WorkloadOperatorInformationSchema(Schema):
    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    workload_operator_information = List(Nested(WorkloadOperatorInformationEntrySchema))

    @post_load
    def make_workload_operator_information(self, data, **kwargs):
        return WorkloadOperatorInformation(**data)

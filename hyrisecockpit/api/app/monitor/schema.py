"""Schema for monitor namespace.

A schemas represents the serialization/deserialization of entities.
Entities are defined in models.py .
"""

from marshmallow import Schema
from marshmallow.fields import Integer, List, Nested, String, Float, Dict


class FailedTaskEntrySchema(Schema):
    """Schema of a failed Task Entry."""

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
    """Schema of a failed Task Entry."""

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


class StorageDataEntrySchema(Schema):
    timestamp = Integer(
        title="Timestamp",
        description="Timestamp in nanoseconds since epoch",
        required=True,
        example=1585762457000000000,
    )
    table_data = Nested(TableDataSchema)


class StorageDataSchema(Schema):
    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    storage = List(Nested(StorageDataEntrySchema))

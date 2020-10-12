"""Schema for monitor namespace.

A schemas represents the serialization/deserialization of entities.
Entities are defined in models.py .
"""

from marshmallow import Schema
from marshmallow.fields import Integer, List, Nested, String, Float


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

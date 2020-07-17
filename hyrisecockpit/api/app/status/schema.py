"""Schema's for status module."""

from marshmallow import Schema
from marshmallow.fields import Boolean, List, Nested, String


class DatabaseStatusSchema(Schema):
    """Schema of a database object."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    database_blocked_status = Boolean(
        title="Database blocked status",
        description="Database blocked status of databases.",
        required=True,
        example=True,
    )
    worker_pool_status = String(
        title="Worker pool status",
        description="Status of the worker pools of the databases.",
        required=True,
        example="running",
    )
    hyrise_active = Boolean(
        title="hyrise active status",
        description="Hyrise is reachable.",
        required=True,
        example=True,
    )


class BenchmarkStatusSchema(Schema):
    """Schema of a benchmark status object."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    loaded_benchmarks = List(
        String(
            title="Benchmark",
            description="Benchmark dataset that is completely loaded.",
            required=True,
            example="tpch_1",
        )
    )
    loaded_tables = List(
        String(
            title="table_name",
            description="Name of loaded table.",
            required=True,
            example="orders_tpch_0_1",
        )
    )


class FailedQuerySchema(Schema):
    """Schema of a failed query."""

    time = String(
        title="Time stamp",
        description="Time when query failed.",
        required=True,
        example="2020-05-19T11:57:25.051343Z",
    )
    worker_id = String(
        title="Worker ID",
        description="Used to identify a worker.",
        required=True,
        example="2",
    )
    task = String(
        title="Query",
        description="Query that failed.",
        required=True,
        example="SELECT takatuka from land;",
    )
    error = String(
        title="Error message",
        description="Error message of failed query.",
        required=True,
        example="No table found.",
    )


class FailedTaskSchema(Schema):
    """Schema of a Failed task."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    failed_queries = List(Nested(FailedQuerySchema))

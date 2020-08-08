"""Schema's for status module."""

from marshmallow import Schema
from marshmallow.fields import Boolean, Dict, Float, List, Nested, String


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


class TablesStatusSchema(Schema):
    """Schema of a table status object."""

    workload_type = String(
        title="Workload type",
        description="Workload type dataset that is completely loaded.",
        required=True,
        example="tpch",
    )
    scale_factor = Float(
        title="Scale factor of tables",
        description="Scale factor of tables for workload type.",
        required=True,
        example=1.0,
    )
    loaded_tables = List(
        String(
            title="Table name",
            description="Name of loaded table.",
            required=True,
            example="orders",
        )
    )
    missing_tables = List(
        String(
            title="Table name",
            description="Name of missing table.",
            required=True,
            example="orders",
        )
    )
    completely_loaded = Boolean(
        title="Completely loaded",
        description="All tables for workload are completely loaded in database.",
        required=True,
        example=True,
    )
    database_representation = Dict(
        keys=String(description="Name of table."),
        values=String(description="Name of table representation in database."),
        description="Mapping between table names and their names in database.",
    )


class WorkloadTablesStatusSchema(Schema):
    """Schema of a workload tables status object."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    workload_tables_status = List(Nested(TablesStatusSchema))


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

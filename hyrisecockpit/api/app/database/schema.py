"""Schema for database name-space."""

from marshmallow import Schema, post_load
from marshmallow.fields import Float, Integer, List, Nested, String

from hyrisecockpit.api.app.database.model import (
    AvailableWorkloadTables,
    Database,
    DetailedDatabase,
    WorkloadTables,
)


class DatabaseSchema(Schema):
    """Schema of a Database."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )

    @post_load
    def make_database(self, data, **kwargs):
        """Return database object."""
        return Database(**data)


class DetailedDatabaseSchema(Schema):
    """Schema of a detailed Database."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    host = String(
        title="Host",
        description="Host to log in to.",
        required=True,
        example="vm.example.com",
    )
    port = String(
        title="Port",
        description="Port of the host to log in to.",
        required=True,
        example="1234",
    )
    number_workers = Integer(
        title="Number of initial database worker processes.",
        description="",
        required=True,
        example=8,
    )
    dbname = String(
        title="",
        description="Name of the database to log in to.",
        required=True,
        example="mydb",
    )
    user = String(
        title="Username",
        description="Username used to log in.",
        required=True,
        example="user123",
    )
    password = String(
        title="Password",
        description="Password used to log in.",
        required=True,
        example="password123",
    )

    @post_load
    def make_detailed_database(self, data, **kwargs):
        """Return detailed database object."""
        return DetailedDatabase(**data)


class WorkloadTablesSchema(Schema):
    """Schema of loading workload tables."""

    workload_type = String(
        title="Workload type",
        description="Name of the workload type that includes all needed tables.",
        required=True,
        example="tpch",
    )
    scale_factor = Float(
        title="Scale factor of tables",
        description="Scale factor of tables for workload type.",
        required=True,
        example=1.0,
    )

    @post_load
    def make_benchmark_tables(self, data, **kwargs):
        """Return available benchmark tables object."""
        return WorkloadTables(**data)


class AvailableWorkloadTablesSchema(Schema):
    """Schema of available workload tables."""

    workload_tables = List(Nested(WorkloadTablesSchema))

    @post_load
    def make_available_benchmark_tables(self, data, **kwargs):
        """Return available benchmark tables object."""
        return AvailableWorkloadTables(**data)

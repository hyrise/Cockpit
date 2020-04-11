"""Schema for database name-space."""

from marshmallow import Schema, post_load
from marshmallow.fields import Integer, List, String

from hyrisecockpit.api.app.database.model import (
    AvailableBenchmarkTables,
    Database,
    DetailedDatabase,
)


class DatabaseSchmea(Schema):
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


class AvailableBenchmarkTablesSchema(Schema):
    """Schema of available benchmark tables."""

    folder_names = List(
        String(
            title="Folder name",
            description="Name of the folder containing the pregenerated tables.",
            required=True,
            example="tpch_0.1",
        )
    )

    @post_load
    def make_available_benchmark_tables(self, data, **kwargs):
        """Return available benchmark tables object."""
        return AvailableBenchmarkTables(**data)


class BenchmarkTablesSchema(Schema):
    """Schema of loading benchmark tables."""

    folder_name = String(
        title="Folder name",
        description="Name of the folder that includes all benchmark tables.",
        required=True,
        example="tpch_0.1",
    )

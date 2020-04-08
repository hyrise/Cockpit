"""Schema for control name-space."""

from marshmallow import Schema
from marshmallow.fields import Integer, List, String


class DatabaseSchmea(Schema):
    """Schema of a Database."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )


class DetailedDatabaseSchema(DatabaseSchmea):
    """Schema of a detailed Database."""

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


class AvailableBenchmarkTablesSchema(Schema):
    """Schema of Data."""

    folder_names = List(
        String(
            title="Folder name",
            description="Name of the folder containing the pregenerated tables.",
            required=True,
            example="tpch_0.1",
        )
    )

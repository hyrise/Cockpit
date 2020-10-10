"""Schema for monitor namespace.

A schemas represents the serialization/deserialization of entities.
Entities are defined in models.py .
"""

from marshmallow import Schema
from marshmallow.fields import Integer, List, Nested, String


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

"""Schema's for status module."""

from marshmallow import Schema
from marshmallow.fields import List, Nested, String


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

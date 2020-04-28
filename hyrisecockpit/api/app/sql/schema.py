"""Schemas for SQL module."""
from marshmallow import Schema, post_load
from marshmallow.fields import Bool, List, String

from .model import SqlQuery, SqlResponse


class SqlQuerySchema(Schema):
    """Schema of a SQL query."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    query = String(
        title="SQL query",
        description="Sql query to execute on database.",
        required=True,
        example="SELECT 1;",
    )

    @post_load
    def make_sql_query(self, data, **kwargs):
        """Return SqlQuery object."""
        return SqlQuery(**data)


class SqlResponseSchema(Schema):
    """Schema of a SQL response."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    successful = Bool(
        title="Successful flag",
        description="Use to indicate whether query succeeded or not.",
        required=True,
        example=True,
    )
    results = List(
        List(String()),
        title="Results",
        description="Results from query execution.",
        required=True,
        example=[["1", "100", "first"], ["2", "None", "second"], ["3", "42", "third"]],
    )
    col_names = List(
        String(),
        title="Column names",
        description="List of column names.",
        required=True,
        example=["first_column", "second_column", "third_column"],
    )

    error_message = String(
        title="Error message",
        description="Error message if query execution wasn't successful.",
        required=True,
        example="Table not found",
    )

    @post_load
    def make_sql_query(self, data, **kwargs):
        """Return SqlResponse object."""
        return SqlResponse(**data)

"""Tests for sql schemas."""

from typing import Dict

from pytest import mark

from hyrisecockpit.api.app.sql.interface import SqlQueryInterface, SqlResponseInterface
from hyrisecockpit.api.app.sql.model import SqlQuery, SqlResponse
from hyrisecockpit.api.app.sql.schema import SqlQuerySchema, SqlResponseSchema


class TestSchema:
    """Tests for sql schemas."""

    def test_creates_sql_query_schema(self) -> None:
        """A sql query shema can be created."""
        assert SqlQuerySchema()

    def test_deserializes_sql_query_schema(self) -> None:
        """A sql query shema can create a sql query model."""
        sql_query_schema: SqlQuerySchema = SqlQuerySchema()
        interface: SqlQueryInterface = {"id": "What's up", "query": "All good"}
        sql_query_model: SqlQuery = sql_query_schema.load(interface)

        assert isinstance(sql_query_model, SqlQuery)
        assert sql_query_model.id == interface["id"]
        assert sql_query_model.query == interface["query"]

    def test_serializes_sql_query(self) -> None:
        """A sql query can be serialized with a sql query schema."""
        sql_query_schema: SqlQuerySchema = SqlQuerySchema()
        interface: SqlQueryInterface = {"id": "What's up", "query": "All good"}
        sql_query_model: SqlQuery = SqlQuery(**interface)
        serialized: SqlQueryInterface = sql_query_schema.dump(sql_query_model)

        assert interface == serialized

    def test_creates_sql_response_schema(self) -> None:
        """A sql response shema can be created."""
        assert SqlResponseSchema()

    @mark.parametrize(
        "attribute",
        [
            {
                "id": "Australia",
                "successful": True,
                "results": [["vegemite", "timtam"], ["Vb", "Frosters"]],
                "col_names": ["col_name_1", "col_name_2"],
                "error_message": "",
            },
            {
                "id": "hyrise",
                "successful": False,
                "results": [],
                "col_names": [],
                "error_message": "not running",
            },
        ],
    )
    def test_deserializes_sql_response_schema(self, attribute: Dict) -> None:
        """A sql response shema can create a sql response model."""
        sql_response_schema: SqlResponseSchema = SqlResponseSchema()
        sql_response_model: SqlResponse = sql_response_schema.load(attribute)

        assert isinstance(sql_response_model, SqlResponse)
        assert sql_response_model.id == attribute["id"]
        assert sql_response_model.successful == attribute["successful"]
        assert sql_response_model.results == attribute["results"]
        assert sql_response_model.col_names == attribute["col_names"]
        assert sql_response_model.error_message == attribute["error_message"]

    @mark.parametrize(
        "attribute",
        [
            {
                "id": "Australia",
                "successful": True,
                "results": [["vegemite", "timtam"], ["Vb", "Frosters"]],
                "col_names": ["col_name_1", "col_name_2"],
                "error_message": "",
            },
            {
                "id": "hyrise",
                "successful": False,
                "results": [],
                "col_names": [],
                "error_message": "not running",
            },
        ],
    )
    def test_serializes_sql_response(self, attribute: Dict) -> None:
        """A sql query can be serialized with a sql query schema."""
        sql_response_schema: SqlResponseSchema = SqlResponseSchema()
        sql_response_model: SqlResponse = SqlResponse(**attribute)
        serialized: SqlResponseInterface = sql_response_schema.dump(sql_response_model)

        assert attribute == serialized

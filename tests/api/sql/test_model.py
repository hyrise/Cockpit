"""Tets for sql models."""

from typing import Dict

from pytest import mark

from hyrisecockpit.api.app.sql.interface import SqlQueryInterface, SqlResponseInterface
from hyrisecockpit.api.app.sql.model import SqlQuery, SqlResponse


class TestSqlModel:
    """Tests for sql models."""

    def test_creates_sql_query(self) -> None:
        """A sql query model can be created."""
        assert SqlQuery(id="Bibi", query="Tina")

    def test_updates_sql_query(self) -> None:
        """A sql query model can be updated."""
        sql_query: SqlQuery = SqlQuery(id="Bibi", query="Tina")
        sql_query.update(
            SqlQueryInterface(id="Graf Falco", query="Sophia von Gelenberg")
        )

        assert sql_query.id == "Graf Falco"
        assert sql_query.query == "Sophia von Gelenberg"

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
    def test_creates_sql_response(self, attribute: Dict) -> None:
        """A sql query response model can be created."""
        assert SqlResponse(
            id=attribute["id"],
            successful=attribute["successful"],
            results=attribute["results"],
            col_names=attribute["col_names"],
            error_message=attribute["error_message"],
        )

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
    def test_updates_sql_response(self, attribute: Dict) -> None:
        """A sql query response model can be updated."""
        sql_response: SqlResponse = SqlResponse(
            id="id",
            successful=True,
            results=[["some reults"]],
            col_names=["col_names"],
            error_message="help",
        )

        interface: SqlResponseInterface = SqlResponseInterface(
            id=attribute["id"],
            successful=attribute["successful"],
            results=attribute["results"],
            col_names=attribute["col_names"],
            error_message=attribute["error_message"],
        )

        sql_response.update(interface)

        assert sql_response.id == attribute["id"]
        assert sql_response.successful == attribute["successful"]
        assert sql_response.results == attribute["results"]
        assert sql_response.col_names == attribute["col_names"]
        assert sql_response.error_message == attribute["error_message"]

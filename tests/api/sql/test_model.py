"""Tets for sql models."""

from typing import Dict

from pytest import mark

from hyrisecockpit.api.app.sql.model import SqlQuery, SqlResponse


class TestSqlModel:
    """Tests for sql models."""

    def test_creates_sql_query(self) -> None:
        """A sql query model can be created."""
        assert SqlQuery(id="Bibi", query="Tina")

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

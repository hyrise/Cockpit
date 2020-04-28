"""Tests for the SQL interface."""
from typing import Dict

from pytest import mark

from hyrisecockpit.api.app.sql.interface import SqlQueryInterface, SqlResponseInterface
from hyrisecockpit.api.app.sql.model import SqlQuery, SqlResponse


class TestSqlInterface:
    """Tests for the sql namespace interfaces."""

    @mark.parametrize(
        "attribute",
        [
            {"id": "Blockus", "query": "kaltius"},
            {"id": "Desmordi", "query": "allihautprod"},
        ],
    )
    def test_creates_sql_query_interface(self, attribute: Dict) -> None:
        """A sql query interface can be created."""
        assert SqlQueryInterface(id=attribute["id"], query=attribute["query"])

    @mark.parametrize(
        "attribute",
        [
            {"id": "Blockus", "query": "kaltius"},
            {"id": "Desmordi", "query": "allihautprod"},
        ],
    )
    def test_create_sql_query_from_interface(self, attribute: Dict) -> None:
        """A sql query model can be created from the interface."""
        interface: SqlQueryInterface = SqlQueryInterface(
            id=attribute["id"], query=attribute["query"]
        )
        assert SqlQuery(**interface)

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
    def test_creates_sql_response_interface(self, attribute: Dict) -> None:
        """A sql response interface can be created."""
        assert SqlResponseInterface(
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
    def test_create_sql_response_from_interface(self, attribute: Dict) -> None:
        """A sql response interface can be created."""
        interface: SqlResponseInterface = SqlResponseInterface(
            id=attribute["id"],
            successful=attribute["successful"],
            results=attribute["results"],
            col_names=attribute["col_names"],
            error_message=attribute["error_message"],
        )
        assert SqlResponse(**interface)

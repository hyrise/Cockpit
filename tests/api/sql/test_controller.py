"""Tests for the sql controller."""
from json import dumps
from unittest.mock import MagicMock, patch

from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture

from hyrisecockpit.api.app import create_app
from hyrisecockpit.api.app.sql import BASE_ROUTE
from hyrisecockpit.api.app.sql.model import SqlResponse

url = f"/{BASE_ROUTE}/"


@fixture
def app() -> Flask:
    """Return a testing app."""
    app = create_app()
    app.testing = True
    return app


@fixture
def client(app: Flask) -> FlaskClient:
    """Return a test client."""
    with app.test_client() as client:
        return client


class TestController:
    """Tests for the sql controller."""

    @patch("hyrisecockpit.api.app.sql.controller.SqlService")
    def test_successful_executes_sql_query(
        self, mocked_sql_service: MagicMock, client: FlaskClient
    ) -> None:
        """A sql controller routes post correctly."""
        query = {"id": "hyrise_1", "query": "hallo"}
        sql_response = {
            "id": "Australia",
            "successful": True,
            "results": [["vegemite", "timtam"], ["Vb", "Frosters"]],
            "col_names": ["col_name_1", "col_name_2"],
            "error_message": "",
        }
        mocked_sql_service.execute_sql.return_value = (SqlResponse(**sql_response), 200)  # type: ignore
        response = client.post(
            url,
            follow_redirects=True,
            data=dumps(query),
            content_type="application/json",
        )
        mocked_sql_service.execute_sql.assert_called_once_with(
            {"id": "hyrise_1", "query": "hallo"}
        )
        assert sql_response == response.get_json()
        assert 200 == response.status_code

    @patch("hyrisecockpit.api.app.sql.controller.SqlService")
    def test_unsuccessful_executes_sql_query(
        self, mocked_sql_service: MagicMock, client: FlaskClient
    ) -> None:
        """A sql controller routes post correctly with unsuccessful sql query."""
        query = {"id": "hyrise_1", "query": "hallo"}
        mocked_sql_service.execute_sql.return_value = (None, 404)
        response = client.post(
            url,
            follow_redirects=True,
            data=dumps(query),
            content_type="application/json",
        )
        mocked_sql_service.execute_sql.assert_called_once_with(
            {"id": "hyrise_1", "query": "hallo"}
        )
        assert response.get_json() is None
        assert 404 == response.status_code

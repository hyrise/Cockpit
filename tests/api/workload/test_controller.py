"""Tests for the Workload controller."""

from json import dumps
from unittest.mock import patch

from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture

from hyrisecockpit.api.app import create_app
from hyrisecockpit.api.app.workload import BASE_ROUTE
from hyrisecockpit.api.app.workload.interface import WorkloadInterface
from hyrisecockpit.api.app.workload.model import Workload
from hyrisecockpit.api.app.workload.schema import WorkloadSchema
from hyrisecockpit.api.app.workload.service import WorkloadService

url = f"/api/{BASE_ROUTE}"


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


class TestWorkloadController:
    """Tests for the Workload controller."""

    @patch.object(
        WorkloadService,
        "get_all",
        lambda: [
            Workload("workload0", "tpch_0.1", 420),
            Workload("workload1", "tpch_0.1", 420),
        ],
    )
    def test_get_all_works(self, client: FlaskClient):
        """A Workload controller routes get_all correctly."""
        results = client.get(url, follow_redirects=True).get_json()
        expected = WorkloadSchema(many=True).dump(
            [
                Workload("workload0", "tpch_0.1", 420),
                Workload("workload1", "tpch_0.1", 420),
            ]
        )
        assert expected == results

    @patch.object(WorkloadService, "create", lambda interface: Workload(**interface))
    def test_create_works(self, client: FlaskClient):
        """A Workload controller routes create correctly."""
        data = WorkloadInterface(
            workload_id="workload0", folder_name="tpch_0.1", frequency=420
        )
        results = client.post(
            url,
            follow_redirects=True,
            data=dumps(data),
            content_type="application/json",
        ).get_json()
        expected = WorkloadSchema().load(data)
        assert expected == results

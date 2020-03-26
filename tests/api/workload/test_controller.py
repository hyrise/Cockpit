"""Tests for the Workload controller."""

from json import dumps
from typing import List
from unittest.mock import patch

from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture, mark

from hyrisecockpit.api.app import create_app
from hyrisecockpit.api.app.workload import BASE_ROUTE
from hyrisecockpit.api.app.workload.interface import WorkloadInterface
from hyrisecockpit.api.app.workload.model import Workload
from hyrisecockpit.api.app.workload.schema import WorkloadSchema
from hyrisecockpit.api.app.workload.service import WorkloadService

url = f"/api/{BASE_ROUTE}"

interfaces: List[WorkloadInterface] = [
    WorkloadInterface(workload_id="workload0", folder_name="tpch_0.1", frequency=420),
    WorkloadInterface(workload_id="workload1", folder_name="tpcds_1", frequency=210),
    WorkloadInterface(workload_id="workload2", folder_name="job", frequency=0),
]

workloads: List[Workload] = [Workload(**interface) for interface in interfaces]


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
        WorkloadService, "get_all", lambda: workloads,
    )
    def test_get_all_works(self, client: FlaskClient):
        """A Workload controller routes get_all correctly."""
        response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert WorkloadSchema(many=True).dump(workloads) == response.get_json()

    @mark.parametrize("interface", interfaces)
    @patch.object(WorkloadService, "create", lambda interface: Workload(**interface))
    def test_create_works(self, client: FlaskClient, interface: WorkloadInterface):
        """A Workload controller routes create correctly."""
        response = client.post(
            url,
            follow_redirects=True,
            data=dumps(interface),
            content_type="application/json",
        )
        assert 200 == response.status_code
        assert WorkloadSchema().load(interface) == response.get_json()

"""Tests for the Workload controller."""

from json import dumps
from typing import List, Optional
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

bad_id = "id_that_will_fail"


def create_workload(interface: WorkloadInterface) -> Optional[Workload]:
    """Create a Workload with the given arguments."""
    if interface["workload_id"] == bad_id:
        return None
    else:
        return Workload(**interface)


def get_workload_by_id(id: str) -> Optional[Workload]:
    """Return the Workload with the id."""
    try:
        return [w for w in workloads if w.workload_id == id].pop()
    except IndexError:
        return None


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
    def test_gets_all_workloads(self, client: FlaskClient):
        """A Workload controller routes get_all correctly."""
        response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert WorkloadSchema(many=True).dump(workloads) == response.get_json()

    @patch.object(
        WorkloadService, "get_all", lambda: [],
    )
    def test_gets_no_workloads_if_there_are_none(self, client: FlaskClient):
        """A Workload controller routes get_all correctly."""
        response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert WorkloadSchema(many=True).dump([]) == response.get_json()

    @mark.parametrize("interface", interfaces)
    @patch.object(WorkloadService, "create", create_workload)
    def test_creates_a_workload(
        self, client: FlaskClient, interface: WorkloadInterface
    ):
        """A Workload controller routes create correctly."""
        response = client.post(
            url,
            follow_redirects=True,
            data=dumps(interface),
            content_type="application/json",
        )
        assert 200 == response.status_code
        assert WorkloadSchema().load(interface) == response.get_json()

    @mark.parametrize("interface", interfaces)
    @patch.object(WorkloadService, "create", create_workload)
    def test_creates_no_workload_if_it_already_exists(
        self, client: FlaskClient, interface: WorkloadInterface
    ):
        """A Workload controller routes create correctly."""
        interface["workload_id"] = bad_id
        response = client.post(
            url,
            follow_redirects=True,
            data=dumps(interface),
            content_type="application/json",
        )
        assert 409 == response.status_code
        assert not response.is_json


class TestWorkloadIdController:
    """Tests for the WorkloadId controller."""

    @mark.parametrize("id", [w.workload_id for w in workloads])
    @patch.object(
        WorkloadService, "get_by_id", get_workload_by_id,
    )
    def test_gets_the_correct_workload(self, client: FlaskClient, id: str):
        """A WorkloadId controller routes get correctly."""
        response = client.get(url + f"/{id}", follow_redirects=True)
        assert 200 == response.status_code
        assert WorkloadSchema().dump(get_workload_by_id(id)) == response.get_json()

    @mark.parametrize("id", [bad_id])
    @patch.object(
        WorkloadService, "get_by_id", get_workload_by_id,
    )
    def test_gets_no_workload_if_it_cannot_be_found(self, client: FlaskClient, id: str):
        """A WorkloadId controller routes get correctly."""
        response = client.get(url + f"/{id}", follow_redirects=True)
        assert 404 == response.status_code
        assert not response.is_json

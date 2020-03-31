"""Tests for the Workload controller."""

from json import dumps
from typing import Optional
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

from .data import interfaces, workload_ids, workloads

url = f"/{BASE_ROUTE}"

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
        return [w for w in workloads() if w.workload_id == id].pop()
    except IndexError:
        return None


def delete_workload_by_id(id: str) -> Optional[str]:
    """Return the workload_id of the deleted Workload."""
    return None if id == bad_id else id


def update_workload_by_id(id: str, interface: WorkloadInterface) -> Optional[Workload]:
    """Return the updated Workload."""
    workload = get_workload_by_id(id)
    if workload is None:
        return None
    return workload.update(interface)


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
        WorkloadService, "get_all", workloads,
    )
    def test_gets_all_workloads(self, client: FlaskClient):
        """A Workload controller routes get_all correctly."""
        response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert WorkloadSchema(many=True).dump(workloads()) == response.get_json()

    @patch.object(
        WorkloadService, "get_all", lambda: [],
    )
    def test_gets_no_workloads_if_there_are_none(self, client: FlaskClient):
        """A Workload controller routes get_all correctly."""
        response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert WorkloadSchema(many=True).dump([]) == response.get_json()

    @mark.parametrize("interface", interfaces())
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

    @mark.parametrize("interface", interfaces())
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

    @mark.parametrize("id", workload_ids())
    @patch.object(
        WorkloadService, "get_by_id", get_workload_by_id,
    )
    def test_gets_the_correct_workload(self, client: FlaskClient, id: str):
        """A WorkloadId controller routes get correctly."""
        response = client.get(url + f"/{id}", follow_redirects=True)
        assert 200 == response.status_code
        assert WorkloadSchema().dump(get_workload_by_id(id)) == response.get_json()

    @patch.object(
        WorkloadService, "get_by_id", get_workload_by_id,
    )
    def test_gets_no_workload_if_it_cannot_be_found(
        self, client: FlaskClient, id: str = bad_id
    ):
        """A WorkloadId controller routes get correctly."""
        response = client.get(url + f"/{id}", follow_redirects=True)
        assert 404 == response.status_code
        assert not response.is_json

    @mark.parametrize("id", workload_ids())
    @patch.object(
        WorkloadService, "delete_by_id", delete_workload_by_id,
    )
    def test_deletes_the_correct_workload(self, client: FlaskClient, id: str):
        """A WorkloadId controller routes delete correctly."""
        response = client.delete(url + f"/{id}", follow_redirects=True)
        assert 200 == response.status_code
        assert not response.is_json

    @patch.object(
        WorkloadService, "delete_by_id", delete_workload_by_id,
    )
    def test_deletes_no_workload_if_it_cannot_be_found(
        self, client: FlaskClient, id: str = bad_id
    ):
        """A WorkloadId controller routes delete correctly."""
        response = client.delete(url + f"/{id}", follow_redirects=True)
        assert 404 == response.status_code
        assert not response.is_json

    @mark.parametrize("interface", interfaces())
    @patch.object(
        WorkloadService, "update_by_id", update_workload_by_id,
    )
    @patch.object(
        WorkloadService, "get_by_id", get_workload_by_id,
    )
    def test_updates_the_correct_workload(
        self, client: FlaskClient, interface: WorkloadInterface
    ):
        """A WorkloadId controller routes update correctly."""
        id = interface["workload_id"]
        new_interface = WorkloadInterface(
            workload_id=id,
            folder_name=interface["folder_name"],
            frequency=interface["frequency"] * 10,
        )
        response_before = client.get(url + f"/{id}", follow_redirects=True)
        assert 200 == response_before.status_code
        assert WorkloadSchema().load(interface) == response_before.get_json()
        response_after = client.put(
            url + f"/{id}",
            data=dumps(new_interface),
            content_type="application/json",
            follow_redirects=True,
        )
        assert 200 == response_after.status_code
        assert WorkloadSchema().load(new_interface) == response_after.get_json()

    @mark.parametrize("interface", interfaces())
    @patch.object(
        WorkloadService, "update_by_id", update_workload_by_id,
    )
    def test_updates_no_workload_if_it_cannot_be_found(
        self, client: FlaskClient, interface: WorkloadInterface
    ):
        """A WorkloadId controller routes update correctly."""
        id = bad_id
        response = client.put(
            url + f"/{id}",
            data=dumps(interface),
            content_type="application/json",
            follow_redirects=True,
        )
        assert 404 == response.status_code
        assert not response.is_json

"""Tests for the Workload controller."""

from json import dumps
from unittest.mock import patch

from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture

from hyrisecockpit.api.app import create_app
from hyrisecockpit.api.app.workload import BASE_ROUTE
from hyrisecockpit.api.app.workload.interface import BaseWorkloadInterface
from hyrisecockpit.api.app.workload.model import DetailedWorkload, Workload
from hyrisecockpit.api.app.workload.schema import (
    BaseWorkloadSchema,
    DetailedWorkloadSchema,
    WorkloadSchema,
)
from hyrisecockpit.api.app.workload.service import WorkloadService

url = f"/{BASE_ROUTE}"


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

    @patch("hyrisecockpit.api.app.workload.controller.WorkloadService")
    def test_gets_all_workloads(
        self, mock_workload_service: WorkloadService, client: FlaskClient
    ):
        """A Workload controller routes get_all correctly."""
        detailed_workload_one = DetailedWorkload(
            workload_type="tpch",
            frequency=200,
            scale_factor=1.0,
            weights={"01": 3.0, "02": 2.0},
            running=True,
            supported_scale_factors=[0.1, 1.0],
            default_weights={"01": 1.0, "02": 1.0},
        )
        detailed_workload_two = DetailedWorkload(
            workload_type="tpcc",
            frequency=300,
            scale_factor=5.0,
            weights={"01": 1.0, "02": 2.0},
            running=True,
            supported_scale_factors=[1.0, 5.0],
            default_weights={"01": 1.0, "02": 1.0},
        )
        mock_workload_service.get_all.return_value = [  # type: ignore
            detailed_workload_one,
            detailed_workload_two,
        ]
        response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert (
            DetailedWorkloadSchema(many=True).dump(
                [detailed_workload_one, detailed_workload_two]
            )
            == response.get_json()
        )

    @patch("hyrisecockpit.api.app.workload.controller.WorkloadService")
    def test_gets_no_workloads_if_there_are_none(
        self, mock_workload_service: WorkloadService, client: FlaskClient
    ):
        """A Workload controller routes get_all correctly."""
        mock_workload_service.get_all.return_value = []  # type: ignore
        response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert WorkloadSchema(many=True).dump([]) == response.get_json()

    @patch("hyrisecockpit.api.app.workload.controller.WorkloadService")
    def test_creates_a_workload(
        self, mock_workload_service: WorkloadService, client: FlaskClient
    ):
        """A Workload controller routes create correctly."""
        request = BaseWorkloadInterface(
            workload_type="tpch",
            frequency=200,
            scale_factor=1.0,
            weights={"01": 1.0, "02": 1.0},
        )
        mock_workload_service.update_by_id.return_value = request  # type: ignore
        response = client.post(
            url,
            follow_redirects=True,
            data=dumps(request),
            content_type="application/json",
        )
        assert 200 == response.status_code
        mock_workload_service.update_by_id.assert_called_once()  # type: ignore
        assert BaseWorkloadSchema().load(request) == response.get_json()

    @patch("hyrisecockpit.api.app.workload.controller.WorkloadService")
    def test_creates_no_workload_if_it_already_exists(
        self, mock_workload_service: WorkloadService, client: FlaskClient
    ):
        """A Workload controller routes create correctly."""
        request = BaseWorkloadInterface(
            workload_type="tpch",
            frequency=200,
            scale_factor=1.0,
            weights={"01": 1.0, "02": 1.0},
        )
        mock_workload_service.update_by_id.return_value = None  # type: ignore
        response = client.post(
            url,
            follow_redirects=True,
            data=dumps(request),
            content_type="application/json",
        )
        assert 404 == response.status_code
        assert not response.is_json


class TestWorkloadIdController:
    """Tests for the WorkloadId controller."""

    @patch("hyrisecockpit.api.app.workload.controller.WorkloadService")
    def test_gets_the_correct_workload(
        self, mock_workload_service: WorkloadService, client: FlaskClient
    ):
        """A WorkloadId controller routes get correctly."""
        workload = Workload(
            workload_type="tpch",
            frequency=200,
            scale_factor=1.0,
            weights={"01": 1.0, "02": 1.0},
            running=True,
        )
        workload_id = "tpch"
        mock_workload_service.get_by_id.return_value = workload  # type: ignore
        response = client.get(url + f"/{workload_id}", follow_redirects=True)
        assert 200 == response.status_code
        assert DetailedWorkloadSchema().dump(workload) == response.get_json()

    @patch("hyrisecockpit.api.app.workload.controller.WorkloadService")
    def test_gets_no_workload_if_it_cannot_be_found(
        self, mock_workload_service: WorkloadService, client: FlaskClient
    ):
        """A WorkloadId controller routes get correctly."""
        workload_id = "tpch"
        mock_workload_service.get_by_id.return_value = None  # type: ignore
        response = client.get(url + f"/{workload_id}", follow_redirects=True)
        assert 404 == response.status_code
        assert not response.is_json

    @patch("hyrisecockpit.api.app.workload.controller.WorkloadService")
    def test_deletes_the_correct_workload(
        self, mock_workload_service: WorkloadService, client: FlaskClient
    ):
        """A WorkloadId controller routes delete correctly."""
        workload_id = "tpch"
        mock_workload_service.delete_by_id.return_value = "tpch"  # type: ignore
        response = client.delete(url + f"/{workload_id}", follow_redirects=True)
        assert 200 == response.status_code
        assert not response.is_json

    @patch("hyrisecockpit.api.app.workload.controller.WorkloadService")
    def test_deletes_no_workload_if_it_cannot_be_found(
        self, mock_workload_service: WorkloadService, client: FlaskClient
    ):
        """A WorkloadId controller routes delete correctly."""
        workload_id = "tpch"
        mock_workload_service.delete_by_id.return_value = None  # type: ignore
        response = client.delete(url + f"/{workload_id}", follow_redirects=True)
        assert 404 == response.status_code
        assert not response.is_json

"""Tests for the status controller."""
from unittest.mock import patch

from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture

from hyrisecockpit.api.app import create_app
from hyrisecockpit.api.app.status import BASE_ROUTE
from hyrisecockpit.api.app.status.model import (
    DatabaseStatus,
    FailedTask,
    TablesStatus,
    WorkloadTablesStatus,
)
from hyrisecockpit.cross_platform_support.testing_support import MagicMock

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


class TestStatusController:
    """Tests for the metric controller."""

    @patch("hyrisecockpit.api.app.status.controller.StatusService")
    def test_get_database_status(
        self, mock_status_service: MagicMock, client: FlaskClient
    ) -> None:
        """A controller routes get_databse correctly."""
        interface = {
            "id": "SomeID",
            "database_blocked_status": False,
            "worker_pool_status": "running",
            "hyrise_active": False,
        }
        fake_database_status = DatabaseStatus(**interface)  # type: ignore
        mock_status_service.get_database_status.return_value = [fake_database_status]

        expected = [interface]

        response = client.get(f"{url}/database", follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.status.controller.StatusService")
    def test_get_workload_tables(
        self, mock_status_service: MagicMock, client: FlaskClient
    ) -> None:
        """A controller routes get_workload correctly."""
        interface = {
            "id": "SomeID",
            "workload_tables_status": [
                TablesStatus(
                    workload_type="tpch",
                    scale_factor=1.0,
                    loaded_tables=["a", "b"],
                    missing_tables=["c", "d"],
                    completely_loaded=False,
                    database_representation={
                        "a": "a_1",
                        "b": "b_1",
                        "c": "c_1",
                        "d": "d_1",
                    },
                )
            ],
        }
        fake_workload_status = WorkloadTablesStatus(**interface)  # type: ignore
        mock_status_service.get_workload_tables.return_value = [fake_workload_status]

        expected = [
            {
                "id": "SomeID",
                "workload_tables_status": [
                    {
                        "workload_type": "tpch",
                        "scale_factor": 1.0,
                        "loaded_tables": ["a", "b"],
                        "missing_tables": ["c", "d"],
                        "completely_loaded": False,
                        "database_representation": {
                            "a": "a_1",
                            "b": "b_1",
                            "c": "c_1",
                            "d": "d_1",
                        },
                    }
                ],
            }
        ]

        response = client.get(f"{url}/workload_tables", follow_redirects=True)
        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.status.controller.StatusService")
    def test_get_failed_tasks(
        self, mock_status_service: MagicMock, client: FlaskClient
    ) -> None:
        """A controller routes get_failed_tasks."""
        failed_query_interface = {
            "time": "42",
            "worker_id": "Im a worker",
            "task": "drink more beer",
            "error": "even more drunk",
        }
        interface = {"id": "SomeID", "failed_queries": [failed_query_interface]}
        fake_failed_tasks_status = FailedTask(**interface)  # type: ignore
        mock_status_service.get_failed_tasks.return_value = [fake_failed_tasks_status]

        expected = [interface]

        response = client.get(f"{url}/failed_tasks", follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

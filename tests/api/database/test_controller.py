"""Tests for the Database controller."""
from json import dumps
from unittest.mock import MagicMock, patch

from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture

from hyrisecockpit.api.app import create_app
from hyrisecockpit.api.app.database import BASE_ROUTE
from hyrisecockpit.api.app.database.model import (
    AvailableWorkloadTables,
    DetailedDatabase,
    WorkloadTables,
)
from hyrisecockpit.api.app.database.schema import (
    AvailableWorkloadTablesSchema,
    DetailedDatabaseSchema,
)

url = f"/{BASE_ROUTE}"
workload_tables_url = f"/{BASE_ROUTE}/workload_tables"
worker_url = f"/{BASE_ROUTE}/worker"

fake_database_one_attributes = {
    "id": "Bibi",
    "host": "Tina",
    "port": "1991",
    "number_workers": 2,
    "dbname": "Amadeus",
    "user": "Falko von Falkenstein",
    "password": "Bibi und Tina",
}


fake_database_two_attributes = {
    "id": "Ricky",
    "host": "Julian",
    "port": "1999",
    "number_workers": 10,
    "dbname": "Bubbles",
    "user": "Ray",
    "password": "Trailer Park Boys",
}


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
    """Tests for the Database controller."""

    @patch("hyrisecockpit.api.app.database.controller.DatabaseService")
    def test_gets_one_databases(
        self, mocked_database_service: MagicMock, client: FlaskClient
    ) -> None:
        """A database controller routes get_databases with one databases correctly."""
        fake_database_one = DetailedDatabase(**fake_database_one_attributes)  # type: ignore
        mocked_database_service.get_databases.return_value = [fake_database_one]
        response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert (
            DetailedDatabaseSchema(
                many=True, only=("id", "host", "port", "number_workers", "dbname")
            ).dump([fake_database_one])
            == response.get_json()
        )

    @patch("hyrisecockpit.api.app.database.controller.DatabaseService")
    def test_gets_multiple_databases(
        self, mocked_database_service: MagicMock, client: FlaskClient
    ) -> None:
        """A database controller routes get get_databases with multiple databases correctly."""
        fake_database_one = DetailedDatabase(**fake_database_one_attributes)  # type: ignore
        fake_database_two = DetailedDatabase(**fake_database_two_attributes)  # type: ignore
        mocked_database_service.get_databases.return_value = [
            fake_database_one,
            fake_database_two,
        ]
        response = client.get(url, follow_redirects=True)
        assert 200 == response.status_code
        assert (
            DetailedDatabaseSchema(
                many=True, only=("id", "host", "port", "number_workers", "dbname")
            ).dump([fake_database_one, fake_database_two])
            == response.get_json()
        )

    @patch("hyrisecockpit.api.app.database.controller.DatabaseService")
    def test_registers_database(
        self, mocked_database_service: MagicMock, client: FlaskClient
    ) -> None:
        """A database controller routes post register_database correctly."""
        mocked_database_service.register_database.return_value = 200
        response = client.post(
            url,
            follow_redirects=True,
            data=dumps(fake_database_one_attributes),
            content_type="application/json",
        )
        mocked_database_service.register_database.assert_called_once()
        args = mocked_database_service.register_database.call_args_list
        assert args[0][0][0] == fake_database_one_attributes
        assert 200 == response.status_code

    @patch("hyrisecockpit.api.app.database.controller.DatabaseService")
    def test_deregisters_database(
        self, mocked_database_service: MagicMock, client: FlaskClient
    ) -> None:
        """A database controller routes delete deregister_database correctly."""
        mocked_database_service.deregister_database.return_value = 200
        response = client.delete(
            url,
            follow_redirects=True,
            data=dumps({"id": "hmmmmmmmm?"}),
            content_type="application/json",
        )
        mocked_database_service.deregister_database.assert_called_once()
        args = mocked_database_service.deregister_database.call_args_list
        assert args[0][0][0] == {"id": "hmmmmmmmm?"}
        assert 200 == response.status_code

    @patch("hyrisecockpit.api.app.database.controller.DatabaseService")
    def test_gets_avaible_workload_tables(
        self, mocked_database_service: MagicMock, client: FlaskClient
    ) -> None:
        """A database controller routes get workload_tables  correctly."""
        workload_tables = AvailableWorkloadTables(
            [
                WorkloadTables(workload_type="tpch", scale_factor=0.1),
                WorkloadTables(workload_type="tpcds", scale_factor=1.0),
            ]
        )
        mocked_database_service.get_available_workload_tables.return_value = (
            workload_tables
        )
        response = client.get(workload_tables_url, follow_redirects=True)
        assert 200 == response.status_code
        assert (
            AvailableWorkloadTablesSchema().dump(workload_tables) == response.get_json()
        )

    @patch("hyrisecockpit.api.app.database.controller.DatabaseService")
    def test_loads_workload_tables(
        self, mocked_database_service: MagicMock, client: FlaskClient
    ) -> None:
        """A database controller routes post workload_tables  correctly."""
        workload_tables = {"workload_type": "tpchzzzzz!", "scale_factor": 1.0}
        mocked_database_service.load_workload_tables.return_value = 200
        response = client.post(
            workload_tables_url,
            follow_redirects=True,
            data=dumps(workload_tables),
            content_type="application/json",
        )
        mocked_database_service.load_workload_tables.assert_called_once()
        args = mocked_database_service.load_workload_tables.call_args_list
        assert args[0][0][0] == workload_tables
        assert 200 == response.status_code

    @patch("hyrisecockpit.api.app.database.controller.DatabaseService")
    def test_drops_workload_tables(
        self, mocked_database_service: MagicMock, client: FlaskClient
    ):
        """A database controller routes delete workload_tables  correctly."""
        workload_tables = {"workload_type": "tpchzzzzz!", "scale_factor": 1.0}
        mocked_database_service.delete_workload_tables.return_value = 200
        response = client.delete(
            workload_tables_url,
            follow_redirects=True,
            data=dumps(workload_tables),
            content_type="application/json",
        )
        mocked_database_service.delete_workload_tables.assert_called_once()
        args = mocked_database_service.delete_workload_tables.call_args_list
        assert args[0][0][0] == workload_tables
        assert 200 == response.status_code

    @patch("hyrisecockpit.api.app.database.controller.DatabaseService")
    def test_start_worker(
        self, mocked_database_service: MagicMock, client: FlaskClient
    ) -> None:
        """A database controller routes post worker  correctly."""
        mocked_database_service.start_worker_pool.return_value = 200
        response = client.post(
            worker_url,
            follow_redirects=True,
            content_type="application/json",
        )
        mocked_database_service.start_worker_pool.assert_called_once()
        assert 200 == response.status_code

    @patch("hyrisecockpit.api.app.database.controller.DatabaseService")
    def test_stop_worker(
        self, mocked_database_service: MagicMock, client: FlaskClient
    ) -> None:
        """A database controller routes post worker  correctly."""
        mocked_database_service.close_worker_pool.return_value = 200
        response = client.delete(
            worker_url,
            follow_redirects=True,
            content_type="application/json",
        )
        mocked_database_service.close_worker_pool.assert_called_once()
        assert 200 == response.status_code

"""Tests for the database service."""
from typing import List
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.api.app.database.interface import (
    DatabaseInterface,
    DetailedDatabaseInterface,
    WorkloadTablesInterface,
)
from hyrisecockpit.api.app.database.model import (
    AvailableWorkloadTables,
    DetailedDatabase,
)
from hyrisecockpit.api.app.database.schema import DetailedDatabaseSchema
from hyrisecockpit.api.app.database.service import DatabaseService
from hyrisecockpit.api.app.shared import _add_active_database
from hyrisecockpit.request import Header, Request

mocked_socket = MagicMock()


def get_mocked_socket_manager(*args) -> MagicMock:
    """Return fake storage cursor."""
    mocked_socket_manager_constructor: MagicMock = MagicMock()
    mocked_socket_manager_constructor.__enter__.return_value = mocked_socket
    return mocked_socket_manager_constructor


@fixture
def database_service() -> DatabaseService:
    """Return zeromq patched database service."""
    return DatabaseService()


@fixture
def mocked_database_service() -> DatabaseService:
    """Return mocked database service."""
    DatabaseService._send_message = MagicMock()  # type: ignore
    return DatabaseService  # type: ignore


class TestDatabaseService:
    """Tests for the database service."""

    @patch("hyrisecockpit.api.app.database.service.validate")
    @patch(
        "hyrisecockpit.api.app.database.service.ManagerSocket",
        get_mocked_socket_manager,
    )
    def test_sends_request(
        self, mocked_validate: MagicMock, database_service: DatabaseService
    ) -> None:
        """Test sending of message."""
        fake_message = "do something"
        global mocked_socket
        mocked_socket.send_message.return_value = {"some": "response"}

        response = database_service._send_message(fake_message)  # type: ignore

        mocked_socket.send_message.assert_called_once_with(fake_message)
        mocked_validate.assert_called_once()

        assert response == {"some": "response"}  # type: ignore

        mocked_socket = MagicMock()

    def test_gets_databases(self, mocked_database_service: DatabaseService) -> None:
        """A database service gets all databases."""
        fake_database = {
            "id": "Bibi",
            "host": "Tina",
            "port": "1991",
            "number_workers": 2,
            "dbname": "Amadeus",
            "user": "Falko von Falkenstein",
            "password": "Bibi und Tina",
        }

        fake_response = {"body": {"databases": [fake_database]}}
        mocked_database_service._send_message.return_value = fake_response  # type: ignore

        expected: List = [DetailedDatabase(**fake_database)]  # type: ignore

        response: List = mocked_database_service.get_databases()

        mocked_database_service._send_message.assert_called_once_with(  # type: ignore
            Request(header=Header(message="get databases"), body={})
        )
        schema = DetailedDatabaseSchema()

        assert isinstance(response[0], DetailedDatabase)
        assert schema.dumps(response[0]) == schema.dumps(expected[0])

    @patch("hyrisecockpit.api.app.database.service._add_active_database")
    def test_registers_database(
        self,
        mock_add_active_databases: MagicMock,
        mocked_database_service: DatabaseService,
    ) -> None:
        """A database service registers a database."""
        interface = DetailedDatabaseInterface(
            id="hycrash",
            host="linux",
            port="666",
            number_workers=42,
            dbname="post",
            user="Alex",
            password="1234",
        )
        fake_response = {"header": {"status": 200}}
        mocked_database_service._send_message.return_value = fake_response  # type: ignore

        response: int = mocked_database_service.register_database(interface)

        mocked_database_service._send_message.assert_called_once_with(  # type: ignore
            Request(header=Header(message="add database"), body=dict(interface))
        )
        mock_add_active_databases.assert_called_once_with("hycrash")
        assert response == 200

    @patch("hyrisecockpit.api.app.database.service._add_active_database")
    def test_registers_database_unsuccessful(
        self,
        mock_add_active_databases: MagicMock,
        mocked_database_service: DatabaseService,
    ) -> None:
        """A database service tries to register a database without success."""
        interface = DetailedDatabaseInterface(
            id="hycrash",
            host="linux",
            port="666",
            number_workers=42,
            dbname="post",
            user="Alex",
            password="1234",
        )
        fake_response = {"header": {"status": 400}}
        mocked_database_service._send_message.return_value = fake_response  # type: ignore

        response: int = mocked_database_service.register_database(interface)

        mocked_database_service._send_message.assert_called_once_with(  # type: ignore
            Request(header=Header(message="add database"), body=dict(interface))
        )
        mock_add_active_databases.assert_not_called()
        assert response == 400

    def test_deregisters_database(
        self, mocked_database_service: DatabaseService
    ) -> None:
        """A database service deregisters a database."""
        _add_active_database("lowrise")
        interface = DatabaseInterface(id="lowrise",)
        fake_response = {"header": {"status": 42}}
        mocked_database_service._send_message.return_value = fake_response  # type: ignore

        response: int = mocked_database_service.deregister_database(interface)

        mocked_database_service._send_message.assert_called_once_with(  # type: ignore
            Request(header=Header(message="delete database"), body=dict(interface))
        )
        assert response == 42

    def test_gets_available_workload_tables(
        self, mocked_database_service: DatabaseService
    ) -> None:
        """A database service returns the available workload tables."""
        fake_response = {"header": {"status": 42}}
        mocked_database_service._send_message.return_value = fake_response  # type: ignore

        response: AvailableWorkloadTables = mocked_database_service.get_available_workload_tables()

        assert isinstance(response, AvailableWorkloadTables)

    def test_deletes_workload_tables(
        self, mocked_database_service: DatabaseService
    ) -> None:
        """A database service deletes workload tables."""
        interface = WorkloadTablesInterface(workload_type="tpci", scale_factor=0.1)
        fake_response = {"header": {"status": 42}}
        mocked_database_service._send_message.return_value = fake_response  # type: ignore

        response: int = mocked_database_service.delete_workload_tables(interface)

        mocked_database_service._send_message.assert_called_once_with(  # type: ignore
            Request(header=Header(message="delete data"), body=dict(interface))
        )
        assert response == 42

    def test_starts_worker(self, mocked_database_service: DatabaseService) -> None:
        """A database service starts worker."""
        fake_response = {"header": {"status": 42}}
        mocked_database_service._send_message.return_value = fake_response  # type: ignore

        response: int = mocked_database_service.start_worker_pool()

        mocked_database_service._send_message.assert_called_once_with(  # type: ignore
            Request(header=Header(message="start worker"), body={})
        )
        assert response == 42

    def test_closes_worker(self, mocked_database_service: DatabaseService) -> None:
        """A database service close worker."""
        fake_response = {"header": {"status": 42}}
        mocked_database_service._send_message.return_value = fake_response  # type: ignore

        response: int = mocked_database_service.close_worker_pool()

        mocked_database_service._send_message.assert_called_once_with(  # type: ignore
            Request(header=Header(message="close worker"), body={})
        )
        assert response == 42

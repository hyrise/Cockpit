"""Tests for the status service."""

from unittest.mock import patch

from pytest import fixture

from hyrisecockpit.api.app.status.model import (
    BenchmarkStatus,
    DatabaseStatus,
    FailedTask,
    HyriseStatus,
)
from hyrisecockpit.api.app.status.service import StatusService
from hyrisecockpit.cross_platform_support.testing_support import MagicMock


@fixture
def status_service() -> StatusService:
    """Return status service."""
    return StatusService  # type: ignore


class TestStatusService:
    """Tests for the status service."""

    @patch("hyrisecockpit.api.app.status.service.validate")
    @patch("hyrisecockpit.api.app.status.service.ManagerSocket")
    def test_sends_request(
        self,
        mock_manager_socket: MagicMock,
        mock_validate: MagicMock,
        status_service: StatusService,
    ) -> None:
        """Test sending of message."""
        mock_socket: MagicMock = MagicMock()
        mock_manager_socket.return_value.__enter__.return_value = mock_socket

        fake_message = "hallo hyrise?"
        status_service._send_message(fake_message)  # type: ignore
        mock_socket.send_message.assert_called_once_with(fake_message)

    @patch("hyrisecockpit.api.app.status.service.Header")
    @patch("hyrisecockpit.api.app.status.service.Request")
    def test_get_hyrise_status(
        self,
        mock_request: MagicMock,
        mock_header: MagicMock,
        status_service: StatusService,
    ) -> None:
        """Test get hyrise status."""
        mock_header.return_value = "Header"
        mock_request.return_value = "request"
        fake_send_message: MagicMock = MagicMock()
        fake_hyrise_status = {"id": "SomeID", "hyrise_active": False}
        fake_response = {"body": {"hyrise_status": [fake_hyrise_status]}}
        fake_send_message.return_value = fake_response

        status_service._send_message = fake_send_message  # type: ignore

        results = status_service.get_hyrise_status()

        mock_request.assert_called_once_with(header="Header", body={})
        fake_send_message.assert_called_once_with("request")
        mock_header.assert_called_once_with(message="hyrise status")

        assert isinstance(results[0], HyriseStatus)

    @patch("hyrisecockpit.api.app.status.service.Header")
    @patch("hyrisecockpit.api.app.status.service.Request")
    def test_get_database_status(
        self,
        mock_request: MagicMock,
        mock_header: MagicMock,
        status_service: StatusService,
    ) -> None:
        """Test get database status."""
        mock_header.return_value = "Header"
        mock_request.return_value = "request"
        fake_send_message: MagicMock = MagicMock()
        fake_hyrise_status = {
            "id": "SomeID",
            "database_blocked_status": False,
            "worker_pool_status": "running",
        }
        fake_response = {"body": {"database_status": [fake_hyrise_status]}}
        fake_send_message.return_value = fake_response

        status_service._send_message = fake_send_message  # type: ignore

        results = status_service.get_database_status()

        mock_request.assert_called_once_with(header="Header", body={})
        fake_send_message.assert_called_once_with("request")
        mock_header.assert_called_once_with(message="database status")

        assert isinstance(results[0], DatabaseStatus)

    @patch("hyrisecockpit.api.app.status.service.Header")
    @patch("hyrisecockpit.api.app.status.service.Request")
    def test_get_benchmark_status(
        self,
        mock_request: MagicMock,
        mock_header: MagicMock,
        status_service: StatusService,
    ) -> None:
        """Test get benchmark status."""
        mock_header.return_value = "Header"
        mock_request.return_value = "request"
        fake_send_message: MagicMock = MagicMock()
        fake_hyrise_status = {
            "id": "SomeID",
            "loaded_benchmarks": ["tpch", "hcpt"],
            "loaded_tables": ["tpch_0_1"],
        }
        fake_response = {"body": {"benchmark_status": [fake_hyrise_status]}}
        fake_send_message.return_value = fake_response

        status_service._send_message = fake_send_message  # type: ignore

        results = status_service.get_benchmark_status()

        mock_request.assert_called_once_with(header="Header", body={})
        fake_send_message.assert_called_once_with("request")
        mock_header.assert_called_once_with(message="benchmark status")

        assert isinstance(results[0], BenchmarkStatus)

    @patch("hyrisecockpit.api.app.status.service.StorageConnection")
    @patch("hyrisecockpit.api.app.status.service._get_active_databases")
    def test_get_failed_tasks(
        self,
        mock_get_active_databases: MagicMock,
        mock_storage_connection: MagicMock,
        status_service: StatusService,
    ) -> None:
        """Test get failed tasks."""
        mock_client: MagicMock = MagicMock()
        mock_storage_connection.return_value.__enter__.return_value = mock_client
        mock_get_active_databases.return_value = ["databaseID"]
        mock_query_results: MagicMock = MagicMock()
        fake_query_results = {
            "time": "42",
            "worker_id": "Im a worker",
            "task": "drink beer",
            "error": "to drunk",
        }
        mock_query_results.__getitem__.return_value = [fake_query_results]
        mock_client.query.return_value = mock_query_results

        results = status_service.get_failed_tasks()

        mock_client.query.assert_called_once_with(
            "SELECT * FROM failed_queries LIMIT 100;", database="databaseID"
        )
        assert isinstance(results[0], FailedTask)

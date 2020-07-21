"""Tests for the status service."""

from unittest.mock import patch

from pytest import fixture

from hyrisecockpit.api.app.status.model import (
    DatabaseStatus,
    FailedTask,
    WorkloadTablesStatus,
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
            "hyrise_active": False,
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
    def test_get_workload_tables(
        self,
        mock_request: MagicMock,
        mock_header: MagicMock,
        status_service: StatusService,
    ) -> None:
        """Test get benchmark status."""
        mock_header.return_value = "Header"
        mock_request.return_value = "request"
        fake_send_message: MagicMock = MagicMock()
        fake_workload_table = {
            "workload_type": "tpch",
            "scale_factor": 1.0,
            "loaded_tables": ["a", "b"],
            "missing_tables": ["c", "d"],
            "completely_loaded": False,
            "database_representation": {"a": "a_1", "b": "b_1", "c": "c_1", "d": "d_1"},
        }
        fake_response = {
            "body": {
                "workoad_tables": [
                    {"id": "fake_id", "workoad_tables_status": [fake_workload_table]}
                ]
            }
        }
        fake_send_message.return_value = fake_response

        status_service._send_message = fake_send_message  # type: ignore

        results = status_service.get_workload_tables()

        mock_request.assert_called_once_with(header="Header", body={})
        fake_send_message.assert_called_once_with("request")
        mock_header.assert_called_once_with(message="workload tables status")

        assert isinstance(results[0], WorkloadTablesStatus)

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

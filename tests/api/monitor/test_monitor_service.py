from hyrisecockpit.api.app.monitor.service import MonitorService

from unittest.mock import MagicMock
from typing import Type
from pytest import fixture
from unittest.mock import patch


class TestMonitorService:
    """Tests for the monitor service."""

    @fixture
    def monitor_service(self) -> Type[MonitorService]:
        """Get a WorkloadService class without IPC."""
        return MonitorService

    @patch("hyrisecockpit.api.app.monitor.service._get_active_databases")
    @patch("hyrisecockpit.api.app.monitor.service.StorageConnection")
    def test_gets_failed_tasks(
        self,
        mock_storage_connection: MagicMock,
        mock_get_active_databases: MagicMock,
        monitor_service: MonitorService,
    ) -> None:
        mock_client = MagicMock()
        mock_client.query.return_value = {
            ("failed_queries", None): [
                {
                    "time": "2042-10-10T00:00:00Z",
                    "error": "some_error",
                    "task": "select * from foo",
                    "worker_id": "worker_1",
                },
                {
                    "time": "2050-10-10T00:00:00Z",
                    "error": "some_extra_error",
                    "task": "select * from haha",
                    "worker_id": "worker_2",
                },
            ]
        }
        mock_storage_connection.return_value.__enter__.return_value = mock_client
        mock_get_active_databases.return_value = ["database_id"]
        result = monitor_service.get_failed_tasks()

        assert result[0].id == "database_id"
        assert vars(result[0].failed_task_entries[0]) == {
            "timestamp": "2042-10-10T00:00:00Z",
            "error": "some_error",
            "task": "select * from foo",
            "worker_id": "worker_1",
        }
        assert vars(result[0].failed_task_entries[1]) == {
            "timestamp": "2050-10-10T00:00:00Z",
            "error": "some_extra_error",
            "task": "select * from haha",
            "worker_id": "worker_2",
        }

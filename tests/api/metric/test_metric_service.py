"""Tests for the metric service."""

from unittest.mock import patch

from pytest import fixture

from hyrisecockpit.api.app.metric.model import TimeInterval
from hyrisecockpit.api.app.metric.service import MetricService
from hyrisecockpit.cross_platform_support.testing_support import MagicMock

from hyrisecockpit.api.app.metric.model import MemoryFootprint, MemoryFootprintEntry


@fixture
def metric_service() -> MetricService:
    """Return metric service."""
    return MetricService  # type: ignore


class TestMetricService:
    """Tests for the metric service."""

    @patch("hyrisecockpit.api.app.metric.service.get_interval_limits")
    @patch("hyrisecockpit.api.app.metric.service.get_historical_metric")
    @patch("hyrisecockpit.api.app.metric.service.StorageConnection")
    def test_get_data_for_time_intervall(
        self,
        mock_storage_connection: MagicMock,
        mock_get_historical_metric: MagicMock,
        mock_get_interval_limits: MagicMock,
        metric_service: MetricService,
    ) -> None:
        """Test get data."""
        fake_time_interval = TimeInterval(startts=42, endts=100, precision=1)
        fake_table_name = "table_name"
        fake_column_names = ["column_one", "column_two"]
        mock_get_interval_limits.return_value = (
            50,
            100,
        )
        mock_get_historical_metric.return_value = "response"

        mock_client: MagicMock = MagicMock()
        mock_storage_connection.return_value.__enter__.return_value = mock_client

        response = metric_service.get_data(
            fake_time_interval, fake_table_name, fake_column_names
        )

        mock_get_interval_limits.assert_called_once_with(42, 100, 1)
        mock_get_historical_metric.assert_called_once_with(
            50, 100, 1, fake_table_name, fake_column_names, mock_client
        )
        assert response == "response"  # type: ignore

    def test_get_throughput(self, metric_service: MetricService) -> None:
        """Test get throughput."""
        mock_get_data: MagicMock = MagicMock()
        metric_service.get_data = mock_get_data  # type: ignore

        fake_time_interval = "fake_interval"

        metric_service.get_throughput(fake_time_interval)  # type: ignore
        mock_get_data.assert_called_once_with(
            fake_time_interval, "throughput", ["throughput"]
        )

    def test_get_latency(self, metric_service: MetricService) -> None:
        """Test get latency."""
        mock_get_data: MagicMock = MagicMock()
        metric_service.get_data = mock_get_data  # type: ignore

        fake_time_interval = "fake_interval"

        metric_service.get_latency(fake_time_interval)  # type: ignore
        mock_get_data.assert_called_once_with(
            fake_time_interval, "latency", ["latency"]
        )

    def test_get_queue_length(self, metric_service: MetricService) -> None:
        """Test get queue length."""
        mock_get_data: MagicMock = MagicMock()
        metric_service.get_data = mock_get_data  # type: ignore

        fake_time_interval = "fake_interval"

        metric_service.get_queue_length(fake_time_interval)  # type: ignore
        mock_get_data.assert_called_once_with(
            fake_time_interval, "queue_length", ["queue_length"]
        )

    def test_get_memory_footprint(self, metric_service: MetricService) -> None:
        mock_get_data: MagicMock = MagicMock()
        memory_footprint = {"timestamp": 42, "memory_footprint": 1234.0}
        mock_get_data.return_value = [
            {
                "id": "database_id",
                "memory_footprint": [memory_footprint],
            }
        ]
        metric_service.get_data = mock_get_data  # type: ignore

        fake_time_interval = "fake_interval"

        results = metric_service.get_memory_footprint(fake_time_interval)  # type: ignore

        mock_get_data.assert_called_once_with(
            fake_time_interval, "memory_footprint", ["memory_footprint"]
        )
        assert isinstance(results[0], MemoryFootprint)
        assert isinstance(results[0].memory_footprint[0], MemoryFootprintEntry)
        assert vars(results[0].memory_footprint[0]) == memory_footprint
        assert results[0].id == "database_id"

    @patch("hyrisecockpit.api.app.metric.service.StorageConnection")
    @patch("hyrisecockpit.api.app.metric.service._get_active_databases")
    @patch("hyrisecockpit.api.app.metric.service.time_ns", lambda: 10_000_000_000)
    def test_get_detailed_query_information(
        self,
        mock_get_active_databases: MagicMock,
        mock_storage_connection: MagicMock,
        metric_service: MetricService,
    ) -> None:
        """Test get detailed query information."""
        mock_get_active_databases.return_value = ["database"]
        mock_client: MagicMock = MagicMock()
        mock_storage_connection.return_value.__enter__.return_value = mock_client

        # TODO use better fake data
        mock_client.query.return_value = MagicMock()

        metric_service.get_detailed_query_information()

        mock_client.query.assert_called_once_with(
            'SELECT COUNT("latency") as "throughput", MEAN("latency") as "latency" FROM successful_queries WHERE time > $startts AND time <= $endts GROUP BY benchmark, query_no, scalefactor;',
            database="database",
            bind_params={"startts": 2_000_000_000, "endts": 7_000_000_000},
        )

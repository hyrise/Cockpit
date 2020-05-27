"""Tests for the metric controller."""
from unittest.mock import patch

from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture

from hyrisecockpit.api.app import create_app
from hyrisecockpit.api.app.metric import BASE_ROUTE
from hyrisecockpit.api.app.metric.schema import (
    DetailedQueryInformationSchema,
    LatencySchema,
    QueueLengthSchema,
    ThroughputSchema,
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


class TestMetricController:
    """Tests for the metric controller."""

    @patch("hyrisecockpit.api.app.metric.controller.MetricService")
    def test_get_throughput(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:
        """A metric controller routes get_throughput correctly."""
        fake_throughput = {
            "id": "db1",
            "throughput": [{"timestamp": 42, "throughput": 3.3}],
        }
        mock_metric_service.get_throughput.return_value = [fake_throughput]
        expected = ThroughputSchema(many=True).dump([fake_throughput])

        fake_startts = 1
        fake_endts = 5
        fake_precision = 1

        parameterized_url = f"{url}/throughput?startts={fake_startts}&endts={fake_endts}&precision={fake_precision}"
        response = client.get(parameterized_url, follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.metric.controller.MetricService")
    def test_get_latency(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:
        """A metric controller routes get_latency correctly."""
        fake_latency = {"id": "db1", "latency": [{"timestamp": 42, "latency": 3.3}]}
        mock_metric_service.get_latency.return_value = [fake_latency]
        expected = LatencySchema(many=True).dump([fake_latency])

        fake_startts = 1
        fake_endts = 5
        fake_precision = 1

        parameterized_url = f"{url}/latency?startts={fake_startts}&endts={fake_endts}&precision={fake_precision}"
        response = client.get(parameterized_url, follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.metric.controller.MetricService")
    def test_get_queue_length(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:
        """A metric controller routes get_queue_length correctly."""
        fake_queue_length = {
            "id": "db1",
            "queue_length": [{"timestamp": 42, "queue_length": 3.3}],
        }
        mock_metric_service.get_queue_length.return_value = [fake_queue_length]
        expected = QueueLengthSchema(many=True).dump([fake_queue_length])

        fake_startts = 1
        fake_endts = 5
        fake_precision = 1

        parameterized_url = f"{url}/queue_length?startts={fake_startts}&endts={fake_endts}&precision={fake_precision}"
        response = client.get(parameterized_url, follow_redirects=True)

        assert 200 == response.status_code
        assert expected == response.get_json()

    @patch("hyrisecockpit.api.app.metric.controller.MetricService")
    def test_get_detailed_query_information(
        self, mock_metric_service: MagicMock, client: FlaskClient
    ) -> None:
        """A metric controller routes detailed_query_information correctly."""
        fake_detailed_query_information = {
            "id": "db1",
            "detailed_query_information": [
                {
                    "benchmark": "super_benchmark",
                    "query_number": "10a",
                    "throughput": 3,
                    "latency": 2.3,
                }
            ],
        }
        mock_metric_service.get_detailed_query_information.return_value = [
            fake_detailed_query_information
        ]
        expected = DetailedQueryInformationSchema(many=True).dump(
            [fake_detailed_query_information]
        )

        response = client.get(
            f"{url}/detailed_query_information", follow_redirects=True
        )

        assert 200 == response.status_code
        assert expected == response.get_json()

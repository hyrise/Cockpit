"""Tests for the metric models."""

from hyrisecockpit.api.app.metric.model import (
    DetailedQueryEntry,
    DetailedQueryInformation,
)


class TestMetricModel:
    """Tests for metric models."""

    def test_creates_detailed_query_entry(self) -> None:
        """A DetailedQueryEntry model can be created."""
        assert DetailedQueryEntry(
            benchmark="benchmark",
            query_number="query_number",
            throughput=42.2,
            latency=2.2,
        )

    def test_creates_detailed_query_information(self) -> None:
        """A DetailedQueryInformation model can be created."""
        detailed_query_entry = DetailedQueryEntry(
            benchmark="benchmark",
            query_number="query_number",
            throughput=42.2,
            latency=2.2,
        )
        assert DetailedQueryInformation(
            id="What", detailed_query_information=[detailed_query_entry]
        )

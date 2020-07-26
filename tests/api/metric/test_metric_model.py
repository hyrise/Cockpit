"""Tests for the metric models."""

from hyrisecockpit.api.app.metric.model import (
    DetailedQueryEntry,
    DetailedQueryInformation,
    Latency,
    LatencyEntry,
    QueueLength,
    QueueLengthEntry,
    Throughput,
    ThroughputEntry,
    TimeInterval,
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

    def test_creates_time_interval(self) -> None:
        """A TimeInterval model can be created."""
        assert TimeInterval(startts=1, endts=2, precision=1,)

    def test_creates_throughput_entry_model(self) -> None:
        """A throughput entry model can be created."""
        assert ThroughputEntry(timestamp=999999, throughput=0.12345)

    def test_creates_throughput_model(self) -> None:
        """A throughput  model can be created."""
        throughput_entry = ThroughputEntry(timestamp=999999, throughput=0.12345)
        assert Throughput(id="hi", throughput=[throughput_entry])

    def test_creates_latency_entry_model(self) -> None:
        """A latency entry model can be created."""
        assert LatencyEntry(timestamp=999999, latency=0.12345)

    def test_creates_latency_model(self) -> None:
        """A latency  model can be created."""
        latency_entry = LatencyEntry(timestamp=999999, latency=0.12345)
        assert Latency(id="hi", latency=[latency_entry])

    def test_creates_queue_length_entry_model(self) -> None:
        """A queue length entry model can be created."""
        assert QueueLengthEntry(timestamp=999999, queue_length=0.12345)

    def test_creates_queue_length_model(self) -> None:
        """A  queue length  model can be created."""
        queue_length_entry = QueueLengthEntry(timestamp=999999, queue_length=0.12345)
        assert QueueLength(id="hi", queue_length=[queue_length_entry])

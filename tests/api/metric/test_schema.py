"""Tests for the metric schema's."""
from hyrisecockpit.api.app.metric.model import (
    DetailedQueryEntry,
    DetailedQueryInformation,
)
from hyrisecockpit.api.app.metric.schema import (
    DetailedQueryInformationEntrySchema,
    DetailedQueryInformationSchema,
    LatencyEntrySchema,
    LatencySchema,
    QueueLengthEntrySchema,
    QueueLengthSchema,
    ThroughputEntrySchema,
    ThroughputSchema,
)


class TestMetricSchema:
    """Tests for the metric schema's."""

    def test_creates_throughput_entry_schema(self) -> None:
        """A ThroughputEntrySchema schema can be created."""
        assert ThroughputEntrySchema()

    def test_creates_throughput_schema(self) -> None:
        """A ThroughputSchema schema can be created."""
        assert ThroughputSchema()

    def test_creates_latency_entry_schema(self) -> None:
        """A LatencyEntrySchema schema can be created."""
        assert LatencyEntrySchema()

    def test_creates_latency_schema(self) -> None:
        """A LatencySchema schema can be created."""
        assert LatencySchema()

    def test_creates_queue_length_entry_schema(self) -> None:
        """A QueueLengthEntrySchema schema can be created."""
        assert QueueLengthEntrySchema()

    def test_creates_queue_length_schema(self) -> None:
        """A QueueLengthSchema schema can be created."""
        assert QueueLengthSchema()

    def test_creates_detailed_query_information_entry_schema(self) -> None:
        """A DetailedQueryInformationEntrySchema schema can be created."""
        assert DetailedQueryInformationEntrySchema()

    def test_creates_detailed_query_information_schema(self) -> None:
        """A DetailedQueryInformationSchema schema can be created."""
        assert DetailedQueryInformationSchema()

    def test_deserializes_throughput_entry_schema(self) -> None:
        """A throughput entry schema can be deserialized."""
        interface = {"timestamp": 1, "throughput": 100}
        deserialized = ThroughputEntrySchema().load(interface)
        assert deserialized["timestamp"] == 1
        assert deserialized["throughput"] == 100

    def test_deserializes_throughput_schema(self) -> None:
        """A throughput schema can be deserialized."""
        throughput_entry_interface = {"timestamp": 1, "throughput": 100}
        interface = {"id": "ha!", "throughput": [throughput_entry_interface]}
        deserialized = ThroughputSchema().load(interface)
        assert deserialized["throughput"][0]["timestamp"] == 1
        assert deserialized["throughput"][0]["throughput"] == 100
        assert deserialized["id"] == "ha!"

    def test_deserializes_latency_entry_schema(self) -> None:
        """A latency entry schema can be deserialized."""
        interface = {"timestamp": 1, "latency": 100}
        deserialized = LatencyEntrySchema().load(interface)
        assert deserialized["timestamp"] == 1
        assert deserialized["latency"] == 100

    def test_deserializes_latency_schema(self) -> None:
        """A latency schema can be deserialized."""
        latency_entry_interface = {"timestamp": 1, "latency": 100}
        interface = {"id": "ha!", "latency": [latency_entry_interface]}
        deserialized = LatencySchema().load(interface)
        assert deserialized["latency"][0]["timestamp"] == 1
        assert deserialized["latency"][0]["latency"] == 100
        assert deserialized["id"] == "ha!"

    def test_deserializes_queue_length_entry_schema(self) -> None:
        """A queue length entry schema can be deserialized."""
        interface = {"timestamp": 1, "queue_length": 100}
        deserialized = QueueLengthEntrySchema().load(interface)
        assert deserialized["timestamp"] == 1
        assert deserialized["queue_length"] == 100

    def test_deserializes_queue_length_schema(self) -> None:
        """A queue length schema can be deserialized."""
        queue_length_entry_interface = {"timestamp": 1, "queue_length": 100}
        interface = {"id": "ha!", "queue_length": [queue_length_entry_interface]}
        deserialized = QueueLengthSchema().load(interface)
        assert deserialized["queue_length"][0]["timestamp"] == 1
        assert deserialized["queue_length"][0]["queue_length"] == 100
        assert deserialized["id"] == "ha!"

    def test_deserializes_detailed_query_information_entry_schema(self) -> None:
        """A detailed query information entry schema can be deserialized."""
        interface = {
            "benchmark": "tpppp",
            "query_number": "100",
            "throughput": 42,
            "latency": 24,
        }
        deserialized = DetailedQueryInformationEntrySchema().load(interface)
        assert deserialized["benchmark"] == "tpppp"
        assert deserialized["query_number"] == "100"
        assert deserialized["throughput"] == 42
        assert deserialized["latency"] == 24

    def test_deserializes_detailed_query_information_schema(self) -> None:
        """A detailed query information schema can be deserialized."""
        detailed_query_information_entry_interface = {
            "benchmark": "tpppp",
            "query_number": "100",
            "throughput": 42,
            "latency": 24,
        }
        interface = {
            "id": "ha!",
            "detailed_query_information": [detailed_query_information_entry_interface],
        }
        deserialized = DetailedQueryInformationSchema().load(interface)
        assert deserialized["detailed_query_information"][0]["benchmark"] == "tpppp"
        assert deserialized["detailed_query_information"][0]["query_number"] == "100"
        assert deserialized["detailed_query_information"][0]["throughput"] == 42
        assert deserialized["detailed_query_information"][0]["latency"] == 24
        assert deserialized["id"] == "ha!"

    def test_serializes_detailed_query_information_entry_schema(self) -> None:
        """A detailed query information entry schema can be serialized."""
        interface = {
            "benchmark": "tpppp",
            "query_number": "100",
            "throughput": 42,
            "latency": 24,
        }
        detailed_query_entry = DetailedQueryEntry(**interface)  # type: ignore
        serialized = DetailedQueryInformationEntrySchema().dump(detailed_query_entry)

        assert vars(detailed_query_entry) == serialized == interface

    def test_serializes_detailed_query_information_schema(self) -> None:
        """A detailed query information entry schema can be serialized."""
        interface = {
            "benchmark": "tpppp",
            "query_number": "100",
            "throughput": 42,
            "latency": 24,
        }
        interface = {"id": "ha!", "detailed_query_information": [interface]}

        detailed_query = DetailedQueryInformation(**interface)  # type: ignore
        serialized = DetailedQueryInformationSchema().dump(detailed_query)

        assert vars(detailed_query) == serialized == interface

"""Schema for metric namespace."""
from marshmallow import Schema, post_load
from marshmallow.fields import Float, Integer, List, Nested, String

from .model import (
    Latency,
    LatencyEntry,
    QueueLength,
    QueueLengthEntry,
    Throughput,
    ThroughputEntry,
)


class ThroughputEntrySchema(Schema):
    """Schema of a Throughput entry."""

    timestamp = Integer(
        title="Timestamp",
        description="Timestamp in nanoseconds since epoch",
        required=True,
        example=1585762457000000000,
    )
    throughput = Float(
        title="Throughput",
        description="Throughput value",
        required=True,
        example=273.9,
    )

    @post_load
    def make_throughput_entry(self, data, **kwargs):
        """Return a throughput entry object."""
        return ThroughputEntry(**data)


class ThroughputSchema(Schema):
    """Schema of a Throughput metric."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    throughput = List(Nested(ThroughputEntrySchema))

    @post_load
    def make_throughput(self, data, **kwargs):
        """Return a throughput object."""
        return Throughput(**data)


class LatencyEntrySchema(Schema):
    """Schema of a Latency entry."""

    timestamp = Integer(
        title="Latency",
        description="Timestamp in nanoseconds since epoch",
        required=True,
        example=1585762457000000000,
    )
    latency = Float(
        title="Latency", description="Latency value", required=True, example=273.9,
    )

    @post_load
    def make_latency_entry(self, data, **kwargs):
        """Return a latency entry object."""
        return LatencyEntry(**data)


class LatencySchema(Schema):
    """Schema of a Latency metric."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    latency = List(Nested(LatencyEntrySchema))

    @post_load
    def make_latency(self, data, **kwargs):
        """Return a latency object."""
        return Latency(**data)


class QueueLengthEntrySchema(Schema):
    """Schema of a Latency entry."""

    timestamp = Integer(
        title="Queue length",
        description="Timestamp in nanoseconds since epoch",
        required=True,
        example=1585762457000000000,
    )
    queue_length = Float(
        title="Queue length",
        description="Queue length value",
        required=True,
        example=273.9,
    )

    @post_load
    def make_queue_length_entry(self, data, **kwargs):
        """Return a queue length entry object."""
        return QueueLengthEntry(**data)


class QueueLengthSchema(Schema):
    """Schema of a Latency metric."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    queue_length = List(Nested(QueueLengthEntrySchema))

    @post_load
    def make_queue_length(self, data, **kwargs):
        """Return a queue length object."""
        return QueueLength(**data)


class DetailedQueryInformationEntrySchema(Schema):
    """Schema of a Latency entry."""

    benchmark = String(
        title="workload_type",
        description="Type of the executed query.",
        required=True,
        example="tpch_0.1",
    )
    query_number = String(
        title="query_number",
        description="Number of the executed query",
        required=True,
        example=5,
    )
    throughput = Integer(
        title="throughput",
        description="Number of successfully executed queries in given time interval.",
        required=True,
        example=55,
    )
    latency = Float(
        title="Latency",
        description="Average query latency (ns) of a given time interval.",
        required=True,
        example=923.263,
    )


class DetailedQueryInformationSchema(Schema):
    """Schema of a detailed query information metric."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    detailed_query_information = List(Nested(DetailedQueryInformationEntrySchema))

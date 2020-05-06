"""Schema for metric namespace."""
from marshmallow import Schema
from marshmallow.fields import Float, Integer, List, Nested, String


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


class ThroughputSchema(Schema):
    """Schema of a Throughput metric."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    throughput = List(Nested(ThroughputEntrySchema))


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


class LatencySchema(Schema):
    """Schema of a Latency metric."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    latency = List(Nested(LatencyEntrySchema))


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


class QueueLengthSchema(Schema):
    """Schema of a Latency metric."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    queue_length = List(Nested(QueueLengthEntrySchema))

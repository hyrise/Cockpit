"""Schema for metric namespace."""
from marshmallow import Schema
from marshmallow.fields import Float, Integer, List, Nested, String


class ThroughputEntry(Schema):
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
    throughput = List(Nested(ThroughputEntry))


class LatencyEntry(Schema):
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
    latency = List(Nested(LatencyEntry))

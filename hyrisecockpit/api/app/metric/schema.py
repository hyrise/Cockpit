"""Schema for metric namespace.

A schema is responsible for the serialization/deserialization
of a given entity. An entity can be a response from the influxdb
or the database manager. This response can then be deserialized
(load) into a Python entity (model). On the other hand a python
entity (model) can be serialized (dump) to a JSON-encoded string.
For the deserialization, the post_load decorator is used.
For the schemas, we are using the marshmallow library.
The schemas are also used by the controller for documentation.
"""
from marshmallow import Schema, post_load
from marshmallow.fields import Float, Integer, List, Nested, String

from .model import (
    Latency,
    LatencyEntry,
    NegativeThroughput,
    NegativeThroughputEntry,
    QueueLength,
    QueueLengthEntry,
    Throughput,
    ThroughputEntry,
    MemoryFootprint,
    MemoryFootprintEntry,
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


class NegativeThroughputEntrySchema(Schema):
    """Schema of a negative throughput entry."""

    timestamp = Integer(
        title="Timestamp",
        description="Timestamp in nanoseconds since epoch",
        required=True,
        example=1585762457000000000,
    )
    negative_throughput = Float(
        title="Negative throughput",
        description="Negative throughput value",
        required=True,
        example=273.9,
    )

    @post_load
    def make_negative_throughput_entry(self, data, **kwargs):
        """Return a throughput entry object."""
        return NegativeThroughputEntry(**data)


class NegativeThroughputSchema(Schema):
    """Schema of a negative throughput metric."""

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    negative_throughput = List(Nested(NegativeThroughputEntrySchema))

    @post_load
    def make_negative_throughput(self, data, **kwargs):
        """Return a negative throughput object."""
        return NegativeThroughput(**data)


class LatencyEntrySchema(Schema):
    """Schema of a Latency entry."""

    timestamp = Integer(
        title="Latency",
        description="Timestamp in nanoseconds since epoch",
        required=True,
        example=1585762457000000000,
    )
    latency = Float(
        title="Latency",
        description="Latency value",
        required=True,
        example=273.9,
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


class MemoryFootprintEntrySchema(Schema):

    timestamp = Integer(
        title="Queue length",
        description="Timestamp in nanoseconds since epoch",
        required=True,
        example=1585762457000000000,
    )
    memory_footprint = Float(
        title="Memory footprint",
        description="Combined memory size of all tables in database in bytes",
        required=True,
        example=1234.0,
    )

    @post_load
    def make_memory_footprint_entry(self, data, **kwargs):
        return MemoryFootprintEntry(**data)


class MemoryFootprintSchema(Schema):

    id = String(
        title="Database ID",
        description="Used to identify a database.",
        required=True,
        example="hyrise-1",
    )
    memory_footprint = List(Nested(MemoryFootprintEntrySchema))

    @post_load
    def make_memory_footprint(self, data, **kwargs):
        return MemoryFootprint(**data)


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
    scale_factor = Float(
        title="Scale factor",
        description="Scalefactor of the benachmark.",
        required=True,
        example=1.0,
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

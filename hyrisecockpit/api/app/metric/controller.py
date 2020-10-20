"""Controllers for metric namespace.

The controller is responsible for coordinating Flask routes, services, and schemas.
On top, the controller is also responsible to provide the documentation for Swagger.
To provide the documentation for swagger the controller uses the flask_accepts library
in connection with schemas (also used to serialize and deserialize objects) from marshmallow.
The controller uses also models (The model is where the entity itself is defined
in a Python representation)for type safety. All the requests are delegated to the service.
"""
from typing import List

from flask import request
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .model import (
    DetailedQueryInformation,
    Latency,
    NegativeThroughput,
    QueueLength,
    Throughput,
    TimeInterval,
    MemoryFootprint,
)
from .schema import (
    DetailedQueryInformationSchema,
    LatencySchema,
    NegativeThroughputSchema,
    QueueLengthSchema,
    ThroughputSchema,
    MemoryFootprintSchema,
)
from .service import MetricService

api = Namespace("Metric", description="Metric data.")


@api.route("/throughput")
class ThroughputController(Resource):
    """Controller of throughput data."""

    @accepts(
        dict(name="startts", type=int),  # noqa
        dict(name="endts", type=int),  # noqa
        dict(name="precision", type=int),  # noqa
        api=api,
    )
    @responds(schema=ThroughputSchema(many=True), api=api)
    def get(self) -> List[Throughput]:
        """Get throughput data for the requested time interval."""
        time_interval: TimeInterval = TimeInterval(
            startts=request.parsed_args["startts"],  # type: ignore
            endts=request.parsed_args["endts"],  # type: ignore
            precision=request.parsed_args["precision"],  # type: ignore
        )
        return MetricService.get_throughput(time_interval)


@api.route("/negative_throughput")
class NegativeThroughputController(Resource):
    """Controller of negative throughput data."""

    @accepts(
        dict(name="startts", type=int),  # noqa
        dict(name="endts", type=int),  # noqa
        dict(name="precision", type=int),  # noqa
        api=api,
    )
    @responds(schema=NegativeThroughputSchema(many=True), api=api)
    def get(self) -> List[NegativeThroughput]:
        """Get throughput data for the requested time interval."""
        time_interval: TimeInterval = TimeInterval(
            startts=request.parsed_args["startts"],  # type: ignore
            endts=request.parsed_args["endts"],  # type: ignore
            precision=request.parsed_args["precision"],  # type: ignore
        )
        return MetricService.get_negative_throughput(time_interval)


@api.route("/latency")
class LatencyController(Resource):
    """Controller for latency data."""

    @accepts(
        dict(name="startts", type=int),  # noqa
        dict(name="endts", type=int),  # noqa
        dict(name="precision", type=int),  # noqa
        api=api,
    )
    @responds(schema=LatencySchema(many=True), api=api)
    def get(self) -> List[Latency]:
        """Get latency data for the requested time interval."""
        time_interval: TimeInterval = TimeInterval(
            startts=request.parsed_args["startts"],  # type: ignore
            endts=request.parsed_args["endts"],  # type: ignore
            precision=request.parsed_args["precision"],  # type: ignore
        )
        return MetricService.get_latency(time_interval)


@api.route("/queue_length")
class QueueLengthController(Resource):
    """Controller for queue length data."""

    @accepts(
        dict(name="startts", type=int),  # noqa
        dict(name="endts", type=int),  # noqa
        dict(name="precision", type=int),  # noqa
        api=api,
    )
    @responds(schema=QueueLengthSchema(many=True), api=api)
    def get(self) -> List[QueueLength]:
        """Get queue length data for the requested time interval."""
        time_interval: TimeInterval = TimeInterval(
            startts=request.parsed_args["startts"],  # type: ignore
            endts=request.parsed_args["endts"],  # type: ignore
            precision=request.parsed_args["precision"],  # type: ignore
        )
        return MetricService.get_queue_length(time_interval)


@api.route("/memory_footprint")
class MemoryFootprintController(Resource):
    @accepts(
        dict(name="startts", type=int),  # noqa
        dict(name="endts", type=int),  # noqa
        dict(name="precision", type=int),  # noqa
        api=api,
    )
    @responds(schema=MemoryFootprintSchema(many=True), api=api)
    def get(self) -> List[MemoryFootprint]:
        time_interval: TimeInterval = TimeInterval(
            startts=request.parsed_args["startts"],  # type: ignore
            endts=request.parsed_args["endts"],  # type: ignore
            precision=request.parsed_args["precision"],  # type: ignore
        )
        return MetricService.get_memory_footprint(time_interval)


@api.route("/detailed_query_information")
class DetailedQueryInformationController(Resource):
    """Controller for detailed query information."""

    @responds(schema=DetailedQueryInformationSchema(many=True), api=api)
    def get(self) -> List[DetailedQueryInformation]:
        """Get detailed query information."""
        return MetricService.get_detailed_query_information()

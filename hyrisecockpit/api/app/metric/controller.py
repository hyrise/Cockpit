"""Controllers for metrics."""
from flask import request
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import TimeIntervalInterface
from .schema import (
    DetailedQueryInformationSchema,
    LatencySchema,
    QueueLengthSchema,
    ThroughputSchema,
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
    def get(self):
        """Get throughput data for the requested time interval."""
        interface: TimeIntervalInterface = TimeIntervalInterface(
            startts=request.parsed_args["startts"],
            endts=request.parsed_args["endts"],
            precision=request.parsed_args["precision"],
        )
        return MetricService.get_throughput(interface)


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
    def get(self):
        """Get latency data for the requested time interval."""
        interface: TimeIntervalInterface = TimeIntervalInterface(
            startts=request.parsed_args["startts"],
            endts=request.parsed_args["endts"],
            precision=request.parsed_args["precision"],
        )
        return MetricService.get_latency(interface)


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
    def get(self):
        """Get queue length data for the requested time interval."""
        interface: TimeIntervalInterface = TimeIntervalInterface(
            startts=request.parsed_args["startts"],
            endts=request.parsed_args["endts"],
            precision=request.parsed_args["precision"],
        )
        return MetricService.get_queue_length(interface)


@api.route("/detailed_query_information")
class DetailedQueryInformationController(Resource):
    """Controller for detailed query information."""

    @responds(schema=DetailedQueryInformationSchema(many=True), api=api)
    def get(self):
        """Get detailed query information."""
        return MetricService.get_detailed_query_information()

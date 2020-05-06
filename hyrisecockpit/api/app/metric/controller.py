"""Controllers for metrics."""
from flask import request
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import TimeIntervalInterface
from .schema import LatencySchema, ThroughputSchema
from .service import MetricService

api = Namespace("Metric", description="Metric data.")


@api.route("/throughput")
class ThroughputController(Resource):
    """Controller of Throughput data."""

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
    """Controller for Latency data."""

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

"""Controllers for a single and multiple Workloads."""
from typing import List, Union

from flask import request
from flask.wrappers import Response
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import BaseWorkloadInterface
from .model import BaseWorkload, DetailedWorkload, Workload
from .schema import BaseWorkloadSchema, DetailedWorkloadSchema, WorkloadSchema
from .service import WorkloadService

api = Namespace("Workload", description="Control workload execution.")


@api.route("/")
class WorkloadController(Resource):
    """Controller of Workloads."""

    @responds(schema=DetailedWorkloadSchema(many=True), api=api)
    def get(self) -> List[DetailedWorkload]:
        """Get all Workloads."""
        return WorkloadService.get_all()

    @api.response(404, "A Workload with the given type doesn't exist.")
    @accepts(schema=BaseWorkloadSchema, api=api)
    @responds(schema=BaseWorkloadSchema, api=api)
    def post(self) -> Union[BaseWorkload, Response]:
        """Create/update a Workload."""
        interface: BaseWorkloadInterface = request.parsed_obj
        workload = WorkloadService.update_by_id(interface)
        return Response(status=404) if workload is None else workload


@api.response(404, "A Workload with the given folder name does not exist.")
@api.route("/<string:workload_type>")
@api.param("workload_type", "Workload type")
class WorkloadIdController(Resource):
    """Controller of a Workload."""

    @responds(schema=WorkloadSchema, api=api)
    def get(self, workload_type: str) -> Union[Workload, Response]:
        """Get a Workload."""
        workload = WorkloadService.get_by_id(workload_type)
        return Response(status=404) if workload is None else workload

    def delete(self, workload_type: str) -> Response:
        """Delete a Workload."""
        return (
            Response(status=200)
            if WorkloadService.delete_by_id(workload_type)
            else Response(status=404)
        )

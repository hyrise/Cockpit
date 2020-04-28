"""Controllers for a single and multiple Workloads."""
from typing import List, Union

from flask import request
from flask.wrappers import Response
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import DetailedWorkloadInterface, WorkloadInterface
from .model import DetailedWorkload, Workload
from .schema import DetailedWorkloadSchema, WorkloadSchema
from .service import WorkloadService

api = Namespace("Workload", description="Control workload execution.")


@api.route("/")
class WorkloadController(Resource):
    """Controller of Workloads."""

    @responds(schema=WorkloadSchema(many=True), api=api)
    def get(self) -> List[Workload]:
        """Get all Workloads."""
        return WorkloadService.get_all()

    @api.response(409, "A Workload with the given folder name already exists.")
    @accepts(schema=WorkloadSchema, api=api)
    @responds(schema=WorkloadSchema, api=api)
    def post(self) -> Union[Workload, Response]:
        """Create a Workload."""
        interface: WorkloadInterface = request.parsed_obj
        workload = WorkloadService.create(interface)
        return Response(status=409) if workload is None else workload


@api.response(404, "A Workload with the given folder name does not exist.")
@api.route("/<string:folder_name>")
@api.param("folder_name", "Workload folder name")
class WorkloadIdController(Resource):
    """Controller of a Workload."""

    @responds(schema=DetailedWorkloadSchema, api=api)
    def get(self, folder_name: str) -> Union[DetailedWorkload, Response]:
        """Get a Workload."""
        workload = WorkloadService.get_by_id(folder_name)
        return Response(status=404) if workload is None else workload

    def delete(self, folder_name: str) -> Response:
        """Delete a Workload."""
        return (
            Response(status=200)
            if WorkloadService.delete_by_id(folder_name)
            else Response(status=404)
        )

    @accepts(schema=DetailedWorkloadSchema, api=api)
    @responds(schema=DetailedWorkloadSchema, api=api)
    def put(self, folder_name: str) -> Union[DetailedWorkload, Response]:
        """Update a Workload."""
        interface: DetailedWorkloadInterface = request.parsed_obj
        workload = WorkloadService.update_by_id(folder_name, interface)
        return Response(status=404) if workload is None else workload

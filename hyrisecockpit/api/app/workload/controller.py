"""Controllers for a single and multiple Workloads."""
from typing import List, Union

from flask import request
from flask.wrappers import Response
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import WorkloadInterface
from .model import Workload
from .schema import WorkloadSchema
from .service import WorkloadService

api = Namespace("Workload", description="Control workload execution.")


@api.route("/")
class WorkloadController(Resource):
    """Controller of Workloads."""

    @responds(schema=WorkloadSchema(many=True), api=api)
    def get(self) -> List[Workload]:
        """Get all Workloads."""
        return WorkloadService.get_all()

    @api.response(409, "A Workload with the given ID already exists.")
    @accepts(schema=WorkloadSchema, api=api)
    @responds(schema=WorkloadSchema, api=api)
    def post(self) -> Union[Workload, Response]:
        """Create a Workload."""
        workload = WorkloadService.create(request.parsed_obj)
        if workload is None:
            return Response(status=409)
        else:
            return workload


@api.response(404, "A Workload with the given ID doesn't exist.")
@api.route("/<string:workload_id>")
@api.param("workload_id", "Workload ID")
class WorkloadIdController(Resource):
    """Controller of a Workload."""

    @responds(schema=WorkloadSchema, api=api)
    def get(self, workload_id: str) -> Union[Workload, Response]:
        """Get a Workload."""
        workload = WorkloadService.get_by_id(workload_id)
        if workload is None:
            return Response(status=404)
        else:
            return workload

    @api.response(404, "A Workload with the given ID doesn't exist.")
    def delete(self, workload_id: str) -> Response:
        """Delete a Workload."""
        if WorkloadService.delete_by_id(workload_id):
            return Response(status=200)
        else:
            return Response(status=404)

    @api.response(404, "A Workload with the given ID doesn't exist.")
    @accepts(schema=WorkloadSchema, api=api)
    @responds(schema=WorkloadSchema, api=api)
    def put(self, workload_id: str) -> Union[Workload, Response]:
        """Update a Workload."""
        changes: WorkloadInterface = request.parsed_obj
        workload = WorkloadService.update(workload_id, changes)
        if workload is None:
            return Response(status=404)
        else:
            return workload

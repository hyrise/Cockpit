"""Controllers for a single and multiple Workloads."""
from typing import List

from flask import jsonify, request
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

    @accepts(schema=WorkloadSchema, api=api)
    @responds(schema=WorkloadSchema, api=api)
    def post(self) -> Workload:
        """Create a Workload."""
        return WorkloadService.create(request.parsed_obj)


@api.route("/<string:workload_id>")
@api.param("workload_id", "Workload database ID")
class WorkloadIdController(Resource):
    """Controller of a Workload."""

    @responds(schema=WorkloadSchema, api=api)
    def get(self, workload_id: str) -> Workload:
        """Get a Workload."""
        return WorkloadService.get_by_id(workload_id)

    def delete(self, workload_id: str) -> Response:
        """Delete a Workload."""
        id = WorkloadService.delete_by_id(workload_id)
        return jsonify({"status": "Success", "id": id})

    @accepts(schema=WorkloadSchema, api=api)
    @responds(schema=WorkloadSchema, api=api)
    def put(self, workload_id: str) -> Workload:
        """Update a Workload."""
        changes: WorkloadInterface = request.parsed_obj
        workload = WorkloadService.get_by_id(workload_id)
        return WorkloadService.update(workload, changes)

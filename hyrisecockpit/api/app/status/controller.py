"""Controllers for status information."""
from typing import List

from flask_accepts import responds
from flask_restx import Namespace, Resource

from .model import DatabaseStatus, FailedTask, WorkloadStatus
from .schema import DatabaseStatusSchema, FailedTaskSchema, WorkloadStatusSchema
from .service import StatusService

api = Namespace("status", description="Get status information.")


@api.route("/database")
class DatabaseStatusController(Resource):
    """Controller for returning the database object status."""

    @responds(schema=DatabaseStatusSchema(many=True), api=api)
    def get(self) -> List[DatabaseStatus]:
        """Get status for all database objects."""
        return StatusService.get_database_status()


@api.route("/workload")
class WorkloadStatusController(Resource):
    """Controller for returning the loaded benchmark and tables."""

    @responds(schema=WorkloadStatusSchema(many=True), api=api)
    def get(self) -> List[WorkloadStatus]:
        """Get status of loaded benchmark or tables."""
        return StatusService.get_workload_status()


@api.route("/failed_tasks")
class FailedTaskController(Resource):
    """Controller for returning failed tasks."""

    @responds(schema=FailedTaskSchema(many=True), api=api)
    def get(self) -> List[FailedTask]:
        """Get all failed tasks."""
        return StatusService.get_failed_tasks()

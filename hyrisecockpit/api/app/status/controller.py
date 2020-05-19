"""Controllers for status information."""
from typing import List

from flask_accepts import responds
from flask_restx import Namespace, Resource

from .model import FailedTask, HyriseStatus
from .schema import FailedTaskSchema, HyriseStatusSchema
from .service import StatusService

api = Namespace("Meta Information", description="Get hyrise meta information.")


@api.route("/hyrise")
class HyriseStatusController(Resource):
    """Controller for returning the hyrise status."""

    @responds(schema=HyriseStatusSchema(many=True), api=api)
    def get(self) -> List[HyriseStatus]:
        """Get status for all hyrise instances."""
        return StatusService.get_hyrise_status()


@api.route("/failed_tasks")
class FailedTaskController(Resource):
    """Controller for returning failed tasks."""

    @responds(schema=FailedTaskSchema(many=True), api=api)
    def get(self) -> List[FailedTask]:
        """Get all failed tasks."""
        return StatusService.get_failed_tasks()

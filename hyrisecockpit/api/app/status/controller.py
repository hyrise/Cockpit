"""Controllers for status information."""
from typing import List

from flask_accepts import responds
from flask_restx import Namespace, Resource

from .model import FailedTask
from .schema import FailedTaskSchema
from .service import MetaInformationService

api = Namespace("Meta Information", description="Get hyrise meta information.")


@api.route("/failed_tasks")
class FailedTaskController(Resource):
    """Controller for returning failed tasks."""

    @responds(schema=FailedTaskSchema(many=True), api=api)
    def get(self) -> List[FailedTask]:
        """Get all failed tasks."""
        return MetaInformationService.get_failed_tasks()

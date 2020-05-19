"""Controllers for status information."""
from typing import List

from flask_accepts import responds
from flask_restx import Namespace, Resource

from .model import BenchmarkStatus, DatabaseStatus, FailedTask, HyriseStatus
from .schema import (
    BenchmarkStatusSchema,
    DatabaseStatusSchema,
    FailedTaskSchema,
    HyriseStatusSchema,
)
from .service import StatusService

api = Namespace("status", description="Get status information.")


@api.route("/hyrise")
class HyriseStatusController(Resource):
    """Controller for returning the hyrise status."""

    @responds(schema=HyriseStatusSchema(many=True), api=api)
    def get(self) -> List[HyriseStatus]:
        """Get status for all hyrise instances."""
        return StatusService.get_hyrise_status()


@api.route("/database")
class DatabaseStatusController(Resource):
    """Controller for returning the database object status."""

    @responds(schema=DatabaseStatusSchema(many=True), api=api)
    def get(self) -> List[DatabaseStatus]:
        """Get status for all database objects."""
        return StatusService.get_database_status()


@api.route("/benchmark")
class BenchmarkStatusController(Resource):
    """Controller for returning the loaded benchmark and tables."""

    @responds(schema=BenchmarkStatusSchema(many=True), api=api)
    def get(self) -> List[BenchmarkStatus]:
        """Get status of loaded benchmark or tables."""
        return StatusService.get_benchmark_status()


@api.route("/failed_tasks")
class FailedTaskController(Resource):
    """Controller for returning failed tasks."""

    @responds(schema=FailedTaskSchema(many=True), api=api)
    def get(self) -> List[FailedTask]:
        """Get all failed tasks."""
        return StatusService.get_failed_tasks()

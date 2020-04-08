"""Controllers for multiple databases."""
from typing import List

from flask_accepts import responds
from flask_restx import Namespace, Resource

from .model import DetailedDatabase
from .schema import DetailedDatabaseSchema
from .service import ControlService

api = Namespace("Control", description="Control multiple databases at once.")


@api.route("/database")
class Databases(Resource):
    """Controller for access and register databases."""

    @responds(
        schema=DetailedDatabaseSchema(
            many=True, only=("id", "host", "port", "number_workers", "dbname",)
        ),
        api=api,
    )
    def get(self) -> List[DetailedDatabase]:
        """Get all Workloads."""
        return ControlService.get_databases()

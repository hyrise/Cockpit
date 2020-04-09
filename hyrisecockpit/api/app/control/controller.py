"""Controllers for multiple databases."""
from typing import List

from flask import request
from flask.wrappers import Response
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .model import AvailableBenchmarkTables, DetailedDatabase
from .schema import (
    AvailableBenchmarkTablesSchema,
    BenchmarkTablesSchema,
    DatabaseSchmea,
    DetailedDatabaseSchema,
)
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

    @accepts(schema=DetailedDatabaseSchema, api=api)
    def post(self) -> Response:
        """Register new database."""
        status_code = ControlService.register_database(request.parsed_obj)
        return Response(status=status_code)

    @accepts(schema=DatabaseSchmea, api=api)
    def delete(self) -> Response:
        """De-register database."""
        status_code = ControlService.deregister_database(request.parsed_obj)
        return Response(status=status_code)


@api.route("/data")
class Data(Resource):
    """Manage data in databases."""

    @responds(schema=AvailableBenchmarkTablesSchema, api=api)
    def get(self) -> AvailableBenchmarkTables:
        """Return all pre-generated tables that can be loaded."""
        return ControlService.get_available_benchmark_tables()

    @accepts(schema=BenchmarkTablesSchema, api=api)
    def post(self) -> Response:
        """Load benchmark tables."""
        status_code = ControlService.load_benchmark_tables(request.parsed_obj)
        return Response(status=status_code)

    @accepts(schema=BenchmarkTablesSchema, api=api)
    def delete(self) -> Response:
        """Delete benchmark tables."""
        status_code = ControlService.delete_benchmark_tables(request.parsed_obj)
        return Response(status=status_code)

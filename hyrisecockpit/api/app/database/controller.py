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
from .service import DatabaseService

api = Namespace("Database", description="Control multiple databases at once.")


@api.route("/")
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
        return DatabaseService.get_databases()

    @accepts(schema=DetailedDatabaseSchema, api=api)
    def post(self) -> Response:
        """Register new database."""
        status_code = DatabaseService.register_database(request.parsed_obj)
        return Response(status=status_code)

    @accepts(schema=DatabaseSchmea, api=api)
    def delete(self) -> Response:
        """De-register database."""
        status_code = DatabaseService.deregister_database(request.parsed_obj)
        return Response(status=status_code)


@api.route("/data")
class Data(Resource):
    """Manage data in databases."""

    @responds(schema=AvailableBenchmarkTablesSchema, api=api)
    def get(self) -> AvailableBenchmarkTables:
        """Return all pre-generated tables that can be loaded."""
        return DatabaseService.get_available_benchmark_tables()

    @accepts(schema=BenchmarkTablesSchema, api=api)
    def post(self) -> Response:
        """Load benchmark tables."""
        status_code = DatabaseService.load_benchmark_tables(request.parsed_obj)
        return Response(status=status_code)

    @accepts(schema=BenchmarkTablesSchema, api=api)
    def delete(self) -> Response:
        """Delete benchmark tables."""
        status_code = DatabaseService.delete_benchmark_tables(request.parsed_obj)
        return Response(status=status_code)

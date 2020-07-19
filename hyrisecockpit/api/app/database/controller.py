"""Controllers for multiple databases."""
from typing import List

from flask import request
from flask.wrappers import Response
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import (
    DatabaseInterface,
    DetailedDatabaseInterface,
    WorkloadTablesInterface,
)
from .model import AvailableWorkloadTables, DetailedDatabase
from .schema import (
    AvailableWorkloadTablesSchema,
    DatabaseSchema,
    DetailedDatabaseSchema,
    WorkloadTablesSchema,
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
        """Get all databases."""
        return DatabaseService.get_databases()

    @accepts(schema=DetailedDatabaseSchema, api=api)
    def post(self) -> Response:
        """Register new database."""
        interface: DetailedDatabaseInterface = DetailedDatabaseInterface(
            id=request.parsed_obj.id,
            host=request.parsed_obj.host,
            port=request.parsed_obj.port,
            number_workers=request.parsed_obj.number_workers,
            dbname=request.parsed_obj.dbname,
            user=request.parsed_obj.user,
            password=request.parsed_obj.password,
        )
        status_code = DatabaseService.register_database(interface)
        return Response(status=status_code)

    @accepts(schema=DatabaseSchema, api=api)
    def delete(self) -> Response:
        """De-register database."""
        interface: DatabaseInterface = DatabaseInterface(id=request.parsed_obj.id)
        status_code = DatabaseService.deregister_database(interface)
        return Response(status=status_code)


@api.route("/workload_tables")
class WorkloadTables(Resource):
    """Manage data in databases."""

    @responds(schema=AvailableWorkloadTablesSchema, api=api)
    def get(self) -> AvailableWorkloadTables:
        """Return all pre-generated tables that can be loaded."""
        return DatabaseService.get_available_workload_tables()

    @accepts(schema=WorkloadTablesSchema, api=api)
    def post(self) -> Response:
        """Load workload tables."""
        interface: WorkloadTablesInterface = WorkloadTablesInterface(
            workload_type=request.parsed_obj.workload_type,
            scale_factor=request.parsed_obj.scale_factor,
        )
        status_code = DatabaseService.load_workload_tables(interface)
        return Response(status=status_code)

    @accepts(schema=WorkloadTablesSchema, api=api)
    def delete(self) -> Response:
        """Delete workload tables."""
        interface: WorkloadTablesInterface = WorkloadTablesInterface(
            workload_type=request.parsed_obj.workload_type,
            scale_factor=request.parsed_obj.scale_factor,
        )
        status_code = DatabaseService.delete_workload_tables(interface)
        return Response(status=status_code)


@api.route("/worker")
class Worker(Resource):
    """Manage start and stop of worker pool at all databases."""

    def post(self) -> Response:
        """Start worker pool for all databases."""
        status_code = DatabaseService.start_worker_pool()
        return Response(status=status_code)

    def delete(self) -> Response:
        """Start worker pool for all databases."""
        status_code = DatabaseService.close_worker_pool()
        return Response(status=status_code)

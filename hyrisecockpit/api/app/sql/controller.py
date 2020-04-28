"""Controllers for sql commands."""
from typing import Optional, Union

from flask import request
from flask.wrappers import Response
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import SqlQueryInterface
from .model import SqlResponse
from .schema import SqlQuerySchema, SqlResponseSchema
from .service import SqlService

api = Namespace("SQL", description="SQL execution.")


@api.route("/")
class Sql(Resource):
    """Execute SQL query on database."""

    @api.response(404, "Database not found.")
    @accepts(schema=SqlQuerySchema, api=api)
    @responds(schema=SqlResponseSchema, api=api)
    def post(self) -> Union[Optional[Response], SqlResponse]:
        """Execute SQL query."""
        interface: SqlQueryInterface = SqlQueryInterface(
            id=request.parsed_obj.id, query=request.parsed_obj.query
        )
        response, status_code = SqlService.execute_sql(interface)
        if status_code == 200:
            return response
        return Response(status=status_code)

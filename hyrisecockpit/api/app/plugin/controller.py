"""Controllers for activating and deactivating Plugins."""
from typing import List, Union

from flask import request
from flask.wrappers import Response
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import PluginInterface
from .model import Plugin
from .schema import PluginSchema
from .service import PluginService

api = Namespace("Plugin", description="Control plugin execution.")


@api.route("/")
class PluginController(Resource):
    """Controller of Plugins."""

    @responds(schema=PluginSchema(many=True), api=api)
    def get(self) -> List[Plugin]:
        """Get all Plugins from all databases."""
        return PluginService.get_all()  # type: ignore


@api.response(404, "A database with the given ID does not exist.")
@api.response(423, "The plugin can't be activated because the database is blocked.")
@api.route("/<string:database_id>")
@api.param("database_id", "Database ID")
class PluginIdController(Resource):
    """Controller of a Plugin."""

    @accepts(schema=PluginSchema, api=api)
    def post(self, database_id: str) -> Union[Plugin, Response]:
        """Activate a Plugin."""
        interface: PluginInterface = request.parsed_obj
        status = PluginService.activate_by_id(database_id, interface)
        if status in {200, 404, 423}:
            return Response(status=status)
        else:
            raise NotImplementedError()

    @accepts(schema=PluginSchema, api=api)
    def delete(self, database_id: str) -> Response:
        """Deactivate a Plugin."""
        interface: PluginInterface = request.parsed_obj
        status = PluginService.deactivate_by_id(database_id, interface)
        if status in {200, 404, 423}:
            return Response(status=status)
        else:
            raise NotImplementedError()

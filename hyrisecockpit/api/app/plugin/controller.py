"""Controllers for activating and deactivating Plugins."""
from typing import List

from flask import request
from flask.wrappers import Response
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import (
    DetailedPluginInterface,
    PluginIDInterface,
    PluginInterface,
    PluginSettingBaseInterface,
    PluginSettingInterface,
)
from .schema import (
    DetailedPluginSchema,
    PluginIDSchema,
    PluginSchema,
    PluginSettingBaseSchema,
    PluginSettingSchema,
)
from .service import PluginService

api = Namespace("Plugin", description="Control Plugins per database.")


@api.route("/")
class PluginController(Resource):
    """Controller of Plugins."""

    @responds(schema=PluginIDSchema(many=True), api=api)
    def get(self) -> List[PluginIDInterface]:
        """Get all Plugins from all databases."""
        response = PluginService.get_all()
        if isinstance(response, int):
            raise ValueError()
        else:
            return response


@api.response(404, "A database with the given ID does not exist.")
@api.response(423, "The Plugin can't be activated because the database is blocked.")
@api.route("/<string:database_id>")
@api.param("database_id", "Database ID")
class PluginIdController(Resource):
    """Controller of a Plugin per database."""

    @responds(schema=DetailedPluginSchema, api=api)
    def get(self, database_id: str) -> DetailedPluginInterface:
        """Get all settings of a Plugin in a database."""
        pass

    @accepts(schema=PluginSchema, api=api)
    def post(self, database_id: str) -> Response:
        """Activate a Plugin in a database."""
        interface: PluginInterface = request.parsed_obj
        status = PluginService.activate_by_id(database_id, interface)
        if status in {200, 404, 423}:
            return Response(status=status)
        else:
            raise ValueError()

    @accepts(schema=PluginSchema, api=api)
    def delete(self, database_id: str) -> Response:
        """Deactivate a Plugin in a database."""
        interface: PluginInterface = request.parsed_obj
        status = PluginService.deactivate_by_id(database_id, interface)
        if status in {200, 404, 423}:
            return Response(status=status)
        else:
            raise ValueError()

    @accepts(schema=PluginSettingBaseSchema, api=api)
    @responds(schema=PluginSettingSchema, api=api)
    def put(self, database_id: str) -> PluginSettingInterface:  # type: ignore
        """Set a setting of a Plugin in a database."""
        interface: PluginSettingBaseInterface = request.parsed_obj  # noqa: F841
        pass

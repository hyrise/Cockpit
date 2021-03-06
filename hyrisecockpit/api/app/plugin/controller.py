"""Controllers for activating and deactivating Plugins."""
from typing import List, Union

from flask import request
from flask.wrappers import Response
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .interface import PluginInterface, UpdatePluginSettingInterface
from .model import DetailedPluginID, LogID, Plugin
from .schema import (
    DetailedPluginIDSchema,
    LogIDSchema,
    PluginSchema,
    UpdatePluginSettingSchema,
)
from .service import PluginService

api = Namespace("Plugin", description="Control Plugins per database.")


@api.route("/")
class PluginController(Resource):
    """Controller of Plugins."""

    @responds(schema=DetailedPluginIDSchema(many=True), api=api)
    def get(self) -> Union[Response, List[DetailedPluginID]]:
        """Get all Plugins from all databases."""
        response = PluginService.get_all()
        if not isinstance(response, int):
            return response
        api.logger.error(f"Response status code: {response}.")
        return Response(status=500)


@api.response(404, "A database with the given ID does not exist.")
@api.response(406, "Plug-in name not valid.")
@api.response(423, "The Plug-in can't be activated because the database is blocked.")
@api.route("/<string:database_id>")
@api.param("database_id", "Database ID")
class PluginIdController(Resource):
    """Controller of a Plugin per database."""

    @accepts(schema=PluginSchema, api=api)
    def post(self, database_id: str) -> Response:
        """Activate a Plugin in a database."""
        interface: PluginInterface = request.parsed_obj  # type: ignore
        status = PluginService.activate_by_id(database_id, interface)
        if status in {200, 404, 406, 423}:
            return Response(status=status)
        api.logger.error(f"Response status code: {status}.")
        return Response(status=500)

    @accepts(schema=PluginSchema, api=api)
    def delete(self, database_id: str) -> Response:
        """Deactivate a Plugin in a database."""
        interface: PluginInterface = request.parsed_obj  # type: ignore
        status = PluginService.deactivate_by_id(database_id, interface)
        if status in {200, 404, 423}:
            return Response(status=status)
        api.logger.error(f"Response status code: {status}.")
        return Response(status=500)

    @accepts(schema=UpdatePluginSettingSchema, api=api)
    def put(self, database_id: str) -> Response:
        """Set a setting of a Plugin in a database."""
        interface: UpdatePluginSettingInterface = request.parsed_obj  # type: ignore
        status = PluginService.update_plugin_setting(database_id, interface)
        if status in {200, 404, 423}:
            return Response(status=status)
        api.logger.error(f"Response status code: {status}.")
        return Response(status=500)


@api.route("/available")
class AvailablePluginController(Resource):
    """Controller of available Plugins."""

    @responds(schema=PluginSchema(many=True), api=api)
    def get(self) -> List[Plugin]:
        """Get all available Plugins."""
        return PluginService.get_available_plugins()


@api.route("/log")
class PluginLogController(Resource):
    """Controller of Plugin Logs."""

    @responds(schema=LogIDSchema(many=True), api=api)
    def get(self) -> List[LogID]:
        """Get the Plugin Log of all databases."""
        return PluginService.get_all_plugin_logs()


@api.route("/log/<string:level>")
@api.param("level", "Log Level")
class PluginLogLevelController(Resource):
    """Controller of Plugin Logs by Level."""

    @responds(schema=LogIDSchema(many=True), api=api)
    def get(self, level: str) -> List[LogID]:
        """Get the Plugin Log with a given log level of all databases."""
        return PluginService.get_all_plugin_logs(level=level)

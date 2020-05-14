"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from typing import Dict, List, Union

from flask_restx import Namespace, Resource, fields

from hyrisecockpit.api.app.shared import (
    _get_active_databases,
    _send_message,
    db_manager_socket,
    storage_connection,
)
from hyrisecockpit.plugins import available_plugins
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

api = Namespace("control", description="Control multiple databases at once.")

model_database = api.model(
    "Database",
    {
        "id": fields.String(
            title="Database ID",
            description="Used to identify a database.",
            required=True,
            example="hyrise-1",
        )
    },
)


modelhelper_plugin = fields.String(
    title="Plugin name",
    description="Used to identify a plugin.",
    required=True,
    example="Clustering",
)

model_plugin_log = api.clone(
    "Plugin Log",
    model_database,
    {
        "plugin_log": fields.List(
            fields.Nested(
                api.model(
                    "Plugin Log Entry",
                    {
                        "timestamp": fields.Integer(
                            title="Timestamp",
                            description="Timestamp in nanoseconds.",
                            required=True,
                            example=1583847966784,
                        ),
                        "reporter": fields.String(
                            title="Reporter",
                            description="Plugin reporting to the log.",
                            required=True,
                            example="CompressionPlugin",
                        ),
                        "message": fields.String(
                            title="Message",
                            description="Message logged.",
                            required=True,
                            example="No optimization possible with given parameters!",
                        ),
                        "level": fields.String(
                            title="Level",
                            description="Level of the log message.",
                            required=True,
                            example="Warning",
                        ),
                    },
                )
            ),
            required=True,
        )
    },
)

model_get_all_plugins = api.model(
    "Available Plugins", {"plugins": fields.List(modelhelper_plugin, required=True,)},
)

model_get_activated_plugins = api.clone(
    "Activated Plugins",
    model_database,
    {"plugins": fields.List(modelhelper_plugin, required=True,)},
)

model_activate_plugin = api.clone(
    "Activate Plugin", model_database, {"plugin": modelhelper_plugin},
)

model_deactivate_plugin = api.clone(
    "Deactivate Plugin", model_database, {"plugin": modelhelper_plugin},
)

model_plugin_setting = api.clone(
    "Set Plugin Setting",
    model_database,
    {
        "name": fields.String(
            title="Setting name",
            description="Name of the setting that shall be set.",
            required=True,
            example="CompressionPlugin_MemoryBudget",
        ),
        "value": fields.String(
            title="Setting value",
            description="Value the setting should have.",
            required=True,
            example="5000",
        ),
    },
)

model_get_plugin_setting = api.clone(
    "Get Plugin Setting",
    model_plugin_setting,
    {
        "description": fields.String(
            title="Setting description",
            description="Description of the plugin setting.",
            required=True,
            example="The memory budget to target for the Compression...",
        ),
    },
)

modelhelper_sql = fields.String(
    title="SQL query",
    description="Sql query to execute on database.",
    required=True,
    example="SELECT 1;",
)

model_execute_sql = api.clone(
    "Execute SQL query", model_database, {"query": modelhelper_sql},
)


model_execute_sql_results = api.clone(
    "Query results",
    model_database,
    {
        "successful": fields.Boolean(
            title="Successful execution",
            description="Description if there was an error while executing.",
            required=True,
            example=True,
        ),
        "results": fields.List(
            fields.List(fields.String()),
            title="Results",
            description="Results from query execution.",
            required=True,
            example=[
                ["1", "100", "abc'def"],
                ["2", "None", "dada"],
                ["3", "42", "bar"],
            ],
        ),
        "col_names": fields.List(
            fields.String(
                title="Column Names",
                description="List of column names.",
                required=False,
                example="names",
            )
        ),
        "error_message": fields.String(
            title="Error message",
            description="Error message if query execution wasn't successful.",
            required=False,
            example="Table not found",
        ),
    },
)


@api.route("/available_plugins")
class ActivatedPlugin(Resource):
    """Get all available Plugins."""

    @api.doc(model=model_get_all_plugins)
    def get(self) -> List[str]:
        """Return available plugins."""
        return available_plugins


@api.route("/plugin")
class Plugin(Resource):
    """Activate, Deactive Plugins, respectively show which ones are activated."""

    @api.doc(model=[model_get_activated_plugins])
    def get(self) -> Union[Dict, List[Dict[str, List[str]]]]:
        """Return activated plugins in each database."""
        message = Request(header=Header(message="get plugins"), body={})
        response = _send_message(db_manager_socket, message)
        return response["body"]["plugins"]

    @api.doc(body=model_activate_plugin)
    def post(self) -> Response:
        """Activate a plugin in a database."""
        message = Request(
            header=Header(message="activate plugin"),
            body={"id": api.payload["id"], "plugin": api.payload["plugin"]},
        )
        response = _send_message(db_manager_socket, message)
        return response

    @api.doc(body=model_deactivate_plugin)
    def delete(self) -> Response:
        """Deactivate a plugin in a database."""
        message = Request(
            header=Header(message="deactivate plugin"),
            body={"id": api.payload["id"], "plugin": api.payload["plugin"]},
        )
        response = _send_message(db_manager_socket, message)
        return response


@api.route("/plugin_log")
class PluginLog(Resource):
    """Activate, Deactive Plugins, respectively show which ones are activated."""

    @api.doc(model=[model_plugin_log])
    def get(self) -> List[Dict[str, Union[str, List[Dict[str, Union[str, int]]]]]]:
        """Return activated plugins in each database."""
        return [
            {
                "id": database,
                "plugin_log": [
                    {
                        "timestamp": row["timestamp"],
                        "reporter": row["reporter"],
                        "message": row["message"],
                        "level": row["level"],
                    }
                    for row in list(
                        storage_connection.query(
                            "SELECT timestamp, reporter, message, level from plugin_log;",
                            database=database,
                        )["plugin_log", None]
                    )
                ],
            }
            for database in _get_active_databases()
        ]


@api.route("/plugin_settings")
class PluginSettings(Resource):
    """Set settings for plugins."""

    @api.doc(model=[model_get_plugin_setting])  # TODO: fix model
    def get(self) -> Response:
        """Read settings for plugins."""
        message = Request(header=Header(message="get plugin setting"), body={},)
        response = _send_message(db_manager_socket, message)
        return response

    @api.doc(body=model_plugin_setting)
    def post(self) -> Response:
        """Set settings for plugins."""
        message = Request(
            header=Header(message="set plugin setting"),
            body={
                "id": api.payload["id"],
                "name": api.payload["name"],
                "value": api.payload["value"],
            },
        )
        response = _send_message(db_manager_socket, message)
        return response

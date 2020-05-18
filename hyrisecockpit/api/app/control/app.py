"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from typing import Dict, List, Union

from flask_restx import Namespace, Resource, fields

from hyrisecockpit.api.app.shared import _get_active_databases, storage_connection
from hyrisecockpit.plugins import available_plugins

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


@api.route("/available_plugins")
class AvailablePlugin(Resource):
    """Get all available Plugins."""

    @api.doc(model=model_get_all_plugins)
    def get(self) -> List[str]:
        """Return available plugins."""
        return available_plugins


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
                        "timestamp": int(row["timestamp"]),
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

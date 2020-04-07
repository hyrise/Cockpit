"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from typing import Dict, List, Union

from flask_restx import Namespace, Resource, fields

from hyrisecockpit.api.app.shared import (
    _add_active_database,
    _get_active_databases,
    _remove_active_database,
    _send_message,
    db_manager_socket,
    generator_socket,
    storage_connection,
)
from hyrisecockpit.plugins import available_plugins
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response, get_error_response, get_response

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

model_data = api.model(
    "Data",
    {
        "folder_name": fields.String(
            title="Folder name",
            description="Name of the folder containing the pregenerated tables.",
            required=True,
            example="tpch_0.1",
        )
    },
)

model_storage = api.model(
    "storage",
    {
        fields.String(
            title="Database ID",
            description="Used to identify a database.",
            required=True,
            example="hyrise-1",
        ): {
            fields.String(
                title="Tablename",
                description="Name of the table.",
                required=True,
                example="aka_name",
            ): {
                "size": fields.Integer(
                    title="Size",
                    description="Estimated size of the table given in bytes.",
                    required=True,
                    example="2931788734",
                ),
                "number_columns": fields.Integer(
                    title="Number of columns",
                    description="Number of columns of the table.",
                    required=True,
                    example="112",
                ),
                "data": {
                    "column_name": {
                        "size": fields.Integer(
                            title="Size",
                            description="Estimated size of the column given in bytes.",
                            required=True,
                            example="8593371",
                        ),
                        "encoding": fields.String(
                            title="Encoding",
                            description="Encodings of the column.",
                            required=True,
                            example="Dictionary",
                        ),
                        "data_type": fields.String(
                            title="Datatype",
                            description="Datatype of the column.",
                            required=True,
                            example="String",
                        ),
                    }
                },
            }
        }
    },
)

model_control_database = api.model(
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

model_get_database = api.clone(
    "Get Database",
    model_control_database,
    {
        "host": fields.String(
            title="Host",
            description="Host to log in to.",
            required=True,
            example="vm.example.com",
        ),
        "port": fields.String(
            title="Port",
            description="Port of the host to log in to.",
            required=True,
            example="1234",
        ),
        "number_workers": fields.Integer(
            title="Number of initial database worker processes.",
            description="",
            required=True,
            example=8,
        ),
        "dbname": fields.String(
            title="",
            description="Name of the database to log in to.",
            required=True,
            example="mydb",
        ),
    },
)

model_add_database = api.clone(
    "Add Database",
    model_get_database,
    {
        "user": fields.String(
            title="Username",
            description="Username used to log in.",
            required=True,
            example="user123",
        ),
        "password": fields.String(
            title="Password",
            description="Password used to log in.",
            required=True,
            example="password123",
        ),
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


@api.route("/database", methods=["GET", "POST", "DELETE"])
class Database(Resource):
    """Manages databases."""

    @api.doc(model=[model_get_database])
    def get(self) -> Response:
        """Get all databases."""
        message = Request(header=Header(message="get databases"), body={})
        response = _send_message(db_manager_socket, message)
        return response["body"]["databases"]

    @api.doc(body=model_add_database)
    def post(self) -> Response:
        """Add a database."""
        message = Request(
            header=Header(message="add database"),
            body={
                "number_workers": api.payload["number_workers"],
                "id": api.payload["id"],
                "user": api.payload["user"],
                "password": api.payload["password"],
                "host": api.payload["host"],
                "port": api.payload["port"],
                "dbname": api.payload["dbname"],
            },
        )
        response = _send_message(db_manager_socket, message)
        if response["header"]["status"] == 200:
            _add_active_database(api.payload["id"])
        return response

    @api.doc(body=model_control_database)
    def delete(self) -> Response:
        """Delete a database."""
        message = Request(
            header=Header(message="delete database"), body={"id": api.payload["id"]},
        )
        response = _send_message(db_manager_socket, message)
        if response["header"]["status"] == 200:
            _remove_active_database(api.payload["id"])
        return response


@api.route("/workload", methods=["POST", "DELETE"])
class Workload(Resource):
    """Manages workload generation."""

    def post(self) -> Response:
        """Start the workload generator."""
        message = Request(header=Header(message="start worker"), body={})
        response = _send_message(db_manager_socket, message)
        if response["header"]["status"] != 200:
            return get_error_response(
                400, response["body"].get("error", "Error during starting of worker")
            )

        message = Request(
            header=Header(message="start workload"),
            body={
                "folder_name": api.payload["folder_name"],
                "frequency": api.payload.get("frequency", 200),
            },
        )
        response = _send_message(generator_socket, message)
        if response["header"]["status"] != 200:
            return get_error_response(
                400,
                response["body"].get("error", "Error during starting of the workload"),
            )

        return get_response(200)

    def delete(self) -> Response:
        """Stop the workload generator and empty database queues."""
        message = Request(header=Header(message="stop workload"), body={})
        response = _send_message(generator_socket, message)
        if response["header"]["status"] != 200:
            return get_error_response(
                400, response["body"].get("error", "Error during stopping of generator")
            )

        message = Request(header=Header(message="close worker"), body={})
        response = _send_message(db_manager_socket, message)
        if response["header"]["status"] != 200:
            return get_error_response(
                400, response["body"].get("error", "Error during closing of worker")
            )

        return response


@api.route("/data")
class Data(Resource):
    """Manage data in databases."""

    @api.doc(model=[model_data])
    def get(self) -> List[str]:
        """Return all pregenerated tables that can be loaded."""
        return ["tpch_0.1", "tpch_1", "tpcds_1", "job"]

    # @api.doc(body=model_data)
    def post(self) -> Response:
        """Load pregenerated tables for all databases."""
        message = Request(
            header=Header(message="load data"),
            body={"folder_name": api.payload["folder_name"]},
        )
        response = _send_message(db_manager_socket, message)
        return response

    @api.doc(body=model_data)
    def delete(self) -> Response:
        """Delete pregenerated tables from all databases."""
        message = Request(
            header=Header(message="delete data"),
            body={"folder_name": api.payload["folder_name"]},
        )
        response = _send_message(db_manager_socket, message)
        return response


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
                    }
                    for row in list(
                        storage_connection.query(
                            "SELECT timestamp, reporter, message from plugin_log;",
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

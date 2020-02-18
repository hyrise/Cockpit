"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from secrets import choice
from time import time_ns
from typing import Dict, List, Union

from flask import Flask, request
from flask_cors import CORS
from flask_restx import Api, Resource, fields
from influxdb import InfluxDBClient
from jsonschema import ValidationError, validate
from zmq import REQ, Context, Socket

from hyrisecockpit.message import get_databases_response_schema, response_schema
from hyrisecockpit.response import get_error_response, get_response
from hyrisecockpit.settings import (
    DB_MANAGER_HOST,
    DB_MANAGER_PORT,
    GENERATOR_HOST,
    GENERATOR_PORT,
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)

context = Context(io_threads=1)

db_manager_socket = context.socket(REQ)
db_manager_socket.connect(f"tcp://{DB_MANAGER_HOST}:{DB_MANAGER_PORT}")

generator_socket = context.socket(REQ)
generator_socket.connect(f"tcp://{GENERATOR_HOST}:{GENERATOR_PORT}")


storage_connection = InfluxDBClient(
    STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
)

app = Flask(__name__)
cors = CORS(app)
api = Api(
    app,
    title="Hyrise Cockpit",
    description="Monitor and control multiple databases at once.",
    validate=True,
)

monitor = api.namespace(
    "monitor", description="Get synchronous data from multiple databases at once."
)

control = api.namespace("control", description="Control multiple databases at once.")

model_database = monitor.model(
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

model_throughput = monitor.clone(
    "Throughput",
    model_database,
    {
        "throughput": fields.Integer(
            title="Throughput",
            description="Query throughput of a given time interval.",
            required=True,
            example=7381,
        )
    },
)

model_latency = monitor.clone(
    "Latency",
    model_database,
    {
        "latency": fields.Float(
            title="Latency",
            description="Average query latency (ms) of a given time interval.",
            required=True,
            example=923.263,
        )
    },
)

model_queue_length = monitor.clone(
    "Queue length",
    model_database,
    {
        "queue_length": fields.Integer(
            title="Queue length",
            description="Query queue length of a database at a given point in time.",
            required=True,
            example=18623,
        )
    },
)

model_workload_composition = monitor.model(
    "Workload composition",
    {
        "SELECT": fields.Integer(
            title="SELECT queries",
            description="Number of SELECT queries of a given time interval.",
            required=True,
            example=241,
        ),
        "INSERT": fields.Integer(
            title="INSERT queries",
            description="Number of INSERT queries of a given time interval.",
            required=True,
            example=67,
        ),
        "UPDATE": fields.Integer(
            title="UPDATE queries",
            description="Number of UPDATE queries of a given time interval.",
            required=True,
            example=573,
        ),
        "DELETE": fields.Integer(
            title="DELETE queries",
            description="Number of DELETE queries of a given time interval.",
            required=True,
            example=14,
        ),
    },
)

model_krueger_data = monitor.clone(
    "Krüger data",
    model_database,
    {
        "executed": fields.Nested(
            model_workload_composition,
            title="Executed queries",
            description="The composition of queries successfully exectued of a given time interval.",
            required=True,
        ),
        "generated": fields.Nested(
            model_workload_composition,
            title="Generated queries",
            description="The composition of queries generated of a given time interval.",
            required=True,
        ),
    },
)

model_data = control.model(
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

model_storage = control.model(
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

model_control_database = control.model(
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

model_add_database = control.clone(
    "Add Database",
    model_control_database,
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


def get_all_databases(client: InfluxDBClient):
    """Return a list of all databases with measurements."""
    return [d["name"] for d in client.get_list_database()]


def _send_message(socket: Socket, message: Dict):
    """Send an IPC message with data to a database interface, return the repsonse."""
    socket.send_json(message)
    response = socket.recv_json()
    validate(instance=response, schema=response_schema)
    return response


def _active_databases():
    """Get a list of active databases."""
    response = _send_message(
        db_manager_socket, {"header": {"message": "get databases"}, "body": {}}
    )
    validate(instance=response["body"], schema=get_databases_response_schema)
    return response["body"]["databases"]


@monitor.route("/throughput")
class Throughput(Resource):
    """Throughput information of all databases."""

    @monitor.doc(model=[model_throughput])
    def get(self) -> Union[int, Dict[str, Dict[str, int]]]:
        """Return throughput information from the stored queries."""
        currentts = time_ns()
        startts = currentts - 2_000_000_000
        endts = currentts - 1_000_000_000

        throughput: Dict[str, int] = {}
        try:
            active_databases = _active_databases()
        except ValidationError:
            return 500
        for database in active_databases:
            result = storage_connection.query(
                'SELECT COUNT("end") FROM successful_queries WHERE time > $startts AND time <= $endts;',
                database=database,
                bind_params={"startts": startts, "endts": endts},
            )
            throughput_value = list(result["successful_queries", None])
            if len(throughput_value) > 0:
                throughput[database] = list(result["successful_queries", None])[0][
                    "count"
                ]
            else:
                throughput[database] = 0
        response = get_response(200)
        response["body"]["throughput"] = throughput
        return response


@monitor.route("/latency")
class Latency(Resource):
    """Latency information of all databases."""

    @monitor.doc(model=[model_latency])
    def get(self) -> Union[int, Dict[str, Dict[str, float]]]:
        """Return latency information from the stored queries."""
        currentts = time_ns()
        startts = currentts - 2_000_000_000
        endts = currentts - 1_000_000_000
        latency: Dict[str, float] = {}
        try:
            active_databases = _active_databases()
        except ValidationError:
            return 500
        for database in active_databases:
            result = storage_connection.query(
                'SELECT MEAN("latency") AS "latency" FROM (SELECT "end"-"start" AS "latency" FROM successful_queries WHERE time > $startts AND time <= $endts);',
                database=database,
                bind_params={"startts": startts, "endts": endts},
            )
            latency_value = list(result["successful_queries", None])
            if len(latency_value) > 0:
                latency[database] = list(result["successful_queries", None])[0][
                    "latency"
                ]
            else:
                latency[database] = 0
        response = get_response(200)
        response["body"]["latency"] = latency
        return response


@monitor.route("/queue_length")
class QueueLength(Resource):
    """Queue length information of all databases."""

    @monitor.doc(model=[model_queue_length])
    def get(self) -> Dict:
        """Return queue length information from database manager."""
        return _send_message(
            db_manager_socket, {"header": {"message": "queue length"}, "body": {}}
        )


@monitor.route("/failed_tasks")
class FailedTasks(Resource):
    """Failed tasks information of all databases."""

    def get(self) -> Dict:
        """Return queue length information from database manager."""
        return _send_message(
            db_manager_socket, {"header": {"message": "failed tasks"}, "body": {}}
        )


@monitor.route("/system")
class System(Resource):
    """System data information of all databases."""

    def get(self) -> Dict:
        """Return cpu and memory information for every database and the number of thread it is using from database manager."""
        return _send_message(
            db_manager_socket, {"header": {"message": "system data"}, "body": {}}
        )


@monitor.route("/chunks")
class Chunks(Resource):
    """Chunks data information of all databases."""

    def get(self) -> Dict:
        """Return chunks data information for every database."""
        return _send_message(
            db_manager_socket, {"header": {"message": "chunks data"}, "body": {}}
        )


@monitor.route("/storage")
class Storage(Resource):
    """Storage information of all databases."""

    # @control.doc(body=[model_storage]) # noqa
    def get(self) -> Dict:
        """Return storage metadata from database manager."""
        return _send_message(
            db_manager_socket, {"header": {"message": "storage"}, "body": {}}
        )


@monitor.route("/krueger_data", methods=["GET"])
class KruegerData(Resource):
    """Krügergraph data for all workloads."""

    @monitor.doc(model=[model_krueger_data])
    def get(self) -> List[Dict[str, Union[str, Dict[str, int]]]]:
        """Provide mock data for a Krügergraph."""
        active_databases = _send_message(
            db_manager_socket, {"header": {"message": "get databases"}, "body": {}}
        )["body"]["databases"]
        return [
            {
                "id": database,
                "executed": {
                    "SELECT": choice(range(241)),
                    "INSERT": choice(range(67)),
                    "UPDATE": choice(range(573)),
                    "DELETE": choice(range(14)),
                },
                "generated": {
                    "SELECT": choice(range(241)),
                    "INSERT": choice(range(67)),
                    "UPDATE": choice(range(573)),
                    "DELETE": choice(range(14)),
                },
            }
            for database in active_databases
        ]


@control.route("/database", methods=["GET", "POST", "DELETE"])
class Database(Resource):
    """Manages databases."""

    @control.doc(model=[model_control_database])
    def get(self) -> Dict:
        """Get all databases."""
        message = {"header": {"message": "get databases"}, "body": {}}
        response = _send_message(db_manager_socket, message)
        return response

    @control.doc(body=model_add_database)
    def post(self) -> Dict:
        """Add a database."""
        message = {
            "header": {"message": "add database"},
            "body": {
                "number_workers": control.payload["number_workers"],
                "id": control.payload["id"],
                "user": control.payload["user"],
                "password": control.payload["password"],
                "host": control.payload["host"],
                "port": control.payload["port"],
                "dbname": control.payload["dbname"],
            },
        }
        response = _send_message(db_manager_socket, message)
        return response

    @control.doc(body=model_control_database)
    def delete(self) -> Dict:
        """Delete a database."""
        message = {
            "header": {"message": "delete database"},
            "body": {"id": control.payload["id"]},
        }
        response = _send_message(db_manager_socket, message)
        return response


@control.route("/workload", methods=["POST", "DELETE"])
class Workload(Resource):
    """Manages workload generation."""

    def post(self) -> Dict:
        """Start the workload generator."""
        request_json = request.get_json()

        # TODO: Adjust table loading for benchmarks which do not require scale factor (e. g. JOB)
        load_data_message = {
            "header": {"message": "load data"},
            "body": {"folder_name": control.payload["folder_name"]},
        }

        response = _send_message(db_manager_socket, load_data_message)

        if response["header"]["status"] != 200:
            return get_error_response(
                400, response["body"].get("error", "Error during loading of the tables")
            )

        workload_message = {
            "header": {"message": "start workload"},
            "body": {
                "folder_name": control.payload["folder_name"],
                "frequency": request_json.get("frequency", 200),
            },
        }
        response = _send_message(generator_socket, workload_message)
        if response["header"]["status"] != 200:
            return get_error_response(
                400,
                response["body"].get("error", "Error during starting of the workload"),
            )

        return get_response(200)

    def delete(self) -> Dict:
        """Stop the workload generator."""
        message = {
            "header": {"message": "stop workload"},
            "body": {},
        }
        response = _send_message(generator_socket, message)
        if response["header"]["status"] != 200:
            return get_error_response(
                400, response["body"].get("error", "Error during stopping of generator")
            )

        return response


@control.route("/data")
class Data(Resource):
    """Manage data in databases."""

    @control.doc(model=[model_data])
    def get(self) -> List[str]:
        """Return all pregenerated tables that can be loaded."""
        return ["tpch_0.1", "tpch_1", "tpcds_1", "job"]

    # @control.doc(body=model_data)
    def post(self) -> Dict:
        """Load pregenerated tables for all databases."""
        print(control.payload)
        message = {
            "header": {"message": "load data"},
            "body": {"folder_name": control.payload["folder_name"]},
        }
        response = _send_message(db_manager_socket, message)
        return response

    @control.doc(body=model_data)
    def delete(self) -> Dict:
        """Delete pregenerated tables from all databases."""
        message = {
            "header": {"message": "delete data"},
            "body": {"folder_name": control.payload["folder_name"]},
        }
        response = _send_message(db_manager_socket, message)
        return response

"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from secrets import choice
from time import time
from typing import Dict

from flask import Flask, request
from flask_cors import CORS
from flask_restx import Api, Resource
from influxdb import InfluxDBClient
from zmq import REQ, Context, Socket

from hyrisecockpit.response import get_response
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
)

monitor = api.namespace(
    "monitor", description="Get synchronous data from multiple databases at once."
)

control = api.namespace("control", description="Control multiple databases at once.")


def get_all_databases(client: InfluxDBClient):
    """Return a list of all databases with measurements."""
    return [d["name"] for d in client.get_list_database()]


def _send_message(socket: Socket, message: Dict):
    """Send an IPC message with data to a database interface, return the repsonse."""
    socket.send_json(message)
    response = socket.recv_json()
    return response


@monitor.route("/throughput")
class Throughput(Resource):
    """Throughput information of all databases."""

    def get(self) -> Dict[str, int]:
        """Return throughput information from the stored queries."""
        t = time()
        throughput: Dict[str, int] = dict()
        message = {"header": {"message": "get databases"}, "body": {}}
        active_databases = _send_message(db_manager_socket, message)["body"][
            "databases"
        ]
        for database in active_databases:
            result = storage_connection.query(
                f"""SELECT COUNT("end") FROM successful_queries WHERE "end" > {t-1} AND "end" <= {t};""",
                database=database,
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

    def get(self) -> Dict[str, float]:
        """Return latency information from the stored queries."""
        t = time()
        latency: Dict[str, float] = dict()
        message = {"header": {"message": "get databases"}, "body": {}}
        active_databases = _send_message(db_manager_socket, message)["body"][
            "databases"
        ]
        for database in active_databases:
            result = storage_connection.query(
                f"""SELECT MEAN("latency") AS "latency" FROM (SELECT "end"-"start" AS "latency" FROM successful_queries WHERE "start" > {t-1} AND "start" <= {t});""",
                database=database,
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


@monitor.route("/system_data")
class SystemData(Resource):
    """System data information of all databases."""

    def get(self) -> Dict:
        """Return cpu and memory information for every database and the number of thread it is using from database manager."""
        return _send_message(
            db_manager_socket, {"header": {"message": "system data"}, "body": {}}
        )


@monitor.route("/chunks_data")
class ChunksData(Resource):
    """Chunks data information of all databases."""

    def get(self) -> Dict:
        """Return chunks data information for every database."""
        return _send_message(
            db_manager_socket, {"header": {"message": "chunks data"}, "body": {}}
        )


@monitor.route("/storage")
class Storage(Resource):
    """Storage information of all databases."""

    def get(self) -> Dict:
        """Return storage metadata from database manager."""
        return _send_message(
            db_manager_socket, {"header": {"message": "storage"}, "body": {}}
        )


@monitor.route("/krueger_data", methods=["GET"])
class KruegerData(Resource):
    """Krügergraph data for all workloads."""

    def get(self) -> Dict:
        """Provide mock data for a Krügergraph."""
        return {
            "tpch": {
                "SELECT": choice(range(0, 100)),
                "INSERT": choice(range(0, 100)),
                "UPDATE": choice(range(0, 100)),
                "DELETE": choice(range(0, 100)),
            },
            "tpcds": {
                "SELECT": choice(range(0, 100)),
                "INSERT": choice(range(0, 100)),
                "UPDATE": choice(range(0, 100)),
                "DELETE": choice(range(0, 100)),
            },
            "job": {
                "SELECT": choice(range(0, 100)),
                "INSERT": choice(range(0, 100)),
                "UPDATE": choice(range(0, 100)),
                "DELETE": choice(range(0, 100)),
            },
        }


@control.route("/database", methods=["GET", "POST", "DELETE"])
class Database(Resource):
    """Manages databases."""

    def get(self) -> Dict:
        """Get all databases."""
        message = {"header": {"message": "get databases"}, "body": {}}
        response = _send_message(db_manager_socket, message)
        return response

    def post(self) -> Dict:
        """Add a database."""
        request_json = request.get_json()
        message = {
            "header": {"message": "add database"},
            "body": {
                "number_workers": request_json["number_workers"],
                "id": request_json["id"],
                "user": request_json["user"],
                "password": request_json["password"],
                "host": request_json["host"],
                "port": request_json["port"],
                "dbname": request_json["dbname"],
            },
        }
        response = _send_message(db_manager_socket, message)
        return response

    def delete(self) -> Dict:
        """Delete a database."""
        request_json = request.get_json()
        message = {
            "header": {"message": "delete database"},
            "body": {"id": request_json["id"]},
        }
        response = _send_message(db_manager_socket, message)
        return response


@control.route("/register_workload", methods=["POST"])
class RegisterWorkload(Resource):
    """Registers workloads."""

    def post(self) -> Dict:
        """Register the workload specification."""
        request_json = request.get_json()
        workload = {
            "type": request_json.get("type"),
            "queries": request_json.get("queries", None),
            "shuffle": request_json.get("shuffle", False),
            "factor": request_json.get("factor", 1),
            "auto-reload": request_json.get("auto-reload", False),
            "sf": request_json.get("sf", 0.1),
        }

        message = {
            "header": {"message": "register workload"},
            "body": {"workload": workload},
        }
        response = _send_message(db_manager_socket, message)

        return response


@control.route("/start_workload", methods=["POST"])
class StartWorkload(Resource):
    """Starts workloads."""

    def post(self) -> Dict:
        """Start the workload execution."""
        message = {
            "header": {"message": "start workload"},
            "body": {},
        }
        response = _send_message(db_manager_socket, message)
        return response


@control.route("/stop_workload", methods=["POST"])
class StopWorkload(Resource):
    """Stops workloads."""

    def post(self) -> Dict:
        """Stop the workload execution."""
        message = {
            "header": {"message": "stop workload"},
            "body": {},
        }
        response = _send_message(db_manager_socket, message)
        return response


@control.route("/workload", methods=["POST", "DELETE"])
class Workload(Resource):
    """Manages workload generation."""

    def post(self) -> Dict:
        """Start the workload generator."""
        request_json = request.get_json()
        message = {
            "header": {"message": "workload"},
            "body": {
                "type": request_json["body"].get("type"),
                "sf": request_json["body"].get("sf"),
                "queries": request_json["body"].get("queries"),
                "factor": request_json["body"].get("factor", 1),
                "shuffle": request_json["body"].get("shuffle", False),
            },
        }
        response = _send_message(generator_socket, message)
        return response

    def delete(self) -> Dict:
        """Stop the workload generator."""
        message = {
            "header": {"message": "stop"},
            "body": {},
        }
        response = _send_message(generator_socket, message)
        return response


@control.route("/data/<datatype>", methods=["POST", "DELETE"])
class Data(Resource):
    """Manage data in databases."""

    def post(self, datatype: str) -> Dict:
        """Load pregenerated tables for all databases."""
        request_json = request.get_json()
        message = {
            "header": {"message": "load data"},
            "body": {"datatype": datatype, "sf": request_json["body"]["sf"]},
        }
        response = _send_message(db_manager_socket, message)
        return response

    def delete(self, datatype: str) -> Dict:
        """Delete pregenerated tables from all databases."""
        message = {
            "header": {"message": "delete data"},
            "body": {"datatype": datatype},
        }
        response = _send_message(db_manager_socket, message)
        return response

"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from time import time
from typing import Dict

from flask import Flask, request
from flask_cors import CORS
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
app.config["CORS_HEADERS"] = "Content-Type"


def get_all_databases(client: InfluxDBClient):
    """Return a list of all databases with measurements."""
    return [d["name"] for d in client.get_list_database()]


def _send_message(socket: Socket, message: Dict):
    """Send an IPC message with data to a database interface, return the repsonse."""
    socket.send_json(message)
    response = socket.recv_json()
    return response


@app.route("/")
def home() -> str:
    """Display a greeting to a visitor."""
    return "Hey there! You found our Database Cockpit."


@app.route("/throughput")
def get_throughput() -> Dict[str, int]:
    """Return throughput information from the stored queries."""
    t = time()
    throughput: Dict[str, int] = dict()
    message = {"header": {"message": "get databases"}, "body": {}}
    active_databases = _send_message(db_manager_socket, message)["body"]["databases"]
    for database in active_databases:
        result = storage_connection.query(
            f"""SELECT COUNT("end") FROM successful_queries WHERE "end" > {t-1} AND "end" <= {t};""",
            database=database,
        )
        throughput_value = list(result["successful_queries", None])
        if len(throughput_value) > 0:
            throughput[database] = list(result["successful_queries", None])[0]["count"]
        else:
            throughput[database] = 0
    response = get_response(200)
    response["body"]["throughput"] = throughput
    return response


@app.route("/latency")
def get_latency() -> Dict[str, float]:
    """Return latency information from the stored queries."""
    t = time()
    latency: Dict[str, float] = dict()
    message = {"header": {"message": "get databases"}, "body": {}}
    active_databases = _send_message(db_manager_socket, message)["body"]["databases"]
    for database in active_databases:
        result = storage_connection.query(
            f"""SELECT MEAN("latency") AS "latency" FROM (SELECT "end"-"start" AS "latency" FROM successful_queries WHERE "start" > {t-1} AND "start" <= {t});""",
            database=database,
        )
        latency_value = list(result["successful_queries", None])
        if len(latency_value) > 0:
            latency[database] = list(result["successful_queries", None])[0]["latency"]
        else:
            latency[database] = 0
    response = get_response(200)
    response["body"]["latency"] = latency
    return response


@app.route("/queue_length")
def get_queue_length() -> Dict:
    """Return queue length information from database manager."""
    return _send_message(
        db_manager_socket, {"header": {"message": "queue length"}, "body": {}}
    )


@app.route("/failed_tasks")
def get_failed_tasks() -> Dict:
    """Return queue length information from database manager."""
    return _send_message(
        db_manager_socket, {"header": {"message": "failed tasks"}, "body": {}}
    )


@app.route("/system_data")
def get_system_data() -> Dict:
    """Return cpu and memory information for every database and the number of thread it is using from database manager."""
    return _send_message(
        db_manager_socket, {"header": {"message": "system data"}, "body": {}}
    )


@app.route("/chunks_data")
def get_chunks_data() -> Dict:
    """Return chunks data information for every database."""
    return _send_message(
        db_manager_socket, {"header": {"message": "chunks data"}, "body": {}}
    )


@app.route("/storage")
def get_storage_metadata() -> Dict:
    """Return storage metadata from database manager."""
    return _send_message(
        db_manager_socket, {"header": {"message": "storage"}, "body": {}}
    )


@app.route("/database", methods=["GET", "POST", "DELETE"])
def database() -> Dict:
    """Add or delete a driver to/from the database manager."""
    request_json = request.get_json()
    if request.method == "GET":
        message = {"header": {"message": "get databases"}, "body": {}}
    elif request.method == "POST":
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
    elif request.method == "DELETE":
        message = {
            "header": {"message": "delete database"},
            "body": {"id": request_json["id"]},
        }
    response = _send_message(db_manager_socket, message)
    return response


@app.route("/workload", methods=["POST", "DELETE"])
def workload() -> Dict:
    """Start or stop the workload generator."""
    request_json = request.get_json()
    if request.method == "POST":
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
    elif request.method == "DELETE":
        message = {
            "header": {"message": "stop"},
            "body": {},
        }
    response = _send_message(generator_socket, message)

    return response


@app.route("/data/<datatype>", methods=["POST", "DELETE"])
def data(datatype: str) -> Dict:
    """Load or delete pregenerated tables from all databases."""
    request_json = request.get_json()
    if request.method == "POST":
        message = {
            "header": {"message": "load data"},
            "body": {"datatype": datatype, "sf": request_json["body"]["sf"]},
        }
    elif request.method == "DELETE":
        message = {
            "header": {"message": "delete data"},
            "body": {"datatype": datatype},
        }
    response = _send_message(db_manager_socket, message)
    return response


@app.route("/krueger_data", methods=["GET"])
def krueger_data() -> Dict:
    """Provide mock data for a Krügergraph."""
    return {
        "tpch": {"SELECT": 555, "INSERT": 265, "UPDATE": 5, "DELETE": 1},
        "tpcds": {"SELECT": 780, "INSERT": 55, "UPDATE": 25, "DELETE": 5},
        "job": {"SELECT": 537, "INSERT": 80, "UPDATE": 54, "DELETE": 3},
    }

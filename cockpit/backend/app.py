"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

import rq_dashboard
from flask import Flask, request
from flask_cors import CORS
from zmq import REQ, Context

import settings as s

context = Context(io_threads=1)

db_manager_socket = context.socket(REQ)
db_manager_socket.connect(f"tcp://{s.DB_MANAGER_HOST}:{s.DB_MANAGER_PORT}")

generator_socket = context.socket(REQ)
generator_socket.connect(f"tcp://{s.GENERATOR_HOST}:{s.GENERATOR_PORT}")

app = Flask(__name__)
cors = CORS(app)
app.config["CORS_HEADERS"] = "Content-Type"

app.config.from_object(rq_dashboard.default_settings)
app.register_blueprint(rq_dashboard.blueprint, url_prefix="/rq")


def _send_message(socket, message):
    """Send an IPC message with data to a database interface, return the repsonse."""
    socket.send_json(message)
    response = socket.recv_json()
    return response


@app.route("/throughput")
def get_throughput():
    """Return throughput information from database manager."""
    response = _send_message(
        db_manager_socket, {"header": {"message": "throughput"}, "body": {}}
    )
    return response["body"]


@app.route("/queue_length")
def get_queue_length():
    """Return queue length information from database manager."""
    response = _send_message(
        db_manager_socket, {"header": {"message": "queue length"}, "body": {}}
    )
    return response["body"]


@app.route("/drivers", methods=["POST", "DELETE"])
def drivers():
    """Add or delete a driver to/from the database manager."""
    request_json = request.get_json()
    if request.method == "POST":
        message = {
            "header": {"message": "add driver"},
            "body": {
                "db_type": request_json["db_type"],
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
            "header": {"message": "pop driver"},
            "body": {"id": request_json["id"]},
        }
    response = _send_message(db_manager_socket, message)
    return response


@app.route("/workload", methods=["POST", "DELETE"])
def workload():
    """Start or stop the workload generator."""
    request_json = request.get_json()
    if request.method == "POST":
        message = {
            "header": {"message": "start"},
            "body": {"n_producers": request_json["n_producers"]},
        }
    elif request.method == "DELETE":
        message = {
            "header": {"message": "stop"},
            "body": {},
        }
    response = _send_message(generator_socket, message)
    return response


if __name__ == "__main__":
    app.run(host=s.BACKEND_HOST, port=s.BACKEND_PORT)

"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from flask import Flask, request
from flask_cors import CORS
from zmq import REQ, Context

import settings as s

app = Flask(__name__)
cors = CORS(app)
app.config["CORS_HEADERS"] = "Content-Type"

context = Context(io_threads=1)

db_manager_socket = context.socket(REQ)
db_manager_socket.connect(f"tcp://{s.DB_MANAGER_HOST}:{s.DB_MANAGER_PORT}")

generator_socket = context.socket(REQ)
generator_socket.connect(f"tcp://{s.GENERATOR_HOST}:{s.GENERATOR_PORT}")


def _send_message(message):
    """Send an IPC message with data to a database interface, return the repsonse."""
    db_manager_socket.send_json(message)
    response = db_manager_socket.recv_json()
    return response


@app.route("/throughput")
def get_throughput():
    """Return throughput information from database manager."""
    response = _send_message({"header": {"message": "throughput"}, "body": {}})
    return response["body"]


@app.route("/queue_length")
def get_queue_length():
    """Return queue length information from database manager."""
    response = _send_message({"header": {"message": "queue length"}, "body": {}})
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
    response = _send_message(message)
    return response


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)  # nosec

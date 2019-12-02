"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""
from json import load

from flask import Flask
from flask_cors import CORS
from zmq import REQ, Context

import settings as s

with open("storage_dummy.json", "r") as storage_dummy:
    storage_data = load(storage_dummy)

app = Flask(__name__)
cors = CORS(app)
app.config["CORS_HEADERS"] = "Content-Type"

context = Context(io_threads=1)
socket = context.socket(REQ)
socket.connect(f"tcp://{s.DB_MANAGER_HOST}:{s.DB_MANAGER_PORT}")


def _send_request(request):
    """Send an IPC request with data to a database interface, return the repsonse."""
    socket.send_json(request)
    response = socket.recv_json()
    return response


@app.route("/throughput")
def get_throughput():
    """Return throughput information from database manager."""
    response = _send_request({"header": {"message": "throughput"}, "body": {}})
    return response["body"]


@app.route("/queue_length")
def get_queue_length():
    """Return queue length information from database manager."""
    response = _send_request({"header": {"message": "queue length"}, "body": {}})
    return response["body"]


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)  # nosec

"""Module for monitoring a database interface."""
import json
from os import getenv

import zmq
from flask import Flask, request
from flask_cors import CORS

MONITOR_REQ_URL = getenv("MONITOR_REQ_URL")
MONITOR_BACKEND_HOST = getenv("MONITOR_BACKEND_HOST")
MONITOR_BACKEND_PORT = getenv("MONITOR_BACKEND_PORT")

app = Flask(__name__)
cors = CORS(app)
app.config["CORS_HEADERS"] = "Content-Type"

context = zmq.Context()
socket = context.socket(zmq.REQ)
socket.connect(MONITOR_REQ_URL)


@app.route("/throughput")
def get_throughput():
    """Get throughput from database manager."""
    message = {"header": {"message": "throughput"}, "body": {}}
    socket.send_json(message)
    reply = socket.recv_json()
    return reply


@app.route("/database", methods=["POST"])
def drivers():
    """Add or delete a driver to/from the database manager."""
    request_data = json.loads(request.data)
    if request.method == "POST":
        message = {
            "header": {"message": "add database"},
            "body": {
                "user": request_data["user"],
                "password": request_data["password"],
                "host": request_data["host"],
                "port": request_data["port"],
                "dbname": request_data["dbname"],
            },
        }
        socket.send_json(message)
        reply = socket.recv_json()
        return reply
    # response = _send_message(db_manager_socket, message)
    # return response


if __name__ == "__main__":
    app.run(host=MONITOR_BACKEND_HOST, port=MONITOR_BACKEND_PORT)

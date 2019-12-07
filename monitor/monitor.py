"""Module for monitoring a database interface."""
import json

import zmq
from flask import Flask, request
from flask_cors import CORS

DB_MANAGER_SOCKET_URL = ""
BACKEND_HOST = ""
BACKEND_PORT = ""

app = Flask(__name__)
cors = CORS(app)
app.config["CORS_HEADERS"] = "Content-Type"

context = zmq.Context()
socket = context.socket(zmq.REQ)
socket.connect(DB_MANAGER_SOCKET_URL)


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
    app.run(host=BACKEND_HOST, port=BACKEND_PORT)

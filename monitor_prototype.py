import json

import zmq
from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
cors = CORS(app)
app.config["CORS_HEADERS"] = "Content-Type"
context = zmq.Context()
socket = context.socket(zmq.REQ)
socket.connect("tcp://localhost:5555")  # socket of hyriseInterface instance


def send_request(data):
    request = json.dumps(data)
    socket.send_string(request)
    response = socket.recv()
    return response


@app.route("/throughput")
def get_throughput():
    data = {}
    data["Content-Type"] = "throughput"
    return send_request(data)


@app.route("/storage_data")
def get_storage_data():
    data = {}
    data["Content-Type"] = "storage_data"
    return send_request(data)


@app.route("/runtime_information")
def get_runtime_information():
    data = {}
    data["Content-Type"] = "runtime_information"
    return send_request(data)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

"""This module generates a simple workload."""

import json
import time

import zmq

PUB_SOCKET = ""
REQ_SOCKET = ""

context = zmq.Context()
# Der Server ist der Publisher
publisher = context.socket(zmq.PUB)
publisher.bind(PUB_SOCKET)
socket = context.socket(zmq.REQ)
socket.connect(REQ_SOCKET)


def build_workload():
    """Generate simple workload."""
    workload = []
    for _ in range(1000):
        workload.append("SELECT 1;")
    dictionary = {}
    dictionary["Content"] = workload
    data = json.dumps(dictionary)
    return data


workload = build_workload()

while True:
    publisher.send_string(workload)
    time.sleep(1.0)
    socket.send_string("Throughput")
    message = socket.recv_string()
    print(message)

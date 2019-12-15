"""Add a database to the database manager."""
from zmq import REQ, Context

context = Context(io_threads=1)
socket = context.socket(REQ)
socket.connect("tcp://__________:__________")


def _send_message(message):
    """Send an IPC message with data to a database interface, return the repsonse."""
    socket.send_json(message)
    response = socket.recv_json()
    return response


message = {
    "header": {"message": "add driver"},
    "body": {
        "db_type": "__________",
        "id": "__________",
        "user": "__________",
        "password": "__________",
        "host": "__________",
        "port": "__________",
        "dbname": "__________",
    },
}

print(_send_message(message))

"""Shared objects and functions for all entities."""

from threading import RLock
from typing import List

from influxdb import InfluxDBClient
from jsonschema import validate
from zmq import REQ, Context, Socket

from hyrisecockpit.message import response_schema
from hyrisecockpit.request import Request
from hyrisecockpit.response import Response
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
multiprocess_lock = RLock()
active_databases: List[str] = []

db_manager_socket = context.socket(REQ)
db_manager_socket.connect(f"tcp://{DB_MANAGER_HOST}:{DB_MANAGER_PORT}")

generator_socket = context.socket(REQ)
generator_socket.connect(f"tcp://{GENERATOR_HOST}:{GENERATOR_PORT}")


storage_connection = InfluxDBClient(
    STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
)


def _send_message(socket: Socket, message: Request) -> Response:
    """Send an IPC message with data to a database interface, return the repsonse."""
    with multiprocess_lock:
        socket.send_json(message)
        response: Response = socket.recv_json()
    validate(instance=response, schema=response_schema)
    return response


def _add_active_database(database_id: str) -> None:
    global active_databases
    active_databases.append(database_id)


def _remove_active_database(database_id: str) -> None:
    global active_databases
    active_databases.remove(database_id)


def _get_active_databases() -> List[str]:
    """Get a list of active databases."""
    global active_databases
    return active_databases

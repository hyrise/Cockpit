"""Services used by the control controller."""
from typing import List

from jsonschema import validate
from zmq import REQ
from zmq.decorators import socket

from hyrisecockpit.message import response_schema
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import DatabaseInterface, DetailedDatabaseInterface
from .model import DetailedDatabase

url = "127.0.0.1:8000"


class ControlService:
    """Services of the Control Controller."""

    @staticmethod
    @socket(REQ)
    def __send_req(message: Request, socket: socket) -> Response:
        socket.connect(url)
        socket.send_json(message)
        response: Response = socket.recv_json()
        socket.disconnect(url)
        return response

    @staticmethod
    def _send_message(message: Request) -> Response:
        """Send an IPC message with data to a database interface, return the repsonse."""
        response = ControlService.__send_req(message)
        validate(instance=response, schema=response_schema)
        return response

    @classmethod
    def get_databases(cls) -> List[DetailedDatabase]:
        """Get all Databases.

        Returns a list of all databases with detailed information.
        """
        response = cls._send_message(
            Request(header=Header(message="get databases"), body={})
        )
        return [
            DetailedDatabase(**interface) for interface in response["body"]["databases"]
        ]

    @classmethod
    def register_database(cls, interface: DetailedDatabaseInterface) -> int:
        """Add a database to the manager."""
        response = cls._send_message(
            Request(header=Header(message="add database"), body=dict(interface))
        )
        return response["header"]["status"]

    @classmethod
    def deregister_database(cls, interface: DatabaseInterface) -> int:
        """Remove database from manager."""
        response = cls._send_message(
            Request(header=Header(message="delete database"), body=dict(interface))
        )
        return response["header"]["status"]

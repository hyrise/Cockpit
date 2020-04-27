"""Service for SQL module."""
from typing import Optional, Tuple

from jsonschema import validate

from hyrisecockpit.api.app.exception import StatusCodeNotFoundException
from hyrisecockpit.api.app.socket_manager import ManagerSocket
from hyrisecockpit.message import response_schema
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import SqlQueryInterface
from .model import SqlResponse


class SqlService:
    """Services of the Control Controller."""

    @staticmethod
    def _send_message(message: Request) -> Response:
        """Send an IPC message with data to a database interface, return the response."""
        with ManagerSocket() as socket:
            response = socket.send_message(message)
        validate(instance=response, schema=response_schema)
        return response

    @classmethod
    def execute_sql(
        cls, interface: SqlQueryInterface
    ) -> Tuple[Optional[SqlResponse], int]:
        """Execute sql query."""
        response = cls._send_message(
            Request(header=Header(message="execute sql query"), body=dict(interface))
        )
        if response["header"]["status"] == 200:
            return (
                SqlResponse(**response["body"]["results"]),
                200,
            )
        elif response["header"]["status"] == 404:
            return (
                None,
                404,
            )
        else:
            raise StatusCodeNotFoundException(
                f"Unknown status code: {response['header']['status']}"
            )

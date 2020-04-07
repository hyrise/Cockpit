"""Services used by the Workload controller."""
from typing import List, Optional

from jsonschema import validate
from zmq import REQ
from zmq.decorators import socket

from hyrisecockpit.message import response_schema
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import WorkloadInterface
from .model import Workload

url = "127.0.0.1:8000"


class WorkloadService:
    """Services of the Workload Controller."""

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
        response = WorkloadService.__send_req(message)
        validate(instance=response, schema=response_schema)
        return response

    @classmethod
    def get_all(cls) -> List[Workload]:
        """Get all Workloads.

        Returns a list of all Workloads.
        """
        response = cls._send_message(
            Request(header=Header(message="get all workloads"), body={})
        )
        return [Workload(**interface) for interface in response["body"]["workloads"]]

    @classmethod
    def create(cls, interface: WorkloadInterface) -> Optional[Workload]:
        """Create a Workload.

        Returns the created Workload.
        Returns None if a Workload with the given ID already exists.
        """
        response = cls._send_message(
            Request(header=Header(message="start workload"), body=dict(interface))
        )
        return (
            None
            if response["header"]["status"] == 409
            else Workload(**response["body"]["workload"])
        )

    @classmethod
    def get_by_id(cls, workload_id: str) -> Optional[Workload]:
        """Get a Workload.

        Returns the Workload with the given ID.
        Returns None if a Workload with the given ID doesn't exist.
        """
        response = cls._send_message(
            Request(
                header=Header(message="get workload"), body={"workload_id": workload_id}
            )
        )
        return (
            None
            if response["header"]["status"] == 404
            else Workload(**response["body"]["workload"])
        )

    @classmethod
    def delete_by_id(cls, workload_id: str) -> Optional[str]:
        """Delete a Workload.

        Returns the workload_id of the deleted Workload.
        Returns None if a Workload with the given ID doesn't exist.
        """
        response = cls._send_message(
            Request(
                header=Header(message="delete workload"),
                body={"workload_id": workload_id},
            )
        )
        return (
            None
            if response["header"]["status"] == 404
            else response["body"]["workload_id"]
        )

    @classmethod
    def update_by_id(
        cls, workload_id: str, interface: WorkloadInterface
    ) -> Optional[Workload]:
        """Update a Workload by ID.

        Returns the updated Workload.
        Returns None if a Workload with the given ID doesn't exist.
        """
        response = cls._send_message(
            Request(
                header=Header(message="update workload"),
                body={"workload_id": workload_id, "workload": dict(interface)},
            )
        )
        return (
            None
            if response["header"]["status"] == 404
            else Workload(**response["body"]["workload"])
        )

"""Services used by the Workload controller."""
from typing import List, Optional

from jsonschema import validate
from zmq import REQ
from zmq.decorators import socket

from hyrisecockpit.message import response_schema
from hyrisecockpit.request import Request
from hyrisecockpit.response import Response

from .interface import WorkloadInterface
from .model import Workload

url = "127.0.0.1:8000"


@socket(REQ)
def __send_req(message: Request, socket: socket) -> Response:
    socket.connect(url)
    socket.send_json(message)
    response: Response = socket.recv_json()
    socket.disconnect(url)
    return response


def _send_message(message: Request) -> Response:
    """Send an IPC message with data to a database interface, return the repsonse."""
    response = __send_req(message)
    validate(instance=response, schema=response_schema)
    return response


class WorkloadService:
    """Services of the Workload Controller."""

    @staticmethod
    def get_all() -> List[Workload]:
        """Get all Workloads."""
        raise NotImplementedError()

    @staticmethod
    def create(new_attrs: WorkloadInterface) -> Optional[Workload]:
        """Create a Workload."""
        raise NotImplementedError()

    @staticmethod
    def get_by_id(workload_id: str) -> Optional[Workload]:
        """Get a Workload by ID."""
        raise NotImplementedError()

    @staticmethod
    def delete_by_id(workload_id: str) -> bool:
        """Delete a Workload by ID."""
        raise NotImplementedError()

    @staticmethod
    def update_by_id(
        workload_id: str, changes: WorkloadInterface
    ) -> Optional[Workload]:
        """Update a Workload by ID."""
        raise NotImplementedError()

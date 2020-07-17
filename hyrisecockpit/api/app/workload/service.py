"""Services used by the Workload controller."""
from typing import List, Optional

from hyrisecockpit.api.app.socket_manager import GeneratorSocket, ManagerSocket
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import DetailedWorkloadInterface, WorkloadInterface
from .model import DetailedWorkload, Workload


class WorkloadService:
    """Services of the Workload Controller."""

    @staticmethod
    def _send_message_to_dbm(message: Request) -> Response:
        """Send an IPC message to the database manager."""
        with ManagerSocket() as socket:
            return socket.send_message(message)

    @staticmethod
    def _send_message_to_gen(message: Request) -> Response:
        """Send an IPC message to the workload generator."""
        with GeneratorSocket() as socket:
            return socket.send_message(message)

    @classmethod
    def get_all(cls) -> List[Workload]:
        """Get all Workloads.

        Returns a list of all Workloads.
        """
        response = cls._send_message_to_gen(
            Request(header=Header(message="get all workloads"), body={}),
        )
        return [Workload(**interface) for interface in response["body"]["workloads"]]

    @classmethod
    def create(cls, interface: WorkloadInterface) -> Optional[Workload]:
        """Create a Workload.

        Returns the created Workload.
        Returns None if a Workload with the given ID already exists.
        """
        response = cls._send_message_to_gen(
            Request(header=Header(message="start workload"), body=dict(interface)),
        )
        return (
            None
            if response["header"]["status"] != 200
            else Workload(**response["body"]["workload"])
        )

    @classmethod
    def get_by_id(cls, workload_type: str) -> Optional[DetailedWorkload]:
        """Get a Workload.

        Returns the Workload with the given ID.
        Returns None if a Workload with the given ID doesn't exist.
        """
        response = cls._send_message_to_gen(
            Request(
                header=Header(message="get workload"),
                body={"workload_type": workload_type},
            ),
        )
        return (
            None
            if response["header"]["status"] == 404
            else DetailedWorkload(**response["body"]["workload"])
        )

    @classmethod
    def delete_by_id(cls, workload_type: str) -> Optional[str]:
        """Delete a Workload.

        Returns the folder_name of the deleted Workload.
        Returns None if a Workload with the given ID doesn't exist.
        """
        response = cls._send_message_to_gen(
            Request(
                header=Header(message="stop workload"),
                body={"workload_type": workload_type},
            ),
        )
        return (
            None
            if response["header"]["status"] == 404
            else response["body"]["workload"]
        )

    @classmethod
    def update_by_id(
        cls, workload_type: str, interface: DetailedWorkloadInterface
    ) -> Optional[DetailedWorkload]:
        """Update a Workload by ID.

        Returns the updated Workload.
        Returns None if a Workload with the given ID doesn't exist.
        """
        response = cls._send_message_to_gen(
            Request(header=Header(message="update workload"), body={dict(interface)},),  # type: ignore
        )
        return (
            None
            if response["header"]["status"] == 404
            else DetailedWorkload(**response["body"]["workload"])
        )

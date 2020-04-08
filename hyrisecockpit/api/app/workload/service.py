"""Services used by the Workload controller."""
from typing import List, Optional

from hyrisecockpit.api.app.shared import (
    _send_message,
    db_manager_socket,
    generator_socket,
)
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import WorkloadInterface
from .model import Workload


class WorkloadService:
    """Services of the Workload Controller."""

    @staticmethod
    def _send_message_to_dbm(message: Request) -> Response:
        """Send an IPC message to the database manager."""
        return _send_message(db_manager_socket, message)

    @staticmethod
    def _send_message_to_gen(message: Request) -> Response:
        """Send an IPC message to the workload generator."""
        return _send_message(generator_socket, message)

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
        response = cls._send_message_to_dbm(
            Request(header=Header(message="start worker"), body={})
        )
        if response["header"]["status"] == 200:
            response = cls._send_message_to_gen(
                Request(header=Header(message="start workload"), body=dict(interface)),
            )
            return (
                None
                if response["header"]["status"] == 409
                else Workload(**response["body"]["workload"])
            )
        else:
            return None

    @classmethod
    def get_by_id(cls, workload_id: str) -> Optional[Workload]:
        """Get a Workload.

        Returns the Workload with the given ID.
        Returns None if a Workload with the given ID doesn't exist.
        """
        response = cls._send_message_to_gen(
            Request(
                header=Header(message="get workload"), body={"workload_id": workload_id}
            ),
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
        response = cls._send_message_to_dbm(
            Request(header=Header(message="close worker"), body={})
        )
        if response["header"]["status"] == 200:
            response = cls._send_message_to_gen(
                Request(
                    header=Header(message="delete workload"),
                    body={"workload_id": workload_id},
                ),
            )
            return (
                None
                if response["header"]["status"] == 404
                else response["body"]["workload_id"]
            )
        else:
            return None

    @classmethod
    def update_by_id(
        cls, workload_id: str, interface: WorkloadInterface
    ) -> Optional[Workload]:
        """Update a Workload by ID.

        Returns the updated Workload.
        Returns None if a Workload with the given ID doesn't exist.
        """
        response = cls._send_message_to_gen(
            Request(
                header=Header(message="update workload"),
                body={"workload_id": workload_id, "workload": dict(interface)},
            ),
        )
        return (
            None
            if response["header"]["status"] == 404
            else Workload(**response["body"]["workload"])
        )

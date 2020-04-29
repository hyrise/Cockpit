"""Services used by the Plugin controller."""
from typing import List, Union

from hyrisecockpit.api.app.socket_manager import ManagerSocket
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import PluginIDInterface, PluginInterface


class PluginService:
    """Services of the Plugin Controller."""

    @staticmethod
    def _send_message_to_dbm(message: Request) -> Response:
        """Send an IPC message to the database manager."""
        with ManagerSocket() as socket:
            return socket.send_message(message)

    @classmethod
    def get_all(cls) -> Union[List[PluginIDInterface], int]:
        """Get all Plugins from all databases."""
        response = cls._send_message_to_dbm(
            Request(header=Header(message="get plugins"), body={})
        )
        plugins = response["body"]["plugins"]
        if response["header"]["status"] == 200:
            return [
                PluginIDInterface(
                    id=database["id"],
                    plugins=[
                        PluginInterface(name=plugin) for plugin in database["plugins"]
                    ]
                    if database["plugins"] is not None
                    else None,
                )
                for database in plugins
            ]
        else:
            return response["header"]["status"]

    @classmethod
    def activate_by_id(cls, database_id: str, interface: PluginInterface) -> int:
        """Activate a Plugin, return the status code from the database manager."""
        return cls._send_message_to_dbm(
            Request(
                header=Header(message="activate plugin"),
                body={"id": database_id, "plugin": interface["name"]},
            )
        )["header"]["status"]

    @classmethod
    def deactivate_by_id(cls, database_id: str, interface: PluginInterface) -> int:
        """Deactivate a Plugin, return the status code from the database manager."""
        return cls._send_message_to_dbm(
            Request(
                header=Header(message="deactivate plugin"),
                body={"id": database_id, "plugin": interface["name"]},
            )
        )["header"]["status"]

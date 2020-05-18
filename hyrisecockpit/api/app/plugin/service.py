"""Services used by the Plugin controller."""
from typing import List, Union

from hyrisecockpit.api.app.socket_manager import ManagerSocket
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import (
    DetailedPluginIDInterface,
    DetailedPluginInterface,
    PluginInterface,
    PluginSettingInterface,
    UpdatePluginSettingInterface,
)


class PluginService:
    """Services of the Plugin Controller."""

    @staticmethod
    def _send_message_to_dbm(message: Request) -> Response:
        """Send an IPC message to the database manager."""
        with ManagerSocket() as socket:
            return socket.send_message(message)

    @classmethod
    def get_all(cls) -> Union[List[DetailedPluginIDInterface], int]:
        """Get all Plugins from all databases."""
        response = cls._send_message_to_dbm(
            Request(header=Header(message="get plugins"), body={})
        )
        if response["header"]["status"] != 200:
            return response["header"]["status"]
        return [
            DetailedPluginIDInterface(
                id=database["id"],
                plugins=(
                    [
                        DetailedPluginInterface(
                            name=plugin_name,
                            settings=[
                                PluginSettingInterface(
                                    name=plugin_setting["name"],
                                    value=plugin_setting["value"],
                                    description=plugin_setting["description"],
                                )
                                for plugin_setting in plugin_settings
                            ],
                        )
                        for plugin_name, plugin_settings in database["plugins"].items()
                    ]
                    if database["plugins"] is not None
                    else None
                ),
            )
            for database in response["body"]["plugins"]
        ]

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

    @classmethod
    def update_plugin_setting(
        cls, database_id: str, interface: UpdatePluginSettingInterface
    ) -> int:
        """Update a plugin setting."""
        return cls._send_message_to_dbm(
            Request(
                header=Header(message="set plugin setting"),
                body={"id": database_id, "update": interface},
            )
        )["header"]["status"]

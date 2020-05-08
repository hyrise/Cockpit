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
        if response["header"]["status"] == 200:
            result = []
            for database in response["body"]["plugins"]:
                if database["plugins"] is not None:
                    plugins: List[DetailedPluginInterface] = []
                    for plugin_name, plugin_settings in database["plugins"].items():
                        detailed_plugin = DetailedPluginInterface(
                            name=plugin_name,
                            settings=[
                                PluginSettingInterface(
                                    name=plugin_setting["name"],
                                    value=plugin_setting["value"],
                                    description=plugin_setting["description"],
                                )
                                for plugin_setting in plugin_settings
                            ]
                            if plugin_settings is not None
                            else None,
                        )
                        plugins.append(detailed_plugin)
                    result.append(
                        DetailedPluginIDInterface(id=database["id"], plugins=plugins)
                    )
                else:
                    result.append(
                        DetailedPluginIDInterface(id=database["id"], plugins=None)
                    )
            return result
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

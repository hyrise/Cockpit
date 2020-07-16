"""Services used by the Plugin controller."""
from typing import Dict, List, Optional, Union

from hyrisecockpit.api.app.shared import _get_active_databases, storage_connection
from hyrisecockpit.api.app.socket_manager import ManagerSocket
from hyrisecockpit.plugins import available_plugins
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import PluginInterface, UpdatePluginSettingInterface
from .model import (
    DetailedPlugin,
    DetailedPluginID,
    LogEntry,
    LogID,
    Plugin,
    PluginSetting,
)


class PluginService:
    """Services of the Plugin Controller."""

    @staticmethod
    def _query_storage_connection(
        query: str, database: str, bind_params: Optional[Dict[str, str]]
    ):
        storage_connection.query(query, database=database, bind_params=bind_params)

    @staticmethod
    def _send_message_to_dbm(message: Request) -> Response:
        """Send an IPC message to the database manager."""
        with ManagerSocket() as socket:
            return socket.send_message(message)

    @classmethod
    def get_all(cls) -> Union[List[DetailedPluginID], int]:
        """Get all Plugins from all databases."""
        response = cls._send_message_to_dbm(
            Request(header=Header(message="get plugins"), body={})
        )
        if response["header"]["status"] != 200:
            return response["header"]["status"]
        return [
            DetailedPluginID(
                id=database["id"],
                plugins=(
                    [
                        DetailedPlugin(
                            name=plugin_name,
                            settings=[
                                PluginSetting(
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

    @classmethod
    def get_available_plugins(cls) -> List[Plugin]:
        """Get all available Plugins."""
        return [Plugin(name=name) for name in available_plugins]

    @classmethod
    def get_all_plugin_logs(cls, level: Optional[str] = None) -> List[LogID]:
        """Get the Plugin Log of all databases."""
        query = "SELECT timestamp, reporter, message, level from plugin_log;"
        bind_params = None
        if level:
            query = "SELECT timestamp, reporter, message, level from plugin_log where level = $level;"
            bind_params = {"level": level}
        return [
            LogID(
                id=database,
                log=[
                    LogEntry(
                        timestamp=int(row["timestamp"]),
                        reporter=row["reporter"],
                        message=row["message"],
                        level=row["level"],
                    )
                    for row in list(
                        cls._query_storage_connection(query, database, bind_params)[
                            "plugin_log", None
                        ]
                    )
                ],
            )
            for database in _get_active_databases()
        ]

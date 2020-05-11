"""Tests for the Plugin controller."""

from typing import Type
from unittest.mock import MagicMock

from pytest import fixture, mark, raises

from hyrisecockpit.api.app.plugin.interface import (
    PluginInterface,
    UpdatePluginSettingInterface,
)
from hyrisecockpit.api.app.plugin.service import PluginService
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import get_response


@fixture
def service() -> Type[PluginService]:
    """Get a PluginService class without IPC."""
    PluginService._send_message_to_dbm = MagicMock()  # type: ignore
    return PluginService


class TestPluginService:
    """Tests for the Plugin controller."""

    def test_gets_all_plugins(self, service: PluginService):
        """A Plugin service gets all activated plugins per database."""
        mocked = get_response(200)
        mocked["body"]["plugins"] = [
            {
                "id": "york",
                "plugins": {
                    "Compression": [
                        {"name": "MemoryBudget", "value": "5000", "description": "..."}
                    ]
                },
            },
            {
                "id": "citadelle",
                "plugins": {
                    "Compression": [
                        {"name": "MemoryBudget", "value": "5000", "description": "..."}
                    ],
                    "Clustering": [],
                },
            },
        ]
        expected = [
            {
                "id": "york",
                "plugins": [
                    {
                        "name": "Compression",
                        "settings": [
                            {
                                "name": "MemoryBudget",
                                "value": "5000",
                                "description": "...",
                            }
                        ],
                    }
                ],
            },
            {
                "id": "citadelle",
                "plugins": [
                    {
                        "name": "Compression",
                        "settings": [
                            {
                                "name": "MemoryBudget",
                                "value": "5000",
                                "description": "...",
                            }
                        ],
                    },
                    {"name": "Clustering", "settings": []},
                ],
            },
        ]
        service._send_message_to_dbm.return_value = mocked  # type: ignore
        result = service.get_all()
        assert not isinstance(result, int)
        assert isinstance(result, list)
        assert result == expected

    def test_doesnt_get_plugins_if_a_database_error_occurs(
        self, service: PluginService, interface: PluginInterface
    ):
        """A Plugin service does not get all plugins if a database error occurs."""
        mocked = get_response(200)
        mocked["body"]["plugins"] = [
            {"id": "york", "plugins": None},
            {"id": "citadelle", "plugins": {"Compression": None, "Clustering": None}},
        ]
        expected = [
            {"id": "york", "plugins": None},
            {
                "id": "citadelle",
                "plugins": [
                    {"name": "Compression", "settings": None},
                    {"name": "Clustering", "settings": None},
                ],
            },
        ]
        service._send_message_to_dbm.return_value = mocked  # type: ignore
        result = service.get_all()
        assert not isinstance(result, int)
        assert isinstance(result, list)
        assert result == expected

    @mark.parametrize("status", [200, 400, 500])
    def test_doesnt_get_plugins_if_an_unexpected_error_occurs(
        self, service: PluginService, interface: PluginInterface, status: int
    ):
        """A Plugin service does not get all plugins if an unexpected error occurs."""
        service._send_message_to_dbm.return_value = get_response(status)  # type: ignore
        if status == 200:
            with raises(KeyError):
                result = service.get_all()
        else:
            result = service.get_all()
            assert isinstance(result, int)
            assert result == status

    @mark.parametrize("status", [200, 404, 423])
    def test_activates_a_plugin(
        self, service: PluginService, id: str, interface: PluginInterface, status: int
    ):
        """A Plugin service activates a plugin."""
        service._send_message_to_dbm.return_value = get_response(status)  # type: ignore
        result = service.activate_by_id(id, interface)
        assert result == status
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="activate plugin"),
                body={"id": id, "plugin": interface["name"]},
            )
        )

    @mark.parametrize("status", [200, 404, 423])
    def test_deactivates_a_plugin(
        self, service: PluginService, id: str, interface: PluginInterface, status: int
    ):
        """A Plugin service deactivates a plugin."""
        service._send_message_to_dbm.return_value = get_response(status)  # type: ignore
        result = service.deactivate_by_id(id, interface)
        assert result == status
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="deactivate plugin"),
                body={"id": id, "plugin": interface["name"]},
            )
        )

    @mark.parametrize("status", [200, 404, 423])
    def test_updates_plugin_setting(
        self,
        service: PluginService,
        id: str,
        interface_update_plugin_setting: UpdatePluginSettingInterface,
        status: int,
    ):
        """A Plugin service updates a plugin."""
        service._send_message_to_dbm.return_value = get_response(status)  # type: ignore
        result = service.update_plugin_setting(id, interface_update_plugin_setting)
        assert result == status
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="set plugin setting"),
                body={"id": id, "update": interface_update_plugin_setting},
            )
        )

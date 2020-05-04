"""Tests for the Plugin controller."""

from typing import Type
from unittest.mock import MagicMock

from pytest import fixture, mark, raises

from hyrisecockpit.api.app.plugin.interface import PluginInterface
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

    def test_gets_all_plugins(self, service: PluginService, interface: PluginInterface):
        """A Plugin service gets all activated plugins per database."""
        expected = get_response(200)
        expected["body"]["plugins"] = [
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
        service._send_message_to_dbm.return_value = expected  # type: ignore
        result = service.get_all()
        assert not isinstance(result, int)
        assert isinstance(result, list)
        assert result == expected["body"]["plugins"]

    def test_doesnt_get_plugins_if_a_database_error_occurs(
        self, service: PluginService, interface: PluginInterface
    ):
        """A Plugin service does not get all plugins if a database error occurs."""
        expected = get_response(200)
        expected["body"]["plugins"] = [
            {"id": "york", "plugins": None},
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
        service._send_message_to_dbm.return_value = expected  # type: ignore
        result = service.get_all()
        assert not isinstance(result, int)
        assert isinstance(result, list)
        assert result == expected["body"]["plugins"]

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

    def test_activates_a_plugin(
        self, service: PluginService, id: str, interface: PluginInterface
    ):
        """A Plugin service activates a plugin."""
        service._send_message_to_dbm.return_value = get_response(200)  # type: ignore
        result = service.activate_by_id(id, interface)
        assert result == 200
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="activate plugin"),
                body={"id": id, "plugin": interface["name"]},
            )
        )

    def test_doesnt_activate_when_id_not_available(
        self, service: PluginService, id: str, interface: PluginInterface
    ):
        """A Plugin service activates a plugin."""
        service._send_message_to_dbm.return_value = get_response(404)  # type: ignore
        result = service.activate_by_id(id, interface)
        assert result == 404
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="activate plugin"),
                body={"id": id, "plugin": interface["name"]},
            )
        )

    def test_doesnt_activate_when_database_blocked(
        self, service: PluginService, id: str, interface: PluginInterface
    ):
        """A Plugin service activates a plugin."""
        service._send_message_to_dbm.return_value = get_response(423)  # type: ignore
        result = service.activate_by_id(id, interface)
        assert result == 423
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="activate plugin"),
                body={"id": id, "plugin": interface["name"]},
            )
        )

    def test_deactivates_a_plugin(
        self, service: PluginService, id: str, interface: PluginInterface
    ):
        """A Plugin service deactivates a plugin."""
        service._send_message_to_dbm.return_value = get_response(200)  # type: ignore
        result = service.deactivate_by_id(id, interface)
        assert result == 200
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="deactivate plugin"),
                body={"id": id, "plugin": interface["name"]},
            )
        )

    def test_doesnt_deactivate_when_id_not_available(
        self, service: PluginService, id: str, interface: PluginInterface
    ):
        """A Plugin service deactivates a plugin."""
        service._send_message_to_dbm.return_value = get_response(404)  # type: ignore
        result = service.deactivate_by_id(id, interface)
        assert result == 404
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="deactivate plugin"),
                body={"id": id, "plugin": interface["name"]},
            )
        )

    def test_doesnt_deactivate_when_database_blocked(
        self, service: PluginService, id: str, interface: PluginInterface
    ):
        """A Plugin service deactivates a plugin."""
        service._send_message_to_dbm.return_value = get_response(423)  # type: ignore
        result = service.deactivate_by_id(id, interface)
        assert result == 423
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="deactivate plugin"),
                body={"id": id, "plugin": interface["name"]},
            )
        )

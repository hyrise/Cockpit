"""Tests for the Plugin controller."""

from typing import Type
from unittest.mock import MagicMock

from pytest import fixture

from hyrisecockpit.api.app.plugin.interface import PluginInterface
from hyrisecockpit.api.app.plugin.service import PluginService
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import get_response


@fixture
def database_id() -> str:
    """Get a database id."""
    return "york"


@fixture
def interface() -> PluginInterface:
    """Get a plugin interface."""
    return PluginInterface(name="Compression")


class TestPluginService:
    """Tests for the Plugin controller."""

    @fixture
    def service(self) -> Type[PluginService]:
        """Get a PluginService class without IPC."""
        PluginService._send_message_to_dbm = MagicMock()  # type: ignore
        return PluginService

    def test_activates_a_plugin(
        self, service: PluginService, database_id: str, interface: PluginInterface
    ):
        """A Plugin service activates a plugin."""
        service._send_message_to_dbm.return_value = get_response(200)  # type: ignore
        result = service.activate_by_id(database_id, interface)
        assert result == 200
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="activate plugin"),
                body={"id": database_id, "plugin": interface["name"]},
            )
        )

    def test_doesnt_activate_when_id_not_available(
        self, service: PluginService, database_id: str, interface: PluginInterface
    ):
        """A Plugin service activates a plugin."""
        service._send_message_to_dbm.return_value = get_response(404)  # type: ignore
        result = service.activate_by_id(database_id, interface)
        assert result == 404
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="activate plugin"),
                body={"id": database_id, "plugin": interface["name"]},
            )
        )

    def test_doesnt_activate_when_database_blocked(
        self, service: PluginService, database_id: str, interface: PluginInterface
    ):
        """A Plugin service activates a plugin."""
        service._send_message_to_dbm.return_value = get_response(423)  # type: ignore
        result = service.activate_by_id(database_id, interface)
        assert result == 423
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="activate plugin"),
                body={"id": database_id, "plugin": interface["name"]},
            )
        )

    def test_deactivates_a_plugin(
        self, service: PluginService, database_id: str, interface: PluginInterface
    ):
        """A Plugin service deactivates a plugin."""
        service._send_message_to_dbm.return_value = get_response(200)  # type: ignore
        result = service.deactivate_by_id(database_id, interface)
        assert result == 200
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="deactivate plugin"),
                body={"id": database_id, "plugin": interface["name"]},
            )
        )

    def test_doesnt_deactivate_when_id_not_available(
        self, service: PluginService, database_id: str, interface: PluginInterface
    ):
        """A Plugin service deactivates a plugin."""
        service._send_message_to_dbm.return_value = get_response(404)  # type: ignore
        result = service.deactivate_by_id(database_id, interface)
        assert result == 404
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="deactivate plugin"),
                body={"id": database_id, "plugin": interface["name"]},
            )
        )

    def test_doesnt_deactivate_when_database_blocked(
        self, service: PluginService, database_id: str, interface: PluginInterface
    ):
        """A Plugin service deactivates a plugin."""
        service._send_message_to_dbm.return_value = get_response(423)  # type: ignore
        result = service.deactivate_by_id(database_id, interface)
        assert result == 423
        service._send_message_to_dbm.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="deactivate plugin"),
                body={"id": database_id, "plugin": interface["name"]},
            )
        )

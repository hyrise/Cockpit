"""Tests for the Plugin interface."""
from pytest import fixture

from hyrisecockpit.api.app.plugin.interface import PluginInterface
from hyrisecockpit.api.app.plugin.model import Plugin


@fixture(params=["Clustering", "Compression"],)
def interface(request) -> PluginInterface:
    """Return a real Plugin interface."""
    return PluginInterface(name=request.param)


class TestPluginInterface:
    """Tests for the Plugin interface."""

    def test_creates(self, interface: PluginInterface):
        """A Plugin interface can be created."""
        assert interface

    def test_works(self, interface: PluginInterface):
        """A Plugin model can be created from an interface."""
        assert Plugin(**interface)

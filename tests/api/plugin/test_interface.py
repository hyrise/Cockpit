"""Tests for the Plugin interface."""
from typing import List

from pytest import fixture

from hyrisecockpit.api.app.plugin.interface import PluginIDInterface, PluginInterface
from hyrisecockpit.api.app.plugin.model import Plugin, PluginID


@fixture(params=["Clustering", "Compression"],)
def interface(request) -> PluginInterface:
    """Return a real Plugin interface."""
    return PluginInterface(name=request.param)


@fixture(params=[["Clustering"], ["Clustering", "Compression"]])
def plugins(request) -> List[Plugin]:
    """Return a List of plugins."""
    return [Plugin(name=name) for name in request.param]


@fixture
def id() -> str:
    """Return database id."""
    return "york"


@fixture
def interface_id(id: str, plugins: List[PluginInterface]) -> PluginIDInterface:
    """Return a real Plugin interface."""
    return PluginIDInterface(id=id, plugins=plugins)


class TestPluginInterface:
    """Tests for the Plugin interface."""

    def test_creates(self, interface: PluginInterface):
        """A Plugin interface can be created."""
        assert interface

    def test_works(self, interface: PluginInterface):
        """A Plugin model can be created from an interface."""
        assert Plugin(**interface)


class TestPluginIDInterface:
    """Tests for the Plugin ID interface."""

    def test_creates(self, interface_id: PluginIDInterface):
        """A PluginID interface can be created."""
        assert interface_id

    def test_works(self, interface_id: PluginIDInterface):
        """A PluginID model can be created from an interface."""
        assert PluginID(**interface_id)  # type: ignore

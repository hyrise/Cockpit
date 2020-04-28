"""Tests for the Plugin model."""
from typing import List

from pytest import fixture

from hyrisecockpit.api.app.plugin.model import Plugin, PluginID


@fixture(params=["Clustering", "Compression"],)
def plugin(request) -> Plugin:
    """Return a real Plugin model."""
    return Plugin(name=request.param)


@fixture(params=[["Clustering"], ["Clustering", "Compression"]])
def plugins(request) -> List[Plugin]:
    """Return a List of plugins."""
    return [Plugin(name=name) for name in request.param]


@fixture
def id() -> str:
    """Return a database id."""
    return "york"


@fixture
def plugin_id(id: str, plugins: List[Plugin]) -> PluginID:
    """Return a pluginID model."""
    return PluginID(id=id, plugins=plugins)


class TestPlugin:
    """Tests for the Plugin model."""

    def test_creates(self, plugin: Plugin):
        """A Plugin model can be created."""
        assert plugin


class TestPluginID:
    """Tests for the PluginID model."""

    def test_creates(self, plugin_id: PluginID):
        """A PluginID model can be created."""
        assert plugin_id

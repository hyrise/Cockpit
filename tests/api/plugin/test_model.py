"""Tests for the Plugin model."""
from pytest import fixture

from hyrisecockpit.api.app.plugin.model import Plugin


@fixture(params=["Clustering", "Compression"],)
def plugin(request) -> Plugin:
    """Return a real Plugin model."""
    return Plugin(name=request.param)


class TestPlugin:
    """Tests for the Plugin model."""

    def test_creates(self, plugin: Plugin):
        """A Plugin model can be created."""
        assert plugin

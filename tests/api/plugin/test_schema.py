"""Tests for the Plugin schema."""

from pytest import fixture, mark

from hyrisecockpit.api.app.plugin.interface import PluginInterface
from hyrisecockpit.api.app.plugin.model import Plugin
from hyrisecockpit.api.app.plugin.schema import PluginSchema


@fixture
def schema() -> PluginSchema:
    """Return a real Plugin schema."""
    return PluginSchema()


class TestPluginSchema:
    """Tests for the Plugin schema."""

    def test_creates(self, schema: PluginSchema):
        """A Workload schema can be created."""
        assert schema

    @mark.parametrize("name", ["Compression", "Clustering"])
    def test_deserializes(self, schema: PluginSchema, name: str):
        """A Workload schema can create a Workload model."""
        interface: PluginInterface = {
            "name": name,
        }
        deserialized: PluginInterface = schema.load(interface)
        plugin = Plugin(**deserialized)
        assert name == plugin.name == deserialized["name"]

    @mark.parametrize("name", ["Compression", "Clustering"])
    def test_serializes(self, schema: PluginSchema, name: str):
        """A Workload model can be serialized with a Workload schema."""
        interface: PluginInterface = {
            "name": name,
        }
        plugin = Plugin(**interface)
        serialized = schema.dump(plugin)
        assert name == plugin.name == serialized["name"]

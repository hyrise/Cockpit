"""Tests for the Plugin schema."""

from hyrisecockpit.api.app.plugin.interface import PluginInterface
from hyrisecockpit.api.app.plugin.model import Plugin
from hyrisecockpit.api.app.plugin.schema import PluginIDSchema, PluginSchema


class TestPluginSchema:
    """Tests for the Plugin schema."""

    def test_creates(self, schema: PluginSchema):
        """A Workload schema can be created."""
        assert schema

    def test_deserializes(self, schema: PluginSchema, interface: PluginInterface):
        """A Workload schema can create a Workload model."""
        deserialized: PluginInterface = schema.load(interface)
        assert deserialized
        plugin = Plugin(**deserialized)
        assert plugin
        assert interface["name"] == deserialized["name"] == plugin.name

    def test_serializes(self, schema: PluginSchema, interface: PluginInterface):
        """A Workload model can be serialized with a Workload schema."""
        plugin = Plugin(**interface)
        serialized = schema.dump(plugin)
        assert interface["name"] == plugin.name == serialized["name"]


class TestPluginIDSchema:
    """Tests for the PluginID schema."""

    def test_creates(self, schema_id: PluginIDSchema):
        """A Workload schema can be created."""
        assert schema_id

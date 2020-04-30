"""Tests for the Plugin schema."""

from hyrisecockpit.api.app.plugin.interface import (
    DetailedPluginInterface,
    PluginIDInterface,
    PluginInterface,
    PluginSettingBaseInterface,
    PluginSettingInterface,
)
from hyrisecockpit.api.app.plugin.model import (
    DetailedPlugin,
    Plugin,
    PluginID,
    PluginSetting,
    PluginSettingBase,
)
from hyrisecockpit.api.app.plugin.schema import (
    DetailedPluginSchema,
    PluginIDSchema,
    PluginSchema,
    PluginSettingBaseSchema,
    PluginSettingSchema,
)


class TestPluginSchema:
    """Tests for the Plugin schema."""

    def test_creates(self, schema: PluginSchema):
        """A Plugin schema can be created."""
        assert schema
        assert isinstance(schema, PluginSchema)

    def test_deserializes(self, schema: PluginSchema, interface: PluginInterface):
        """A Plugin schema can create a Plugin model."""
        deserialized: PluginInterface = schema.load(interface)
        assert deserialized
        plugin = Plugin(**deserialized)
        assert plugin
        assert interface["name"] == deserialized["name"] == plugin.name

    def test_serializes(self, schema: PluginSchema, interface: PluginInterface):
        """A Plugin model can be serialized with a Plugin schema."""
        plugin = Plugin(**interface)
        serialized: PluginInterface = schema.dump(plugin)
        assert interface["name"] == plugin.name == serialized["name"]


class TestPluginIDSchema:
    """Tests for the PluginID schema."""

    def test_creates(self, schema_id: PluginIDSchema):
        """A PluginID schema can be created."""
        assert schema_id
        assert isinstance(schema_id, PluginIDSchema)

    def test_deserializes(
        self, schema_id: PluginIDSchema, interface_id: PluginIDInterface
    ):
        """A PluginID schema can create a PluginID model."""
        deserialized: PluginIDInterface = schema_id.load(interface_id)
        assert deserialized
        plugin_id = PluginID(**deserialized)  # type: ignore
        assert plugin_id
        assert interface_id["id"] == deserialized["id"] == plugin_id.id
        assert interface_id["plugins"] == deserialized["plugins"] == plugin_id.plugins  # type: ignore

    def test_serializes(
        self, schema_id: PluginIDSchema, interface_id: PluginIDInterface
    ):
        """A PluginID model can be serialized with a PluginID schema."""
        plugin_id = PluginID(**interface_id)  # type: ignore
        serialized: PluginIDInterface = schema_id.dump(plugin_id)
        assert interface_id["id"] == plugin_id.id == serialized["id"]
        assert interface_id["plugins"] == plugin_id.plugins == serialized["plugins"]  # type: ignore


class TestPluginSettingBaseSchema:
    """Tests for the PluginSettingBase schema."""

    def test_creates(self, schema_setting_base: PluginSettingBaseSchema):
        """A PluginSettingBase schema can be created."""
        assert schema_setting_base
        assert isinstance(schema_setting_base, PluginSettingBaseSchema)

    def test_deserializes(
        self,
        schema_setting_base: PluginSettingBaseSchema,
        interface_setting_base: PluginSettingBaseInterface,
    ):
        """A PluginSettingBase schema can create a PluginSettingBase model."""
        deserialized: PluginSettingBaseInterface = schema_setting_base.load(
            interface_setting_base
        )
        assert deserialized
        plugin_setting_base = PluginSettingBase(**deserialized)
        assert plugin_setting_base
        assert (
            interface_setting_base["name"]
            == deserialized["name"]
            == plugin_setting_base.name
        )
        assert (
            interface_setting_base["value"]
            == deserialized["value"]
            == plugin_setting_base.value
        )

    def test_serializes(
        self,
        schema_setting_base: PluginSettingBaseSchema,
        interface_setting_base: PluginSettingBaseInterface,
    ):
        """A PluginSettingBase model can be serialized with a PluginSettingBase schema."""
        plugin_setting_base = PluginSettingBase(**interface_setting_base)
        serialized: PluginSettingBaseInterface = schema_setting_base.dump(
            plugin_setting_base
        )
        assert (
            interface_setting_base["name"]
            == plugin_setting_base.name
            == serialized["name"]
        )
        assert (
            interface_setting_base["value"]
            == plugin_setting_base.value
            == serialized["value"]
        )


class TestPluginSettingSchema:
    """Tests for the PluginSetting schema."""

    def test_creates(self, schema_setting: PluginSettingSchema):
        """A PluginSetting schema can be created."""
        assert schema_setting
        assert isinstance(schema_setting, PluginSettingSchema)

    def test_extends_base(self, schema_setting: PluginSettingSchema):
        """A PluginSetting schema extends the PluginSettingBase schema."""
        assert isinstance(schema_setting, PluginSettingBaseSchema)

    def test_deserializes(
        self,
        schema_setting: PluginSettingSchema,
        interface_setting: PluginSettingInterface,
    ):
        """A PluginSetting schema can create a PluginSetting model."""
        deserialized: PluginSettingInterface = schema_setting.load(interface_setting)
        assert deserialized
        plugin_setting = PluginSetting(**deserialized)
        assert plugin_setting
        assert (
            interface_setting["description"]
            == deserialized["description"]
            == plugin_setting.description
        )

    def test_serializes(
        self,
        schema_setting: PluginSettingSchema,
        interface_setting: PluginSettingInterface,
    ):
        """A PluginSetting model can be serialized with a PluginSetting schema."""
        plugin_setting = PluginSetting(**interface_setting)
        serialized: PluginSettingInterface = schema_setting.dump(plugin_setting)
        assert (
            interface_setting["description"]
            == plugin_setting.description
            == serialized["description"]
        )


class TestDetailedPluginSchema:
    """Tests for the DetailedPlugin schema."""

    def test_creates(self, schema_detailed_plugin: DetailedPluginSchema):
        """A DetailedPlugin schema can be created."""
        assert schema_detailed_plugin
        assert isinstance(schema_detailed_plugin, DetailedPluginSchema)

    def test_extends_base(self, schema_detailed_plugin: DetailedPluginSchema):
        """A DetailedPlugin schema extends the Plugin schema."""
        assert isinstance(schema_detailed_plugin, PluginSchema)

    def test_deserializes(
        self,
        schema_detailed_plugin: DetailedPluginSchema,
        interface_detailed_plugin: DetailedPluginInterface,
    ):
        """A DetailedPlugin schema can create a DetailedPlugin model."""
        deserialized: DetailedPluginInterface = schema_detailed_plugin.load(
            interface_detailed_plugin
        )
        assert deserialized
        detailed_plugin = DetailedPlugin(**deserialized)  # type: ignore
        assert detailed_plugin
        assert (
            interface_detailed_plugin["settings"]  # type: ignore
            == deserialized["settings"]
            == detailed_plugin.settings
        )

    def test_serializes(
        self,
        schema_detailed_plugin: DetailedPluginSchema,
        interface_detailed_plugin: DetailedPluginInterface,
    ):
        """A DetailedPlugin model can be serialized with a DetailedPlugin schema."""
        detailed_plugin = DetailedPlugin(**interface_detailed_plugin)  # type: ignore
        serialized: DetailedPluginInterface = schema_detailed_plugin.dump(
            detailed_plugin
        )
        assert (
            interface_detailed_plugin["settings"]  # type: ignore
            == detailed_plugin.settings
            == serialized["settings"]
        )

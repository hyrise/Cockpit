"""Tests for the Plugin schema."""

from hyrisecockpit.api.app.plugin.interface import (
    DetailedPluginIDInterface,
    DetailedPluginInterface,
    LogEntryInterface,
    LogIDInterface,
    PluginInterface,
    PluginSettingBaseInterface,
    PluginSettingInterface,
    UpdatePluginSettingInterface,
)
from hyrisecockpit.api.app.plugin.model import (
    DetailedPlugin,
    DetailedPluginID,
    LogEntry,
    LogID,
    Plugin,
    PluginSetting,
    PluginSettingBase,
    UpdatePluginSetting,
)
from hyrisecockpit.api.app.plugin.schema import (
    DetailedPluginIDSchema,
    DetailedPluginSchema,
    LogEntrySchema,
    LogIDSchema,
    PluginSchema,
    PluginSettingBaseSchema,
    PluginSettingSchema,
    UpdatePluginSettingSchema,
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


class TestDetailedPluginIDSchema:
    """Tests for the DetailedPluginID schema."""

    def test_creates(self, schema_detailed_plugin_id: DetailedPluginIDSchema):
        """A DetailedPluginID schema can be created."""
        assert schema_detailed_plugin_id
        assert isinstance(schema_detailed_plugin_id, DetailedPluginIDSchema)

    def test_deserializes(
        self,
        schema_detailed_plugin_id: DetailedPluginIDSchema,
        interface_detailed_plugin_id: DetailedPluginIDInterface,
    ):
        """A DetailedPluginID schema can create a DetailedPluginID model."""
        deserialized: DetailedPluginIDInterface = schema_detailed_plugin_id.load(
            interface_detailed_plugin_id
        )
        assert deserialized
        plugin_id = DetailedPluginID(**deserialized)  # type: ignore
        assert plugin_id
        assert interface_detailed_plugin_id["id"] == deserialized["id"] == plugin_id.id
        assert interface_detailed_plugin_id["plugins"] == deserialized["plugins"] == plugin_id.plugins  # type: ignore

    def test_serializes(
        self,
        schema_detailed_plugin_id: DetailedPluginIDSchema,
        interface_detailed_plugin_id: DetailedPluginIDInterface,
    ):
        """A DetailedPluginID model can be serialized with a DetailedPluginID schema."""
        plugin_id = DetailedPluginID(**interface_detailed_plugin_id)  # type: ignore
        serialized: DetailedPluginIDInterface = schema_detailed_plugin_id.dump(
            plugin_id
        )
        assert interface_detailed_plugin_id["id"] == plugin_id.id == serialized["id"]
        assert interface_detailed_plugin_id["plugins"] == plugin_id.plugins == serialized["plugins"]  # type: ignore


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


class TestUpdatePluginSettingSchema:
    """Tests for the PluginSetting schema."""

    def test_creates(self, schema_update_plugin_setting: UpdatePluginSettingSchema):
        """An UpdatePluginSetting schema can be created."""
        assert schema_update_plugin_setting
        assert isinstance(schema_update_plugin_setting, UpdatePluginSettingSchema)

    def test_extends_base(
        self, schema_update_plugin_setting: UpdatePluginSettingSchema
    ):
        """An UpdatePluginSetting schema extends the PluginSettingBase schema."""
        assert isinstance(schema_update_plugin_setting, PluginSchema)

    def test_deserializes(
        self,
        schema_update_plugin_setting: UpdatePluginSettingSchema,
        interface_update_plugin_setting: UpdatePluginSettingInterface,
    ):
        """An UpdatePluginSetting schema can create an UpdatePluginSetting model."""
        deserialized: UpdatePluginSettingInterface = schema_update_plugin_setting.load(
            interface_update_plugin_setting
        )
        assert deserialized
        update_plugin_setting = UpdatePluginSetting(**deserialized)  # type: ignore
        assert update_plugin_setting
        assert (
            interface_update_plugin_setting["setting"]  # type: ignore
            == deserialized["setting"]
            == update_plugin_setting.setting
        )

    def test_serializes(
        self,
        schema_update_plugin_setting: UpdatePluginSettingSchema,
        interface_update_plugin_setting: UpdatePluginSettingInterface,
    ):
        """An UpdatePluginSetting model can be serialized with an UpdatePluginSetting schema."""
        update_plugin_setting = UpdatePluginSetting(**interface_update_plugin_setting)  # type: ignore
        serialized: UpdatePluginSettingInterface = schema_update_plugin_setting.dump(
            update_plugin_setting
        )
        assert (
            interface_update_plugin_setting["setting"]  # type: ignore
            == update_plugin_setting.setting
            == serialized["setting"]
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


class TestLogEntry:
    """Tests for the LogEntry schema."""

    def test_creates(self, schema_log_entry: LogEntrySchema):
        """A LogEntry schema can be created."""
        assert schema_log_entry
        assert isinstance(schema_log_entry, LogEntrySchema)

    def test_deserializes(
        self, schema_log_entry: LogEntrySchema, interface_log_entry: LogEntryInterface,
    ):
        """A LogEntry schema can create a LogEntry model."""
        deserialized: LogEntryInterface = schema_log_entry.load(interface_log_entry)
        assert deserialized
        log_entry = LogEntry(**deserialized)
        assert log_entry
        assert (
            interface_log_entry["timestamp"]
            == deserialized["timestamp"]
            == log_entry.timestamp
        )
        assert (
            interface_log_entry["reporter"]
            == deserialized["reporter"]
            == log_entry.reporter
        )
        assert (
            interface_log_entry["message"]
            == deserialized["message"]
            == log_entry.message
        )
        assert interface_log_entry["level"] == deserialized["level"] == log_entry.level

    def test_serializes(
        self, schema_log_entry: LogEntrySchema, interface_log_entry: LogEntryInterface,
    ):
        """A LogEntry model can be serialized with a LogEntry schema."""
        log_entry = LogEntry(**interface_log_entry)
        serialized: LogEntryInterface = schema_log_entry.dump(log_entry)
        assert (
            interface_log_entry["timestamp"]
            == log_entry.timestamp
            == serialized["timestamp"]
        )
        assert (
            interface_log_entry["reporter"]
            == log_entry.reporter
            == serialized["reporter"]
        )
        assert (
            interface_log_entry["message"] == log_entry.message == serialized["message"]
        )
        assert interface_log_entry["level"] == log_entry.level == serialized["level"]


class TestLogID:
    """Tests for the LogID schema."""

    def test_creates(self, schema_log_id: LogIDSchema):
        """A LogID schema can be created."""
        assert schema_log_id
        assert isinstance(schema_log_id, LogIDSchema)

    def test_deserializes(
        self, schema_log_id: LogIDSchema, interface_log_id: LogIDInterface,
    ):
        """A LogID schema can create a LogID model."""
        deserialized: LogIDInterface = schema_log_id.load(interface_log_id)
        assert deserialized
        log_id = LogID(**deserialized)  # type: ignore
        assert log_id
        assert interface_log_id["id"] == deserialized["id"] == log_id.id
        assert (
            interface_log_id["log"]  # type: ignore
            == deserialized["log"]
            == log_id.log
        )

    def test_serializes(
        self, schema_log_id: LogIDSchema, interface_log_id: LogIDInterface,
    ):
        """A LogID model can be serialized with a LogID schema."""
        log_id = LogID(**interface_log_id)  # type: ignore
        serialized: LogIDInterface = schema_log_id.dump(log_id)
        assert interface_log_id["id"] == log_id.id == serialized["id"]
        assert (
            interface_log_id["log"]  # type: ignore
            == log_id.log
            == serialized["log"]
        )

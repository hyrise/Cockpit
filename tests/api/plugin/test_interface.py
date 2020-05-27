"""Tests for the Plugin interface."""

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


class TestPluginInterface:
    """Tests for the Plugin interface."""

    def test_creates(self, interface: PluginInterface):
        """A Plugin interface can be created."""
        assert interface

    def test_works(self, interface: PluginInterface):
        """A Plugin model can be created from an interface."""
        assert Plugin(**interface)


class TestPluginSettingBaseInterface:
    """Tests for the PluginSettingBase interface."""

    def test_creates(self, interface_setting_base: PluginSettingBaseInterface):
        """A PluginSettingBase interface can be created."""
        assert interface_setting_base

    def test_works(self, interface_setting_base: PluginSettingBaseInterface):
        """A PluginSettingBase model can be created from an interface."""
        assert PluginSettingBase(**interface_setting_base)


class TestPluginSettingInterface:
    """Tests for the PluginSetting interface."""

    def test_creates(self, interface_setting: PluginSettingInterface):
        """A PluginSetting interface can be created."""
        assert interface_setting

    def test_works(self, interface_setting: PluginSettingInterface):
        """A PluginSetting model can be created from an interface."""
        assert PluginSetting(**interface_setting)


class TestUpdatePluginSettingInterface:
    """Tests for the UpdatePluginSetting interface."""

    def test_creates(
        self, interface_update_plugin_setting: UpdatePluginSettingInterface
    ):
        """An UpdatePluginSetting interface can be created."""
        assert interface_update_plugin_setting

    def test_works(self, interface_update_plugin_setting: UpdatePluginSettingInterface):
        """An UpdatePluginSetting model can be created from an interface."""
        assert UpdatePluginSetting(**interface_update_plugin_setting)  # type: ignore


class TestDetailedPluginInterface:
    """Tests for the DetailedPlugin interface."""

    def test_creates(self, interface_detailed_plugin: DetailedPluginInterface):
        """A DetailedPlugin interface can be created."""
        assert interface_detailed_plugin

    def test_works(self, interface_detailed_plugin: DetailedPluginInterface):
        """A DetailedPlugin model can be created from an interface."""
        assert DetailedPlugin(**interface_detailed_plugin)  # type: ignore


class TestDetailedPluginIDInterface:
    """Tests for the detailed Plugin ID interface."""

    def test_creates(self, interface_detailed_plugin_id: DetailedPluginIDInterface):
        """A detailed PluginID interface can be created."""
        assert interface_detailed_plugin_id

    def test_works(self, interface_detailed_plugin_id: DetailedPluginIDInterface):
        """A detailed PluginID model can be created from an interface."""
        assert DetailedPluginID(**interface_detailed_plugin_id)  # type: ignore


class TestLogEntryInterface:
    """Tests for the Plugin Log Entry interface."""

    def tests_creates(self, interface_log_entry: LogEntryInterface):
        """A Plugin Log Entry interface can be created."""
        assert interface_log_entry

    def test_works(self, interface_log_entry: LogEntryInterface):
        """A Plugin Log Entry model can be created from an interface."""
        assert LogEntry(**interface_log_entry)


class TestLogIDInterface:
    """Tests for the Plugin Log per database interface."""

    def tests_creates(self, interface_log_id: LogIDInterface):
        """A Plugin Log per database interface can be created."""
        assert interface_log_id

    def test_works(self, interface_log_id: LogIDInterface):
        """A Plugin Log per database model can be created from an interface."""
        assert LogID(**interface_log_id)  # type: ignore

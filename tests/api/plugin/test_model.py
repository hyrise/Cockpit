"""Tests for the Plugin model."""
from hyrisecockpit.api.app.plugin.model import (
    DetailedPlugin,
    DetailedPluginID,
    Plugin,
    PluginSetting,
    PluginSettingBase,
)


class TestPlugin:
    """Tests for the Plugin model."""

    def test_creates(self, plugin: Plugin):
        """A Plugin model can be created."""
        assert plugin


class TestPluginSettingBase:
    """Tests for the PluginSettingBase model."""

    def test_creates(self, plugin_setting_base: PluginSettingBase):
        """A PluginSettingBase model can be created."""
        assert plugin_setting_base


class TestPluginSetting:
    """Tests for the PluginSetting model."""

    def test_creates(self, plugin_setting: PluginSetting):
        """A PluginSetting model can be created."""
        assert plugin_setting


class TestDetailedPlugin:
    """Tests for the DetailedPlugin model."""

    def test_creates(self, detailed_plugin: DetailedPlugin):
        """A DetailedPlugin model can be created."""
        assert detailed_plugin


class TestDetailedPluginID:
    """Tests for the detailed PluginID model."""

    def test_creates(self, detailed_plugin_id: DetailedPluginID):
        """A detailed PluginID model can be created."""
        assert detailed_plugin_id

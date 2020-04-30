"""Tests for the Plugin model."""
from hyrisecockpit.api.app.plugin.model import (
    DetailedPlugin,
    Plugin,
    PluginID,
    PluginSetting,
    PluginSettingBase,
)


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

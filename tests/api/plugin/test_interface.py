"""Tests for the Plugin interface."""

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


class TestDetailedPluginInterface:
    """Tests for the DetailedPlugin interface."""

    def test_creates(self, interface_detailed_plugin: DetailedPluginInterface):
        """A DetailedPlugin interface can be created."""
        assert interface_detailed_plugin

    def test_works(self, interface_detailed_plugin: DetailedPluginInterface):
        """A DetailedPlugin model can be created from an interface."""
        assert DetailedPlugin(**interface_detailed_plugin)  # type: ignore

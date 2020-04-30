"""Tests for the Plugin model."""
from typing import List

from pytest import fixture

from hyrisecockpit.api.app.plugin.model import (
    DetailedPlugin,
    Plugin,
    PluginID,
    PluginSetting,
    PluginSettingBase,
)


@fixture(params=["Clustering", "Compression"])
def name(request) -> str:
    """Return a Plugin name."""
    return request.param


@fixture(params=["york", "citadelle"])
def id(request) -> str:
    """Return a database id."""
    return request.param


@fixture(params=["MemoryBudget", "MyImaginarySetting"])
def setting_name(request) -> str:
    """Return a setting name."""
    return request.param


@fixture(params=["5000", "true"])
def setting_value(request) -> str:
    """Return a setting value."""
    return request.param


@fixture(params=["A description of the setting.", ""])
def setting_description(request) -> str:
    """Return a setting description."""
    return request.param


@fixture
def plugin(name: str) -> Plugin:
    """Return a Plugin model."""
    return Plugin(name)


@fixture
def plugins(plugin: Plugin) -> List[Plugin]:
    """Return a list of Plugins."""
    return [plugin]


@fixture
def plugin_id(id: str, plugins: List[Plugin]) -> PluginID:
    """Return a PluginID model."""
    return PluginID(id=id, plugins=plugins)


@fixture
def plugin_setting_base(setting_name: str, setting_value: str) -> PluginSettingBase:
    """Return a PluginSettingBase model."""
    return PluginSettingBase(setting_name, setting_value)


@fixture
def plugin_setting(
    setting_name: str, setting_value: str, setting_description: str
) -> PluginSetting:
    """Return a PluginSetting model."""
    return PluginSetting(setting_name, setting_value, setting_description)


@fixture
def settings(plugin_setting: PluginSetting) -> List[PluginSetting]:
    """Return a list of Plugin Settings."""
    return [plugin_setting]


@fixture
def detailed_plugin(name: str, settings: List[PluginSetting]) -> DetailedPlugin:
    """Return a DetailedPlugin model."""
    return DetailedPlugin(name, settings)


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

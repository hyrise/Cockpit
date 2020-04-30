"""Tests for the Plugin interface."""
from typing import List

from pytest import fixture

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


@fixture(params=["Clustering", "Compression"],)
def interface(request) -> PluginInterface:
    """Return a Plugin interface."""
    return PluginInterface(name=request.param)


@fixture
def interface_id(id: str, plugins: List[PluginInterface]) -> PluginIDInterface:
    """Return a Plugin interface."""
    return PluginIDInterface(id=id, plugins=plugins)


@fixture
def interface_setting_base(
    setting_name: str, setting_value: str
) -> PluginSettingBaseInterface:
    """Return a PluginSettingBase interface."""
    return PluginSettingBaseInterface(name=setting_name, value=setting_value)


@fixture
def interface_setting(
    setting_name: str, setting_value: str, setting_description: str
) -> PluginSettingInterface:
    """Return a PluginSetting interface."""
    return PluginSettingInterface(
        name=setting_name, value=setting_value, description=setting_description
    )


@fixture
def settings(interface_setting: PluginSettingInterface) -> List[PluginSettingInterface]:
    """Return a list of PluginSetting interfaces."""
    return [interface_setting]


@fixture
def interface_detailed_plugin(
    name: str, settings: List[PluginSettingInterface]
) -> DetailedPluginInterface:
    """Return a DetailedPlugin interface."""
    return DetailedPluginInterface(name=name, settings=settings)


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

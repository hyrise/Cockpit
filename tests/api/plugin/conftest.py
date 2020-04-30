"""Shared fixtures for the plugin tests."""
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
from hyrisecockpit.api.app.plugin.schema import (
    DetailedPluginSchema,
    PluginIDSchema,
    PluginSchema,
    PluginSettingBaseSchema,
    PluginSettingSchema,
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
def plugin_id(id: str, plugin: Plugin) -> PluginID:
    """Return a PluginID model."""
    return PluginID(id=id, plugins=[plugin])


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
def detailed_plugin(name: str, plugin_setting: PluginSetting) -> DetailedPlugin:
    """Return a DetailedPlugin model."""
    return DetailedPlugin(name, [plugin_setting])


@fixture
def interface(name: str) -> PluginInterface:
    """Return a Plugin interface."""
    return PluginInterface(name=name)


@fixture
def interface_id(id: str, interface: PluginInterface) -> PluginIDInterface:
    """Return a Plugin interface."""
    return PluginIDInterface(id=id, plugins=[interface])


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
def interface_detailed_plugin(
    name: str, interface_setting: PluginSettingInterface
) -> DetailedPluginInterface:
    """Return a DetailedPlugin interface."""
    return DetailedPluginInterface(name=name, settings=[interface_setting])


@fixture
def schema() -> PluginSchema:
    """Return a Plugin schema."""
    return PluginSchema()


@fixture
def schema_id() -> PluginIDSchema:
    """Return a PluginID schema."""
    return PluginIDSchema()


@fixture
def schema_setting_base() -> PluginSettingBaseSchema:
    """Return a PluginSettingBase schema."""
    return PluginSettingBaseSchema()


@fixture
def schema_setting() -> PluginSettingSchema:
    """Return a PluginSetting schema."""
    return PluginSettingSchema()


@fixture
def schema_detailed_plugin() -> DetailedPluginSchema:
    """Return a DetailedPlugin schema."""
    return DetailedPluginSchema()

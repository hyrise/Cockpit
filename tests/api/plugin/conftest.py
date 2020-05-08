"""Shared fixtures for the plugin tests."""
from pytest import fixture

from hyrisecockpit.api.app.plugin.interface import (
    DetailedPluginIDInterface,
    DetailedPluginInterface,
    PluginInterface,
    PluginSettingBaseInterface,
    PluginSettingInterface,
    UpdatePluginSettingInterface,
)
from hyrisecockpit.api.app.plugin.model import (
    DetailedPlugin,
    DetailedPluginID,
    Plugin,
    PluginSetting,
    PluginSettingBase,
    UpdatePluginSetting,
)
from hyrisecockpit.api.app.plugin.schema import (
    DetailedPluginIDSchema,
    DetailedPluginSchema,
    PluginSchema,
    PluginSettingBaseSchema,
    PluginSettingSchema,
    UpdatePluginSettingSchema,
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
def update_plugin_setting(name: str, plugin_setting: PluginSetting):
    """Return an UpdatePluginSetting model."""
    return UpdatePluginSetting(name=name, setting=plugin_setting)


@fixture
def detailed_plugin(name: str, plugin_setting: PluginSetting) -> DetailedPlugin:
    """Return a DetailedPlugin model."""
    return DetailedPlugin(name, [plugin_setting])


@fixture
def detailed_plugin_id(id: str, detailed_plugin: DetailedPlugin) -> DetailedPluginID:
    """Return a PluginID model."""
    return DetailedPluginID(id=id, plugins=[detailed_plugin])


@fixture
def interface(name: str) -> PluginInterface:
    """Return a Plugin interface."""
    return PluginInterface(name=name)


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
def interface_update_plugin_setting(
    name: str, interface_setting_base: PluginSettingBaseInterface
):
    """Retrun an UpdatePluginSetting interface."""
    return UpdatePluginSettingInterface(name=name, setting=interface_setting_base)


@fixture
def interface_detailed_plugin(
    name: str, interface_setting: PluginSettingInterface
) -> DetailedPluginInterface:
    """Return a DetailedPlugin interface."""
    return DetailedPluginInterface(name=name, settings=[interface_setting])


@fixture
def interface_detailed_plugin_id(
    id: str, interface_detailed_plugin: DetailedPluginInterface
) -> DetailedPluginIDInterface:
    """Return a Plugin interface."""
    return DetailedPluginIDInterface(id=id, plugins=[interface_detailed_plugin])


@fixture
def schema() -> PluginSchema:
    """Return a Plugin schema."""
    return PluginSchema()


@fixture
def schema_setting_base() -> PluginSettingBaseSchema:
    """Return a PluginSettingBase schema."""
    return PluginSettingBaseSchema()


@fixture
def schema_setting() -> PluginSettingSchema:
    """Return a PluginSetting schema."""
    return PluginSettingSchema()


@fixture
def schema_update_plugin_setting() -> UpdatePluginSettingSchema:
    """Return an UpdatePluginSetting schema."""
    return UpdatePluginSettingSchema()


@fixture
def schema_detailed_plugin() -> DetailedPluginSchema:
    """Return a DetailedPlugin schema."""
    return DetailedPluginSchema()


@fixture
def schema_detailed_plugin_id() -> DetailedPluginIDSchema:
    """Return a PluginID schema."""
    return DetailedPluginIDSchema()

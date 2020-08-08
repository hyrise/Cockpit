"""Shared fixtures for the plugin tests."""
from flask import Flask
from flask.testing import FlaskClient
from pytest import fixture

from hyrisecockpit.api.app import create_app
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


@fixture(params=[0, 1583847966784])
def timestamp(request) -> int:
    """Return a timestamp."""
    return request.param


@fixture
def reporter(name: str) -> str:
    """Return a Plugin Log Reporter."""
    return name


@fixture(params=["No optimization possible with given parameters!"])
def message(request) -> str:
    """Return a Plugin Log message."""
    return request.param


@fixture(params=["Warning"])
def level(request) -> str:
    """Return a Plugin Log Entry Level."""
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
def log_entry(timestamp: int, reporter: str, message: str, level: str) -> LogEntry:
    """Return a Plugin Log Entry Model."""
    return LogEntry(timestamp, reporter, message, level)


@fixture
def log_id(id: str, log_entry: LogEntry) -> LogID:
    """Return a Plugin Log per database model."""
    return LogID(id, [log_entry])


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
def interface_log_entry(
    timestamp: int, reporter: str, message: str, level: str
) -> LogEntryInterface:
    """Return a Plugin Log Entry interface."""
    return LogEntryInterface(
        timestamp=timestamp, reporter=reporter, message=message, level=level
    )


@fixture
def interface_log_id(id: str, interface_log_entry: LogEntryInterface) -> LogIDInterface:
    """Return a Plugin Log per database interface."""
    return LogIDInterface(id=id, log=[interface_log_entry])


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


@fixture
def schema_log_entry() -> LogEntrySchema:
    """Return a Plugin Log Entry schema."""
    return LogEntrySchema()


@fixture
def schema_log_id() -> LogIDSchema:
    """Return a Plugin Log per database schema."""
    return LogIDSchema()


@fixture
def app() -> Flask:
    """Return a testing app."""
    app = create_app()
    app.testing = True
    return app


@fixture
def client(app: Flask) -> FlaskClient:
    """Return a test client."""
    with app.test_client() as client:
        return client

"""Interface of a Plugin."""
from typing import List, Optional, TypedDict


class PluginInterface(TypedDict):
    """Interface of a Plugin."""

    name: str


class PluginSettingBaseInterface(TypedDict):
    """Base interface of a Plugin Setting."""

    name: str
    value: str


class UpdatePluginSettingInterface(PluginInterface):
    """Interface of an UpdatePluginSetting."""

    setting: PluginSettingBaseInterface


class PluginSettingInterface(PluginSettingBaseInterface):
    """Interface of a Plugin Setting."""

    description: str


class DetailedPluginInterface(PluginInterface):
    """Interface of a detailed Plugin."""

    settings: List[PluginSettingInterface]


class DetailedPluginIDInterface(TypedDict):
    """Interface of detailed Plugins per database."""

    id: str
    plugins: Optional[List[DetailedPluginInterface]]


class LogEntryInterface(TypedDict):
    """Interface of a Plugin Log Entry."""

    timestamp: int
    reporter: str
    message: str
    level: str


class LogIDInterface(TypedDict):
    """Interface of a Plugin Log per database."""

    id: str
    log: List[LogEntryInterface]

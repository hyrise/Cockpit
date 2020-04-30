"""Interface of a Plugin."""
from typing import List, Optional, TypedDict


class PluginInterface(TypedDict):
    """Interface of a Plugin."""

    name: str


class PluginIDInterface(TypedDict):
    """Interface of Plugins per database."""

    id: str
    plugins: Optional[List[PluginInterface]]


class PluginSettingBaseInterface(TypedDict):
    """Base interface of a Plugin Setting."""

    name: str
    value: str


class PluginSettingInterface(PluginSettingBaseInterface):
    """Interface of a Plugin Setting."""

    description: str


class DetailedPluginInterface(PluginInterface):
    """Interface of a detailed Plugin."""

    settings: List[PluginSettingInterface]

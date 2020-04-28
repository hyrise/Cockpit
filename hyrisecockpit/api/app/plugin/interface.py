"""Interface of a Plugin."""
from typing import List, TypedDict


class PluginInterface(TypedDict):
    """Interface of a Plugin."""

    name: str


class PluginIDInterface(TypedDict):
    """Interface for a pluginlist per database."""

    id: str
    plugins: List[PluginInterface]

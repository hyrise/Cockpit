"""Interface of a Plugin."""
from typing import List, Optional, TypedDict


class PluginInterface(TypedDict):
    """Interface of a Plugin."""

    name: str


class PluginIDInterface(TypedDict):
    """Interface of Plugins per database."""

    id: str
    plugins: Optional[List[PluginInterface]]

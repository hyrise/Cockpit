"""Model of a Plugin."""
from typing import List


class Plugin:
    """Model of a Plugin."""

    def __init__(self, name: str):
        """Initialize a Plugin model."""
        self.name: str = name


class PluginID:
    """Model of Plugins per database."""

    def __init__(self, id: str, plugins: List[Plugin]):
        """Initialize a Plugins per database model."""
        self.id: str = id
        self.plugins: List[Plugin] = plugins

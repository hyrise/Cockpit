"""Model of a Plugin."""
from typing import List, Optional


class Plugin:
    """Model of a Plugin."""

    def __init__(self, name: str) -> None:
        """Initialize a Plugin model."""
        self.name: str = name


class PluginID:
    """Model of Plugins per database."""

    def __init__(self, id: str, plugins: Optional[List[Plugin]]) -> None:
        """Initialize a Plugins per database model."""
        self.id: str = id
        self.plugins: Optional[List[Plugin]] = plugins


class PluginSettingBase:
    """Base model of a Plugin Setting."""

    def __init__(self, name: str, value: str) -> None:
        """Initialize a Plugin Setting model."""
        self.name: str = name
        self.value: str = value


class PluginSetting(PluginSettingBase):
    """Model of a Plugin Setting."""

    def __init__(self, name: str, value: str, description: str) -> None:
        """Initialize a Plugin Setting model."""
        super().__init__(name, value)
        self.description: str = description


class DetailedPlugin(Plugin):
    """Model of a detailed Plugin."""

    def __init__(self, name: str, settings: List[PluginSetting]) -> None:
        """Initialize a detailed Plugin."""
        super().__init__(name)
        self.settings: List[PluginSetting] = settings

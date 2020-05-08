"""Model of a Plugin."""
from typing import List, Optional


class Plugin:
    """Model of a Plugin."""

    def __init__(self, name: str) -> None:
        """Initialize a Plugin model."""
        self.name: str = name


class PluginSettingBase:
    """Base model of a Plugin Setting."""

    def __init__(self, name: str, value: str) -> None:
        """Initialize a Plugin Setting model."""
        self.name: str = name
        self.value: str = value


class UpdatePluginSetting(Plugin):
    """Model of an UpdatePluginSetting."""

    def __init__(self, name: str, setting: PluginSettingBase):
        """Initialize an UpdatePluginSetting."""
        super().__init__(name)
        self.setting: PluginSettingBase = setting


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
        self.settings: Optional[List[PluginSetting]] = settings


class DetailedPluginID:
    """Model of detailed Plugins per database."""

    def __init__(self, id: str, plugins: Optional[List[DetailedPlugin]]) -> None:
        """Initialize a detailed Plugins per database model."""
        self.id: str = id
        self.plugins: Optional[List[DetailedPlugin]] = plugins

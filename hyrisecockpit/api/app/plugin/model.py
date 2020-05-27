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
        self.settings: List[PluginSetting] = settings


class DetailedPluginID:
    """Model of detailed Plugins per database."""

    def __init__(self, id: str, plugins: Optional[List[DetailedPlugin]]) -> None:
        """Initialize a detailed Plugins per database model."""
        self.id: str = id
        self.plugins: Optional[List[DetailedPlugin]] = plugins


class LogEntry:
    """Model of a Plugin Log Entry."""

    def __init__(self, timestamp: int, reporter: str, message: str, level: str) -> None:
        """Initialize a Plugin Log Entry model."""
        self.timestamp: int = timestamp
        self.reporter: str = reporter
        self.message: str = message
        self.level: str = level


class LogID:
    """Model of Plugin Logs per database."""

    def __init__(self, id: str, log: List[LogEntry]) -> None:
        """Initialize a Plugin Log per database model."""
        self.id: str = id
        self.log: List[LogEntry] = log

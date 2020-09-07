"""Job to get detailed plug-in information."""

from typing import Dict, List, Optional, TypedDict

from psycopg2 import DatabaseError, InterfaceError

PluginSetting = TypedDict(
    "PluginSetting", {"name": str, "value": str, "description": str}
)
Plugins = Optional[Dict[str, List[PluginSetting]]]


def _get_plugins(connection_factory) -> Optional[List[str]]:
    """Return all currently activated plugins."""
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(("SELECT name FROM meta_plugins;"), None)
            rows = cur.fetchall()
    except (DatabaseError, InterfaceError):
        return None
    else:
        return [row[0].split("Plugin")[0] for row in rows]


def _get_plugin_setting(connection_factory) -> Plugins:
    """Return currently set plugin settings."""
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(
                "SELECT name, value, description FROM meta_settings WHERE name LIKE 'Plugin::%';",
                None,
            )
            rows = cur.fetchall()
    except (DatabaseError, InterfaceError):
        return None
    else:
        plugins: Dict[str, List[PluginSetting]] = {}
        for row in rows:
            plugin_name, setting_name = row[0].split("::")[1:]
            value, description = row[1], row[2]
            if plugins.get(plugin_name) is None:
                plugins[plugin_name] = []
            plugins[plugin_name].append(
                PluginSetting(name=setting_name, value=value, description=description)
            )
        return plugins


def get_detailed_plugins(connection_factory) -> Plugins:
    """Get all activated plugins with their settings."""
    if (plugins := _get_plugins(connection_factory)) is None:
        return None
    if (settings := _get_plugin_setting(connection_factory)) is None:
        return None
    return {
        plugin_name: (settings[plugin_name] if plugin_name in settings.keys() else [])
        for plugin_name in plugins
    }

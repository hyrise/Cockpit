"""Jobs that are interacting with plug-ins."""
from typing import Dict, List, Optional, TypedDict

from psycopg2 import DatabaseError, InterfaceError
from psycopg2.extensions import AsIs

from hyrisecockpit.database_manager.cursor import ConnectionFactory

PluginSetting = TypedDict(
    "PluginSetting", {"name": str, "value": str, "description": str}
)
Plugins = Optional[Dict[str, List[PluginSetting]]]


def activate_plugin(connection_factory: ConnectionFactory, plugin: str) -> None:
    """Activate plug-in in database."""
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(
                (
                    "INSERT INTO meta_plugins(name) VALUES ('/usr/local/hyrise/lib/lib%sPlugin.so');"
                ),
                (AsIs(plugin),),
            )
    except (DatabaseError, InterfaceError):
        return None  # TODO: log that activate plug-in failed


def deactivate_plugin(connection_factory: ConnectionFactory, plugin: str) -> None:
    """Deactivate plug-in in database."""
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(
                ("DELETE FROM meta_plugins WHERE name='%sPlugin';"), (AsIs(plugin),)
            )
    except (DatabaseError, InterfaceError):
        return None  # TODO: log that deactivate plug-in failed


def get_plugins(connection_factory: ConnectionFactory) -> Optional[List[str]]:
    """Return all currently activated plugins."""
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(("SELECT name FROM meta_plugins;"), None)
            rows = cur.fetchall()
    except (DatabaseError, InterfaceError):
        return None
    else:
        return [row[0].split("Plugin")[0] for row in rows]


def get_plugin_setting(connection_factory: ConnectionFactory) -> Plugins:
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


def get_detailed_plugins(connection_factory: ConnectionFactory) -> Plugins:
    """Get all activated plugins with their settings."""
    if (plugins := get_plugins(connection_factory)) is None:
        return None
    if (settings := get_plugin_setting(connection_factory)) is None:
        return None
    return {
        plugin_name: (settings[plugin_name] if plugin_name in settings.keys() else [])
        for plugin_name in plugins
    }


def set_plugin_setting(
    connection_factory: ConnectionFactory,
    database_blocked,
    plugin_name: str,
    setting_name: str,
    setting_value: str,
) -> bool:
    """Adjust setting for given plugin."""
    if not database_blocked.value:
        try:
            with connection_factory.create_cursor() as cur:
                cur.execute(
                    "UPDATE meta_settings SET value=%s WHERE name=%s;",
                    (setting_value, "::".join(["Plugin", plugin_name, setting_name]),),
                )
            return True
        except (DatabaseError, InterfaceError):
            return False
    return False

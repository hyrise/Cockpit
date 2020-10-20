"""Job to get detailed plug-in information."""

from typing import Dict, List, Optional, TypedDict, Tuple, Any

from psycopg2 import DatabaseError, InterfaceError

PluginSetting = TypedDict(
    "PluginSetting",
    {"name": str, "value": str, "description": str, "display_name": str},
)
Plugins = Optional[Dict[str, List[PluginSetting]]]


def get_plugins(connection_factory) -> Optional[List[str]]:
    """Return all currently activated plugins.

    Args:
        connection_factory (ConnectionFactory): A factory that returns a wrapper object around a psycopg2
            cursor that is connected to the hyrise database. All the attributes needed
            to connect to the hyrise are already defined inside the factory.

    Example:
        If the meta_plugins table inside the hyrise has the form:
        |name|
        -------------------
        |ClusteringPlugin|
        |CompressionPlugin|
        The cur (cursor) would return [('ClusteringPlugin',),('CompressionPlugin',)].
        Every entire in this list is a row. Afterwards we extract with the string method
        split("Plugin") ever plug-in name. So the function would return ['Clustering', 'Compression'].
    """
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(("SELECT name FROM meta_plugins;"), None)
            rows: List[Tuple[Any, ...]] = cur.fetchall()
    except (DatabaseError, InterfaceError):
        return None
    else:
        return [row[0].split("Plugin")[0] for row in rows]


def _get_plugin_setting(connection_factory) -> Plugins:
    """Return currently set plug-in setting.

    The plug-in settings are obtained from the meta_settings table in the hyrise instance.
    Inside the hyrise instance not just plug-ins have settings. As a result we need to differentiate
    the plug-in settings from the other settings. That's why we use the SQL Statement WHERE name LIKE 'Plugin::%';.
    To get the plug-in name with which we communicate in the cockpit we need to extract it from the name column with
    row[0].split("::")[1]. So for example from Plugin::Compression::MemorySetting we get Compression.

    Args:
        connection_factory (ConnectionFactory): A factory that returns a wrapper object around a psycopg2
            cursor that is connected to the hyrise database. All the attributes needed
            to connect to the hyrise are already defined inside the factory.
    """
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(
                "SELECT name, value, description, display_name FROM meta_settings WHERE name LIKE 'Plugin::%';",
                None,
            )
            rows = cur.fetchall()
    except (DatabaseError, InterfaceError):
        return None
    else:
        plugins: Dict[str, List[PluginSetting]] = {}
        for row in rows:
            plugin_name, setting_name = row[0].split("::")[1:]
            value, description, display_name = row[1:]
            if plugins.get(plugin_name) is None:
                plugins[plugin_name] = []
            plugins[plugin_name].append(
                PluginSetting(
                    name=setting_name,
                    display_name=display_name,
                    value=value,
                    description=description,
                )
            )
        return plugins


def get_detailed_plugins(connection_factory) -> Plugins:
    """Get all activated plugins with their settings."""
    if (plugins := get_plugins(connection_factory)) is None:
        return None
    if (settings := _get_plugin_setting(connection_factory)) is None:
        return None
    detailed_plugins = {}
    for plugin_name in plugins:
        if plugin_name in settings.keys():
            detailed_plugins[plugin_name] = settings[plugin_name]
        else:
            detailed_plugins[plugin_name] = []
    return detailed_plugins

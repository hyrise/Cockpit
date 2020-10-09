"""Job for setting plug-in settings."""
from psycopg2 import DatabaseError, InterfaceError


def set_plugin_setting(
    plugin_name: str,
    setting_name: str,
    setting_value: str,
    connection_factory,
    database_blocked,
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

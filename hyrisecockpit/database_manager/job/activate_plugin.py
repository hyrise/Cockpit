"""This job activates a plug-in."""

from psycopg2 import DatabaseError, InterfaceError
from psycopg2.extensions import AsIs

from hyrisecockpit.database_manager.cursor import ConnectionFactory


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

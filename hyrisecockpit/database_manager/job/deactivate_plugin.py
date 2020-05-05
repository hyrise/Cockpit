"""This job deactivates a plug-in."""

from psycopg2 import DatabaseError, InterfaceError
from psycopg2.extensions import AsIs

from hyrisecockpit.database_manager.cursor import ConnectionFactory


def deactivate_plugin(connection_factory: ConnectionFactory, plugin: str) -> None:
    """Deactivate plug-in in database."""
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(
                ("DELETE FROM meta_plugins WHERE name='%sPlugin';"), (AsIs(plugin),)
            )
    except (DatabaseError, InterfaceError):
        return None  # TODO: log that deactivate plug-in failed

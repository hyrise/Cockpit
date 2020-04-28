"""This job checks if the hyrise is still alive."""
from psycopg2 import DatabaseError, InterfaceError


def ping_hyrise(connection_factory, hyrise_active) -> None:
    """Check in interval if hyrise is still alive."""
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute("SELECT 1;", None)
            hyrise_active.value = True
    except (DatabaseError, InterfaceError):
        hyrise_active.value = False

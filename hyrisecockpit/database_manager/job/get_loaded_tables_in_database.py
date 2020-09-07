"""This job return all loaded tables in the database."""

from typing import Dict, List

from psycopg2 import DatabaseError, InterfaceError


def get_loaded_tables_in_database(connection_factory) -> List[Dict[str, str]]:
    """Return already loaded tables."""
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute("select * from meta_tables;", None)
            rows = cur.fetchall()
    except (DatabaseError, InterfaceError):
        return []
    else:
        return [row[0] for row in rows] if rows else []

"""This job return loaded tables for scale factor."""
from typing import List

from psycopg2 import DatabaseError, InterfaceError


def get_loaded_tables(tables: List[str], connection_factory) -> List[str]:
    """Check which tables exists and which not."""
    loaded_tables: List = []
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute("select * from meta_tables;", None)
            results = cur.fetchall()
            all_loaded_tables = [row[0] for row in results] if results else []
            loaded_tables = [table for table in tables if table in all_loaded_tables]
    except (DatabaseError, InterfaceError):
        return []
    else:
        return loaded_tables

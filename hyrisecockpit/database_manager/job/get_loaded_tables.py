"""This job return loaded tables for scale factor."""
from typing import List

from psycopg2 import DatabaseError, InterfaceError


def get_loaded_tables_for_scale_factor(
    tables: List[str], benchmark: str, scale_factor: str, connection_factory
) -> List[str]:
    """Check which tables exists and which not."""
    loaded_tables: List = []
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute("show tables;", None)
            results = cur.fetchall()
            loaded_tables = [row[0] for row in results] if results else []
            for table in tables:
                if f"{table}_{benchmark}_{scale_factor}" in loaded_tables:
                    loaded_tables.append(table)

    except (DatabaseError, InterfaceError):
        return []
    else:
        return loaded_tables

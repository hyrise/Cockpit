"""This job returns all loaded tables in the database."""

from typing import Dict, List, Tuple, Any

from psycopg2 import DatabaseError, InterfaceError


def get_loaded_tables_in_database(connection_factory) -> List[Dict[str, str]]:
    """Return the database's current tables.

    Args:
        connection_factory (ConnectionFactory): A factory that returns a wrapper object around a psycopg2
            cursor that is connected to the hyrise database. All the attributes needed
            to connect to the hyrise are already defined inside the factory.

    Example:
        If the meta_tables table inside the hyrise has the form:
        |table_name|
        -------------------
        |region_tpch_0_1|
        |customer_tpch_0_1|
        The cur (cursor) would return [('region_tpch_0_1',),('customer_tpch_0_1',)].
        Every entire in this list is a row. Afterwards we extract every table name.
        So the function would return ['region_tpch_0_1', 'customer_tpch_0_1'].
    """
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute("SELECT table_name from meta_tables;", None)
            rows: List[Tuple[Any, ...]] = cur.fetchall()
    except (DatabaseError, InterfaceError):
        return []
    else:
        return [row[0] for row in rows] if rows else []

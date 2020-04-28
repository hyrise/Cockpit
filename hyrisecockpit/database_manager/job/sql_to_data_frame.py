"""This job reads an sql query and converts the results to a data-frame."""
from typing import Optional, Tuple

from pandas import DataFrame
from psycopg2 import DatabaseError, InterfaceError


def sql_to_data_frame(
    database_blocked, connection_factory, sql: str, params: Optional[Tuple]
) -> DataFrame:
    """Execute sql query and convert result to data-frame."""
    if database_blocked.value:
        return DataFrame()
    try:
        with connection_factory.create_cursor() as cur:
            return cur.read_sql_query(sql, params)
    except (DatabaseError, InterfaceError):
        return DataFrame()

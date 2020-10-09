"""Job to execute SQL query."""
from typing import List, Optional, TypedDict

from psycopg2 import Error


class SqlResultInterface(TypedDict):
    """Interface of a sql result."""

    id: str
    successful: bool
    results: List[List[str]]
    col_names: List[str]
    error_message: str


def execute_sql_query(
    query, connection_factory, database_blocked, database_id
) -> Optional[SqlResultInterface]:
    """Execute sql query on database."""
    if not database_blocked.value:
        try:
            with connection_factory.create_cursor() as cur:
                cur.execute(query, None)
                col_names = cur.fetch_column_names()
                return SqlResultInterface(
                    id=database_id,
                    successful=True,
                    results=[[str(col) for col in row] for row in cur.fetchall()],
                    col_names=col_names,
                    error_message="",
                )
        except Error as e:
            return SqlResultInterface(
                id=database_id,
                successful=False,
                results=[],
                col_names=[],
                error_message=str(e),
            )
    return None

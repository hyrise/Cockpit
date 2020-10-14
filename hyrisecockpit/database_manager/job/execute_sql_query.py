"""Job to execute SQL query."""
from typing import List, Optional, TypedDict, Tuple, Any

from psycopg2 import Error as psycopg2Errors


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
    """Execute sql query on database.

    This function executes a sql query via a psycopg2 cursor in a hyrise.

    Args:
        query (str): SQL query that should be executed in the hyrise database.
        connection_factory (ConnectionFactory): A factory that returns a wrapper object around a psycopg2
            cursor that is connected to the hyrise database. All the attributes needed
            to connect to the hyrise are already defined inside the factory.
        database_blocked: Flag stored in a shared memory map. This flag
                stores if the Hyrise instance is blocked or not.
        database_id: A string identifying the Hyrise instance. For example hyrise_1.
    """
    if not database_blocked.value:
        try:
            with connection_factory.create_cursor() as cur:
                cur.execute(query, None)
                col_names: List[str] = cur.fetch_column_names()
                results: List[Tuple[Any, ...]] = cur.fetchall()
                return SqlResultInterface(
                    id=database_id,
                    successful=True,
                    results=[[str(col) for col in row] for row in results],
                    col_names=col_names,
                    error_message="",
                )
        except psycopg2Errors as e:
            return SqlResultInterface(
                id=database_id,
                successful=False,
                results=[],
                col_names=[],
                error_message=str(e),
            )
    return None

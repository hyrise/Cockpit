"""This job sends a sql query to the database and returns the result."""

from typing import Optional

from psycopg2 import Error

from hyrisecockpit.database_manager.interface import SqlResultInterface


def execute_sql_query(
    connection_factory, database_blocked, database_id, query
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

from hyrisecockpit.database_manager.cursor import ConnectionFactory
from psycopg2 import DatabaseError, InterfaceError


def execute_sql(sql: str, connection_factory: ConnectionFactory):
    """Execute sql on hyrise.

    This function executes a sql query via a psycopg2 cursor in a hyrise. If an error occurs
    in the hyrise, the methods returns an empty list. This is a very light error handling
    to make sure the cockpit is still running even when the hyrise is not responsive for
    a moment.

    Args:
        sql (str): SQL query that should be executed in the hyrise database.
        connection_factory (ConnectionFactory): A factory that returns a wrapper object around a psycopg2
            cursor that is connected to the hyrise database. All the attributes needed
            to connect to the hyrise are already defined inside the factory.
    """

    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(sql, None)
            return cur.fetchall()
    except (DatabaseError, InterfaceError):
        return []

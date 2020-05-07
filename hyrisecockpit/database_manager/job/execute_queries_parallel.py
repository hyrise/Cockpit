"""This job execute queries parallel in separate processes."""
from multiprocessing import Process
from typing import Any, List, Optional, Tuple

from psycopg2 import DatabaseError, InterfaceError, ProgrammingError
from psycopg2.extensions import AsIs

from hyrisecockpit.database_manager.cursor import ConnectionFactory


def _format_query_parameters(parameters) -> Optional[Tuple[Any, ...]]:
    """Format query parameters for execution."""
    formatted_parameters = (
        tuple(
            AsIs(parameter) if protocol == "as_is" else parameter
            for parameter, protocol in parameters
        )
        if parameters is not None
        else None
    )
    return formatted_parameters


def _execute_table_query(
    query_tuple: Tuple, connection_factory: ConnectionFactory
) -> None:
    """Execute loading or deleting table query."""
    query, parameters = query_tuple
    formatted_parameters = _format_query_parameters(parameters)
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(query, formatted_parameters)
    except (DatabaseError, InterfaceError, ProgrammingError):
        return None  # TODO: log error


def execute_queries_parallel(queries, connection_factory: ConnectionFactory) -> None:
    """Start processes for query execution."""
    processes: List[Process] = [
        Process(target=_execute_table_query, args=(query, connection_factory),)
        for query in queries
    ]
    for process in processes:
        process.start()
    for process in processes:
        process.join()
        process.terminate()

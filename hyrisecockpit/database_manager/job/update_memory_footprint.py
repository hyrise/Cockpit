from time import time_ns
from psycopg2 import DatabaseError, InterfaceError

from hyrisecockpit.database_manager.cursor import (
    ConnectionFactory,
    StorageConnectionFactory,
)


def _get_memory_footprint(connection_factory: ConnectionFactory):
    time_stamp = time_ns()
    sql = "SELECT SUM(estimated_size_in_bytes) FROM meta_segments;"
    memory_footprint = 0.0
    try:
        with connection_factory.create_cursor() as cur:
            cur.execute(sql, None)
            response = cur.fetchone()
            # If no tables are loaded the response would be (None,)
            if response[0] is not None:
                memory_footprint = float(response[0])
    except (DatabaseError, InterfaceError):
        memory_footprint = 0.0
    return time_stamp, memory_footprint


def update_memory_footprint(
    connection_factory: ConnectionFactory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    time_stamp, memory_footprint = _get_memory_footprint(connection_factory)
    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "memory_footprint",
            {"memory_footprint": memory_footprint},
            time_stamp,
        )

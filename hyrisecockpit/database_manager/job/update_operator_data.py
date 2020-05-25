"""Job for updating the operator data."""

from json import dumps
from time import time_ns

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


def update_operator_data(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update operator data."""
    time_stamp = time_ns()

    sql = """SELECT operator, SUM(frequency*walltime_ns) AS total_time_ns
        FROM meta_cached_operators JOIN meta_cached_queries
        ON meta_cached_operators.query_hash=meta_cached_queries.hash_value
        GROUP BY operator;"""
    meta_segments = sql_to_data_frame(database_blocked, connection_factory, sql, None)

    with storage_connection_factory.create_cursor() as log:
        output = []
        if not meta_segments.empty:
            output = list(meta_segments.to_dict("index").values())
        log.log_meta_information(
            "operator_data", {"operator_data": dumps(output)}, time_stamp
        )

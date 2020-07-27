"""Job for updating the workload operator information."""

from json import dumps
from time import time_ns

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job_manager.job.sql_to_data_frame import (
    sql_to_data_frame,
)


def update_workload_operator_information(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update workload operator information."""
    time_stamp = time_ns()

    sql = """SELECT operator, SUM(frequency*walltime_ns) AS total_time_ns
        FROM meta_cached_operators JOIN meta_cached_queries
        ON meta_cached_operators.statement_hash=meta_cached_queries.statement_hash
        GROUP BY operator;"""
    meta_segments = sql_to_data_frame(database_blocked, connection_factory, sql, None)

    with storage_connection_factory.create_cursor() as log:
        workload_operator_information = []
        if not meta_segments.empty:
            workload_operator_information = list(
                meta_segments.to_dict("index").values()
            )
        log.log_meta_information(
            "workload_operator_information",
            {"workload_operator_information": dumps(workload_operator_information)},
            time_stamp,
        )

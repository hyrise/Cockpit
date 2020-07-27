"""This job updates the workload statement information."""

from json import dumps
from time import time_ns
from typing import Dict, List

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job_manager.job.sql_to_data_frame import (
    sql_to_data_frame,
)


def update_workload_statement_information(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update workload statement information data."""
    time_stamp = time_ns()
    sql = """WITH query_latency AS (SELECT SUM(walltime_ns) AS latency, statement_hash as query_hash
        FROM meta_cached_operators
        GROUP BY statement_hash)
        SELECT statement_hash, latency, frequency, sql_string FROM query_latency JOIN meta_cached_queries
        ON query_latency.query_hash = meta_cached_queries.statement_hash;"""

    meta_segments = sql_to_data_frame(database_blocked, connection_factory, sql, None)

    counts: Dict = {  # (total_latency, total_frequency)
        "SELECT": (0, 0),
        "CREATE": (0, 0),
        "UPDATE": (0, 0),
        "INSERT": (0, 0),
        "DELETE": (0, 0),
        "DROP": (0, 0),
        "COPY": (0, 0),
    }

    other_count = (0, 0)

    if not meta_segments.empty:
        for _, row in meta_segments.iterrows():
            type_found = False
            for query_type in counts.keys():
                if row["sql_string"].startswith(query_type):
                    counts[query_type] = (
                        counts[query_type][0] + row["latency"],
                        counts[query_type][1] + row["frequency"],
                    )
                    type_found = True
                    break
            if not type_found:
                other_count = (
                    other_count[0] + row["latency"],
                    other_count[1] + row["frequency"],
                )

    counts["OTHER"] = other_count

    workload_statement_information: List = [
        {
            "query_type": query_type,
            "total_latency": total_latency,
            "total_frequency": total_frequency,
        }
        for query_type, (total_latency, total_frequency) in counts.items()
    ]

    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "workload_statement_information",
            {"workload_statement_information": dumps(workload_statement_information)},
            time_stamp,
        )

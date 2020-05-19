"""This job updates the krueger data."""

from json import dumps
from time import time_ns
from typing import Dict, List

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


def update_krueger_data(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update krueger data."""
    time_stamp = time_ns()
    sql = """WITH query_latency AS (SELECT SUM(walltime_ns) AS latency, query_hash
        FROM meta_cached_operators
        GROUP BY query_hash)
        SELECT hash_value, latency, frequency, sql_string FROM query_latency JOIN meta_cached_queries
        ON query_latency.query_hash = meta_cached_queries.hash_value;"""

    meta_segments = sql_to_data_frame(database_blocked, connection_factory, sql, None)

    counts: Dict = {  # (total_latency, total_frequency)
        "SELECT": (0, 0),
        "CREATE": (0, 0),
        "UPDATE": (0, 0),
        "INSERT": (0, 0),
        "DELETE": (0, 0),
        "COPY": (0, 0),
    }

    if not meta_segments.empty:
        for _, row in meta_segments.iterrows():
            for query_type in counts.keys():
                if row["sql_string"].startswith(query_type):
                    counts[query_type] = (
                        counts[query_type][0] + row["latency"],
                        counts[query_type][1] + row["frequency"],
                    )
                    break

    krueger_data: List = [
        {
            "query_type": query_type,
            "total_latency": total_latency,
            "total_frequency": total_frequency,
        }
        for query_type, (total_latency, total_frequency) in counts.items()
    ]

    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "krueger_data", {"krueger_data": dumps(krueger_data)}, time_stamp,
        )

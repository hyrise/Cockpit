"""This job updates the plug-in log."""

from datetime import datetime
from time import time

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job_manager.job.sql_to_data_frame import (
    sql_to_data_frame,
)


def _datetime_str_to_unix_timestamp(datetime_str: str) -> int:
    """Convert timestamp of '%Y-%m-%d %H:%M:%S' format to Unix timestamp with millisecond precision."""
    date = datetime.strptime(datetime_str, "%Y-%m-%d %H:%M:%S")
    unix_timestamp = int(date.timestamp() * 1_000)
    return unix_timestamp


def update_plugin_log(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update plugin log."""
    offset_sec = 5.0
    timestamp = time()
    startts = str(datetime.fromtimestamp(timestamp - offset_sec))
    endts = str(datetime.fromtimestamp(timestamp))

    log_df = sql_to_data_frame(
        database_blocked,
        connection_factory,
        'SELECT * FROM meta_log WHERE "timestamp" >= %s AND "timestamp" < %s;',
        params=(startts, endts),
    )

    if log_df.empty:
        return

    plugin_log = [
        (
            _datetime_str_to_unix_timestamp(row["timestamp"]),
            row["reporter"],
            row["message"],
            row["log_level"],
        )
        for row in log_df.to_dict("index").values()
    ]

    with storage_connection_factory.create_cursor() as log:
        log.log_plugin_log(plugin_log)

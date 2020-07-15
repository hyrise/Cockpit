"""This job updates the plug-in log."""

from time import time_ns

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


def update_plugin_log(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update plugin log."""
    offset_ns = 5_000_000_000
    timestamp = time_ns()
    startts = timestamp - offset_ns
    endts = timestamp

    log_df = sql_to_data_frame(
        database_blocked,
        connection_factory,
        'SELECT * FROM meta_log WHERE "timestamp" >= %s AND "timestamp" < %s;',
        params=(startts, endts),
    )

    if log_df.empty:
        return

    plugin_log = [
        (row["timestamp"], row["reporter"], row["message"], row["log_level"],)
        for row in log_df.to_dict("index").values()
    ]

    with storage_connection_factory.create_cursor() as log:
        log.log_plugin_log(plugin_log)

"""This job updates the plug-in log."""

from time import time_ns

from hyrisecockpit.database_manager.job import sql_to_data_frame

from .cursor import StorageCursor


def update_plugin_log(
    database_blocked,
    connection_factory,
    storage_host,
    storage_port,
    storage_user,
    storage_password,
    database_id,
) -> None:
    """Update plugin log."""
    endts = int(time_ns() / 1_000_000)  # timestamps in hyrise are in ms-precision
    startts = endts - 5_000

    log_df = sql_to_data_frame(
        database_blocked,
        connection_factory,
        """SELECT * FROM meta_log WHERE "timestamp" >= %s AND "timestamp" < %s;""",
        params=(startts, endts),
    )

    if log_df.empty:
        return

    plugin_log = [
        (row["timestamp"], row["reporter"], row["message"])
        for row in log_df.to_dict("index").values()
    ]

    with StorageCursor(
        storage_host, storage_port, storage_user, storage_password, database_id,
    ) as log:
        log.log_plugin_log(plugin_log)

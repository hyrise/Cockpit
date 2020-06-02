"""This job updates the system data."""

from time import time_ns
from typing import Dict, Union

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


def _create_system_data_dict(utilization_df, system_df) -> Dict[str, Union[int, float]]:
    return {
        "cpu_system_usage": float(utilization_df["cpu_system_time"][0])
        / int(system_df["cpu_count"][0]),
        "cpu_process_usage": float(utilization_df["cpu_process_time"][0])
        / int(system_df["cpu_count"][0]),
        "cpu_count": int(system_df["cpu_count"][0]),
        "free_memory": int(utilization_df["system_memory_free"][0]),
        "available_memory": int(utilization_df["system_memory_available"][0]),
        "total_memory": int(system_df["system_memory_total_bytes"][0]),
        "database_threads": int(utilization_df["cpu_affinity_count"][0]),
    }


def update_system_data(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update system data for database instance."""
    utilization_df = sql_to_data_frame(
        database_blocked,
        connection_factory,
        "SELECT * FROM meta_system_utilization;",
        None,
    )
    system_df = sql_to_data_frame(
        database_blocked,
        connection_factory,
        "SELECT * FROM meta_system_information;",
        None,
    )

    if utilization_df.empty or system_df.empty:
        return

    system_data: Dict[str, Union[int, float]] = _create_system_data_dict(
        utilization_df, system_df
    )
    time_stamp = time_ns()

    with storage_connection_factory.create_cursor() as log:
        result = list(
            log._connection.query(
                "SELECT * FROM system_data ORDER BY time DESC LIMIT 1;",
                database=log._database_id,
            )["system_data", None]
        )
        if result:
            system_data["cpu_system_usage"] -= result[0]["cpu_system_usage"]
            system_data["cpu_process_usage"] -= result[0]["cpu_process_usage"]
        log.log_meta_information(
            "system_data", system_data, time_stamp,
        )

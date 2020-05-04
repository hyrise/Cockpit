"""This job updates the system data."""

from time import time_ns
from typing import Dict, Union

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


def _create_system_data_dict(
    utilization_df, system_df, database_threads: int
) -> Dict[str, Union[int, float]]:
    return {
        "cpu_system_usage": float(utilization_df["cpu_system_usage"][0]),
        "cpu_process_usage": float(utilization_df["cpu_process_usage"][0]),
        "cpu_count": int(system_df["cpu_count"][0]),
        "cpu_clock_speed": int(system_df["cpu_clock_speed"][0]),
        "free_memory": int(utilization_df["system_memory_free_bytes"][0]),
        "used_memory": int(utilization_df["process_physical_memory_bytes"][0]),
        "total_memory": int(system_df["system_memory_total_bytes"][0]),
        "database_threads": database_threads,
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

    mocked_database_threads = 16
    system_data: Dict[str, Union[int, float]] = _create_system_data_dict(
        utilization_df, system_df, mocked_database_threads
    )
    time_stamp = time_ns()

    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "system_data", system_data, time_stamp,
        )

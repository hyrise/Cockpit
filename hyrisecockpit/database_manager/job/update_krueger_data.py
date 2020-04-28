"""This job updates the krueger data."""

from json import dumps
from time import time_ns

from hyrisecockpit.database_manager.cursor import StorageCursor


def update_krueger_data(
    storage_host, storage_port, storage_user, storage_password, database_id,
) -> None:
    """Update krueger data."""
    time_stamp = time_ns()
    executed_mocked_data = {
        "SELECT": 100,
        "INSERT": 0,
        "UPDATE": 0,
        "DELETE": 0,
    }
    generated_mocked_data = {
        "SELECT": 100,
        "INSERT": 0,
        "UPDATE": 0,
        "DELETE": 0,
    }
    with StorageCursor(
        storage_host, storage_port, storage_user, storage_password, database_id,
    ) as log:
        log.log_meta_information(
            "krueger_data",
            {
                "executed": dumps(executed_mocked_data),
                "generated": dumps(generated_mocked_data),
            },
            time_stamp,
        )

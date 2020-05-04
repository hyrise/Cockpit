"""This job updates the krueger data."""

from json import dumps
from time import time_ns

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory


def update_krueger_data(storage_connection_factory: StorageConnectionFactory) -> None:
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
    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "krueger_data",
            {
                "executed": dumps(executed_mocked_data),
                "generated": dumps(generated_mocked_data),
            },
            time_stamp,
        )

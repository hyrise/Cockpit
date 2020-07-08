"""This job updates the queue length."""
from time import time_ns

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory


def update_queue_length(
    worker_pool, storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update queue length."""
    queue_length: int = worker_pool.get_queue_length()
    time_stamp: int = time_ns()
    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "queue_length", {"queue_length": queue_length}, time_stamp,
        )

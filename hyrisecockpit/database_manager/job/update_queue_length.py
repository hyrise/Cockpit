"""This job updates the queue length."""
from time import time_ns

from hyrisecockpit.database_manager.cursor import StorageCursor


def update_queue_length(
    worker_pool, storage_host, storage_port, storage_user, storage_password, database_id
) -> None:
    """Update queue length."""
    queue_length: int = worker_pool.get_queue_length()
    time_stamp: int = time_ns()
    with StorageCursor(
        storage_host, storage_port, storage_user, storage_password, database_id,
    ) as log:
        log.log_meta_information(
            "queue_length", {"queue_length": queue_length}, time_stamp,
        )

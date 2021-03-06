"""CLI used to start the database manager."""
from hyrisecockpit.settings import (
    DB_MANAGER_LISTENING,
    DB_MANAGER_PORT,
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)

from .manager import DatabaseManager


def main() -> None:
    """Create and start a database manager."""
    try:
        with DatabaseManager(
            DB_MANAGER_LISTENING,
            DB_MANAGER_PORT,
            WORKLOAD_SUB_HOST,
            WORKLOAD_PUBSUB_PORT,
            STORAGE_HOST,
            STORAGE_PASSWORD,
            STORAGE_PORT,
            STORAGE_USER,
        ) as database_manager:
            database_manager.start()
    except KeyboardInterrupt:
        print("Database Manager closed.")

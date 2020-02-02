"""CLI used to start the database manager."""
from hyrisecockpit.settings import (
    DB_MANAGER_LISTENING,
    DB_MANAGER_PORT,
    DEFAULT_TABLES,
    GENERATOR_HOST,
    GENERATOR_PORT,
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
            GENERATOR_HOST,
            GENERATOR_PORT,
            WORKLOAD_SUB_HOST,
            WORKLOAD_PUBSUB_PORT,
            DEFAULT_TABLES,
        ) as database_manager:
            database_manager.start()
    except KeyboardInterrupt:
        print("Database Manager closed.")

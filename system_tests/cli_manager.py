"""CLI used to start the database manager."""
from hyrisecockpit.database_manager.manager import DatabaseManager
from settings import (
    DB_MANAGER_HOST,
    DB_MANAGER_PORT,
    DEFAULT_TABLES,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)


def main() -> None:
    """Create and start a database manager."""
    try:
        with DatabaseManager(
            DB_MANAGER_HOST,
            DB_MANAGER_PORT,
            WORKLOAD_SUB_HOST,
            WORKLOAD_PUBSUB_PORT,
            DEFAULT_TABLES,
        ) as database_manager:
            database_manager.start()
    except KeyboardInterrupt:
        print("Database Manager closed.")


main()

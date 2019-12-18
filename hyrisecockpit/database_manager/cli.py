"""CLI used to start the database manager."""
from hyrisecockpit.settings import (
    DB_MANAGER_HOST,
    DB_MANAGER_PORT,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)

from .manager import DatabaseManager


def main() -> None:
    """Create and start a database manager."""
    DatabaseManager(
        DB_MANAGER_HOST, DB_MANAGER_PORT, WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT
    ).start()

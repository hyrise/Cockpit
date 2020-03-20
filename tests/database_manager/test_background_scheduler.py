"""Tests for the background_scheduler module."""

from multiprocessing import Value

from psycopg2 import pool
from pytest import fixture

from hyrisecockpit.database_manager.background_scheduler import BackgroundJobManager
from hyrisecockpit.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)


class TextBackgroundJobManager:
    """Tests BackgroundJobManager class."""

    @fixture
    def connection_pool(self) -> pool:
        """Get a mock connection pool."""
        return pool.ThreadedConnectionPool(
            0, 5, "user", "password", "host", "port", "dbname",
        )

    @fixture
    def background_job_manager(self) -> BackgroundJobManager:
        """Get a new DatabaseManager."""
        with BackgroundJobManager(
            "database",
            Value("b", False),
            self.connection_pool,
            STORAGE_HOST,
            STORAGE_PASSWORD,
            STORAGE_PORT,
            STORAGE_USER,
        ) as background_job_manager:
            return background_job_manager

    def test_initializes(self, background_job_manager: BackgroundJobManager) -> None:
        """A DatabaseManager initializes."""
        assert isinstance(background_job_manager, BackgroundJobManager)

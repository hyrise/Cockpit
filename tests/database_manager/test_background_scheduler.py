"""Tests for the background_scheduler module."""

from multiprocessing import Value
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.database_manager.background_scheduler import BackgroundJobManager


class TextBackgroundJobManager:
    """Tests BackgroundJobManager class."""

    def get_database_id(self) -> str:
        """Return database id."""
        return "MongoDB"

    def get_database_blocked(self) -> Value:
        """Return blocked database Value."""
        return Value("b", False)

    def get_connection_pool(self) -> MagicMock:
        """Return connection pool."""
        return MagicMock()

    def get_storage_host(self) -> str:
        """Return storage host."""
        return "influx"

    def get_storage_password(self) -> str:
        """Return mocked storage password."""
        return "password"

    def get_storage_port(self) -> str:
        """Return mocked storage port."""
        return "4321"

    def get_storage_user(self) -> str:
        """Return mocked storage user."""
        return "user?"

    @fixture
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.BackgroundScheduler",
        MagicMock(),
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.BackgroundJobManager._init_jobs",
        MagicMock(),
    )
    def background_job_manager(self) -> BackgroundJobManager:
        """Get a new BackgrpundJobManager."""
        return BackgroundJobManager(
            self.get_database_id(),
            self.get_database_blocked(),
            self.get_connection_pool(),
            self.get_storage_host(),
            self.get_storage_password(),
            self.get_storage_port(),
            self.get_storage_user(),
        )

    def test_initializes(self, background_job_manager: BackgroundJobManager) -> None:
        """A BackgroundJobManager initializes."""
        assert isinstance(background_job_manager, BackgroundJobManager)

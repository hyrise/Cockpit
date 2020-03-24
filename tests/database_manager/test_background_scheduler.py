"""Tests for the background_scheduler module."""

from multiprocessing import Value
from typing import Dict, Optional
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.database_manager.background_scheduler import BackgroundJobManager


class TestBackgroundScheduler:
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

    def get_fake_loaded_tables(self) -> Dict[str, Optional[str]]:
        """Return mocked loaded tables."""
        fake_loaded_tables: Dict[str, Optional[str]] = {
            "The Dough Rollers": "alternative",
            "Broken Witt Rebels": "alternative",
            "Bonny Doon": "alternative",
            "Jack White": "alternative",
            "Gary Clark Jr.": "Rock",
            "Greta Van Fleet": "Rock",
            "Tenacious D": "Rock",
        }
        return fake_loaded_tables

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
            self.get_fake_loaded_tables(),
            self.get_storage_host(),
            self.get_storage_password(),
            self.get_storage_port(),
            self.get_storage_user(),
        )

    def test_initializes(self, background_job_manager: BackgroundJobManager) -> None:
        """A BackgroundJobManager initializes."""
        assert isinstance(background_job_manager, BackgroundJobManager)
        assert background_job_manager._database_id == self.get_database_id()
        assert (
            background_job_manager._database_blocked.value
            == self.get_database_blocked().value
        )
        assert background_job_manager._storage_host == self.get_storage_host()
        assert background_job_manager._storage_port == self.get_storage_port()
        assert background_job_manager._storage_user == self.get_storage_user()
        assert background_job_manager._storage_password == self.get_storage_password()
        assert background_job_manager._loaded_tables == self.get_fake_loaded_tables()
        assert type(background_job_manager._previous_chunks_data) is dict

    def test_initializes_background_scheduler_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test initialization of background scheduler job."""
        mock_scheduler = MagicMock()
        mock_scheduler.add_job.return_value = None
        background_job_manager._scheduler = mock_scheduler
        background_job_manager._update_krueger_data = MagicMock()  # type: ignore
        background_job_manager._update_chunks_data = MagicMock()  # type: ignore
        background_job_manager._update_system_data = MagicMock()  # type: ignore
        background_job_manager._update_storage_data = MagicMock()  # type: ignore
        background_job_manager._update_plugin_log = MagicMock()  # type: ignore

        background_job_manager._init_jobs()

        mock_scheduler.add_job.assert_any_call(
            func=background_job_manager._update_krueger_data,
            trigger="interval",
            seconds=5,
        )
        mock_scheduler.add_job.assert_any_call(
            func=background_job_manager._update_chunks_data,
            trigger="interval",
            seconds=5,
        )
        mock_scheduler.add_job.assert_any_call(
            func=background_job_manager._update_system_data,
            trigger="interval",
            seconds=1,
        )
        mock_scheduler.add_job.assert_any_call(
            func=background_job_manager._update_storage_data,
            trigger="interval",
            seconds=5,
        )
        mock_scheduler.add_job.assert_any_call(
            func=background_job_manager._update_plugin_log,
            trigger="interval",
            seconds=1,
        )

    def test_background_scheduler_starts(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start of background scheduler."""
        mock_scheduler = MagicMock()
        mock_scheduler.start.return_value = None
        background_job_manager._scheduler = mock_scheduler

        background_job_manager.start()

        mock_scheduler.start.assert_called()

    def test_background_scheduler_closes(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test clsoe of bachground scheduler object."""
        mock_scheduler = MagicMock()
        mock_scheduler.shutdown.return_value = None
        background_job_manager._scheduler = mock_scheduler
        background_job_manager._update_krueger_data_job = MagicMock()
        background_job_manager._update_system_data_job = MagicMock()
        background_job_manager._update_chunks_data_job = MagicMock()
        background_job_manager._update_storage_data_job = MagicMock()
        background_job_manager._update_plugin_log_job = MagicMock()

        background_job_manager.close()

        background_job_manager._update_krueger_data_job.remove.assert_any_call()
        background_job_manager._update_system_data_job.remove.assert_any_call()
        background_job_manager._update_chunks_data_job.remove.assert_any_call()
        background_job_manager._update_storage_data_job.remove.assert_any_call()
        background_job_manager._update_plugin_log_job.remove.assert_any_call()
        mock_scheduler.shutdown.assert_called()

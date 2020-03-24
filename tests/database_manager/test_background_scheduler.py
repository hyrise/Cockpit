"""Tests for the background_scheduler module."""

from multiprocessing import Value
from typing import Any, Callable, Dict, Optional
from unittest.mock import MagicMock, patch

from pandas import DataFrame
from pandas.core.frame import DataFrame as DataframeType
from pytest import fixture

from hyrisecockpit.database_manager.background_scheduler import BackgroundJobManager

database_id: str = "MongoDB"
get_database_blocked: Callable[[], Value] = lambda: Value("b", False)  # noqa: E731
get_connection_pool: Callable[[], MagicMock] = lambda: MagicMock()  # noqa: E731
fake_loaded_tables: Dict[str, Optional[str]] = {
    "The Dough Rollers": "alternative",
    "Broken Witt Rebels": "alternative",
    "Bonny Doon": "alternative",
    "Jack White": "alternative",
    "Gary Clark Jr.": "Rock",
    "Greta Van Fleet": "Rock",
    "Tenacious D": "Rock",
}
storage_host: str = "influx"
storage_password: str = "password"
storage_port: str = "4321"
storage_user: str = "user?"

get_fake_read_sql_query: Callable[
    [str, Any], DataframeType
] = lambda sql, connection: DataFrame(  # noqa: E731
    {"col1": ["data"]}
)


class TestBackgroundJobManager:
    """Tests for the BackgroundJobManager class."""

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
            database_id,
            get_database_blocked(),
            get_connection_pool(),
            fake_loaded_tables,
            storage_host,
            storage_password,
            storage_port,
            storage_user,
        )

    def test_creates(self, background_job_manager: BackgroundJobManager):
        """A BackgroundJobManager can be created."""
        assert background_job_manager

    def test_initializes_correctly(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """A BackgroundJobManager initializes correctly."""
        assert isinstance(background_job_manager, BackgroundJobManager)
        assert background_job_manager._database_id == database_id
        assert (
            background_job_manager._database_blocked.value
            == get_database_blocked().value
        )
        assert background_job_manager._storage_host == storage_host
        assert background_job_manager._storage_port == storage_port
        assert background_job_manager._storage_user == storage_user
        assert background_job_manager._storage_password == storage_password
        assert background_job_manager._loaded_tables == fake_loaded_tables
        assert isinstance(background_job_manager._previous_chunks_data, dict)

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

        mock_scheduler.add_job.assect_called_once_with(
            func=background_job_manager._update_krueger_data,
            trigger="interval",
            seconds=5,
        )
        mock_scheduler.add_job.assect_called_once_with(
            func=background_job_manager._update_chunks_data,
            trigger="interval",
            seconds=5,
        )
        mock_scheduler.add_job.assect_called_once_with(
            func=background_job_manager._update_system_data,
            trigger="interval",
            seconds=1,
        )
        mock_scheduler.add_job.assect_called_once_with(
            func=background_job_manager._update_storage_data,
            trigger="interval",
            seconds=5,
        )
        mock_scheduler.add_job.assect_called_once_with(
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

        mock_scheduler.start.assert_called_once()

    def test_background_scheduler_closes(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test close of background scheduler object."""
        mock_scheduler = MagicMock()
        mock_scheduler.shutdown.return_value = None
        background_job_manager._scheduler = mock_scheduler
        background_job_manager._update_krueger_data_job = MagicMock()
        background_job_manager._update_system_data_job = MagicMock()
        background_job_manager._update_chunks_data_job = MagicMock()
        background_job_manager._update_storage_data_job = MagicMock()
        background_job_manager._update_plugin_log_job = MagicMock()

        background_job_manager.close()

        background_job_manager._update_krueger_data_job.remove.assert_called_once()
        background_job_manager._update_system_data_job.remove.assert_called_once()
        background_job_manager._update_chunks_data_job.remove.assert_called_once()
        background_job_manager._update_storage_data_job.remove.assert_called_once()
        background_job_manager._update_plugin_log_job.remove.assert_called_once()
        mock_scheduler.shutdown.assert_called_once()

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.PoolCursor", MagicMock(),
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.read_sql_query",
        get_fake_read_sql_query,
    )
    def test_converts_sql_to_data_frame_if_database_is_blocked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test read sql query and return empty dataframe."""
        background_job_manager._database_blocked.value = True

        result = background_job_manager._sql_to_data_frame("select ...")

        assert isinstance(result, DataframeType)
        assert result.empty

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.PoolCursor", MagicMock(),
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.read_sql_query",
        get_fake_read_sql_query,
    )
    def test_converts_sql_to_data_frame_if_database_is_not_blocked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test read sql query and return dataframe."""
        background_job_manager._database_blocked.value = False

        expected_df = DataFrame({"col1": ["data"]})
        received_df = background_job_manager._sql_to_data_frame("select ...")

        assert isinstance(received_df, DataframeType)
        assert expected_df.equals(received_df)

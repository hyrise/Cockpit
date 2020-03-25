"""Tests for the background_scheduler module."""

from multiprocessing import Value
from typing import Any, Callable, Dict, List, Optional, Tuple
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

        jobs: List[Tuple[Callable, str, int]] = [
            (background_job_manager._update_krueger_data, "interval", 5),
            (background_job_manager._update_chunks_data, "interval", 5),
            (background_job_manager._update_system_data, "interval", 1),
            (background_job_manager._update_storage_data, "interval", 5),
            (background_job_manager._update_plugin_log, "interval", 1),
        ]
        for func, _, _ in jobs:
            func = MagicMock()

        background_job_manager._init_jobs()

        for func, trigger, seconds in jobs:
            mock_scheduler.add_job.assert_any_call(
                func=func, trigger=trigger, seconds=seconds
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

    def test_successfully_creates_chunks_data_frame(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully creates chunks dataframe from sql."""
        fake_data_frame = {
            "table_name": ["customer", "customer", "supplier", "supplier"],
            "column_name": ["c_custkey", "c_name", "s_address", "s_comment"],
            "chunk_id": [0, 0, 42, 5],
            "access_count": [15000, 15000, 1000, 600],
        }

        fake_chunks_df = DataFrame(data=fake_data_frame)
        fake_chunks_dict = background_job_manager._create_chunks_dictionary(
            fake_chunks_df
        )

        expected_dict = {
            "customer": {"c_custkey": [15000], "c_name": [15000]},
            "supplier": {"s_address": [1000], "s_comment": [600]},
        }

        assert fake_chunks_dict == expected_dict

    def test_successfully_calculates_chunk_differences(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully calculates chunks differences."""
        fake_base_dict = {
            "customer": {"c_custkey": [15000], "c_name": [15000]},
            "supplier": {"s_address": [1000], "s_comment": [600]},
        }
        fake_substractor_dict = {
            "customer": {"c_custkey": [1000], "c_name": [5000]},
            "supplier": {"s_address": [1000], "s_comment": [555]},
        }
        expected_dict = {
            "customer": {"c_custkey": [14000], "c_name": [10000]},
            "supplier": {"s_address": [0], "s_comment": [45]},
        }

        received_dict = background_job_manager._calculate_chunks_difference(
            fake_base_dict, fake_substractor_dict
        )

        assert expected_dict == received_dict

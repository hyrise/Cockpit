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

mocked_storage_curser = MagicMock()
mocked_storage_curser.log_meta_information.return_value = None


def get_fake_storage_curser(
    storage_host, storage_port, storage_user, _storage_password, database_id
):
    """Return fake storage curser."""
    mocked_storage_curser_constructor = MagicMock()
    mocked_storage_curser_constructor.__enter__.return_value = mocked_storage_curser
    return mocked_storage_curser_constructor


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

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_fake_storage_curser,
    )
    @patch("hyrisecockpit.database_manager.background_scheduler.time_ns", lambda: 42)
    def test_logs_updated_chunks_data_with_empty_meta_chunks(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test logs updated chunks data when meta chunks is empty."""
        mocked_sql_to_data_frame = MagicMock()
        mocked_sql_to_data_frame.return_value = DataFrame()

        background_job_manager._sql_to_data_frame = mocked_sql_to_data_frame  # type: ignore
        background_job_manager._create_chunks_dictionary = MagicMock()  # type: ignore
        background_job_manager._calculate_chunks_difference = MagicMock()  # type: ignore

        background_job_manager._update_chunks_data()

        global mocked_storage_curser

        background_job_manager._create_chunks_dictionary.assert_not_called()  # type: ignore
        background_job_manager._calculate_chunks_difference.assert_not_called()  # type: ignore
        mocked_storage_curser.log_meta_information.assert_called_once_with(
            "chunks_data", {"chunks_data_meta_information": "{}"}, 42
        )

        mocked_storage_curser = MagicMock()
        mocked_storage_curser.log_meta_information.return_value = None

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_fake_storage_curser,
    )
    @patch("hyrisecockpit.database_manager.background_scheduler.time_ns", lambda: 42)
    def test_logs_updated_chunks_data_with_meta_chunks(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test logs updated chunks data when meta chunks is not empty."""
        fake_not_empty_data_frame = DataFrame({"col1": [42]})

        mocked_sql_to_data_frame = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_not_empty_data_frame

        background_job_manager._sql_to_data_frame = (  # type: ignore
            mocked_sql_to_data_frame
        )
        background_job_manager._create_chunks_dictionary = MagicMock()  # type: ignore
        background_job_manager._calculate_chunks_difference = MagicMock()  # type: ignore
        background_job_manager._calculate_chunks_difference.return_value = {"new": 55}  # type: ignore

        background_job_manager._update_chunks_data()

        global mocked_storage_curser

        background_job_manager._create_chunks_dictionary.assert_called_once_with(  # type: ignore
            fake_not_empty_data_frame
        )
        background_job_manager._calculate_chunks_difference.assert_called_once()  # type: ignore
        mocked_storage_curser.log_meta_information.assert_called_once_with(
            "chunks_data", {"chunks_data_meta_information": '{"new": 55}'}, 42
        )

        mocked_storage_curser = MagicMock()
        mocked_storage_curser.log_meta_information.return_value = None

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_fake_storage_curser,
    )
    def test_logs_plugin_log(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test logs plugin log."""
        fake_not_empty_data_frame = DataFrame(
            {
                "timestamp": [0, 42],
                "reporter": ["KeepHyriseRunning", "HyrisePleaseStayAlive"],
                "message": ["error", "error"],
            }
        )
        mocked_sql_to_data_frame = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_not_empty_data_frame

        background_job_manager._sql_to_data_frame = (  # type: ignore
            mocked_sql_to_data_frame
        )

        background_job_manager._update_plugin_log()

        expected_function_argument = [
            (0, "KeepHyriseRunning", "error"),
            (42, "HyrisePleaseStayAlive", "error"),
        ]

        global mocked_storage_curser

        mocked_storage_curser.log_plugin_log.assert_called_once_with(
            expected_function_argument
        )

        mocked_storage_curser = MagicMock()
        mocked_storage_curser.log_meta_information.return_value = None

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_fake_storage_curser,
    )
    def test_doesnt_log_plugin_log_when_empty(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test logs plugin log."""
        fake_not_empty_data_frame = DataFrame()
        mocked_sql_to_data_frame = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_not_empty_data_frame

        background_job_manager._sql_to_data_frame = (  # type: ignore
            mocked_sql_to_data_frame
        )

        background_job_manager._update_plugin_log()

        global mocked_storage_curser

        mocked_storage_curser.log_plugin_log.assert_not_called()

        mocked_storage_curser = MagicMock()
        mocked_storage_curser.log_meta_information.return_value = None

    def test_successfully_create_cpu_data_dict(
        self, background_job_manager: BackgroundJobManager
    ):
        """Test creates cpu data dict successfully."""
        fake_utilization_df = DataFrame(
            {
                "cpu_system_usage": [120],
                "cpu_process_usage": [300],
                "system_memory_free_bytes": [0],
                "process_physical_memory_bytes": [42],
            }
        )
        fake_system_df = DataFrame(
            {
                "cpu_count": [16],
                "cpu_clock_speed": [120],
                "system_memory_total_bytes": [1234],
            }
        )
        expected_dict = {
            "cpu_system_usage": 120.0,
            "cpu_process_usage": 300.0,
            "cpu_count": 16,
            "cpu_clock_speed": 120,
        }

        received_dict = background_job_manager._create_cpu_data_dict(
            fake_utilization_df, fake_system_df
        )

        assert received_dict == expected_dict

    def test_successfully_create_memory_data_dict(
        self, background_job_manager: BackgroundJobManager
    ):
        """Test creates memory data dict successfully."""
        fake_utilization_df = DataFrame(
            {
                "cpu_system_usage": [120],
                "cpu_process_usage": [300],
                "system_memory_free_bytes": [0],
                "process_physical_memory_bytes": [42],
            }
        )
        fake_system_df = DataFrame(
            {
                "cpu_count": [16],
                "cpu_clock_speed": [120],
                "system_memory_total_bytes": [42],
            }
        )
        expected_dict = {"free": 0, "used": 42, "total": 42, "percent": 1}

        received_dict = background_job_manager._create_memory_data_dict(
            fake_utilization_df, fake_system_df
        )

        assert received_dict == expected_dict

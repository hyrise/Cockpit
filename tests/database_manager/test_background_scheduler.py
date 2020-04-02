"""Tests for the background_scheduler module."""

from json import dumps
from multiprocessing import Value
from multiprocessing.sharedctypes import Synchronized as ValueType
from typing import Any, Callable, Dict, List, Optional, Tuple, Union
from unittest.mock import MagicMock, call, patch

from pandas import DataFrame
from pandas.core.frame import DataFrame as DataframeType
from pytest import fixture

from hyrisecockpit.database_manager.background_scheduler import (
    BackgroundJobManager,
    StorageDataType,
)

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
fake_dict: Dict[str, List[str]] = {
    "alternative": [
        "The Dough Rollers",
        "Broken Witt Rebels",
        "Bonny Doon",
        "Jack White",
    ],
    "Rock": ["Gary Clark Jr.", "Greta Van Fleet", "Tenacious D"],
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

mocked_storage_cursor = MagicMock()
mocked_pool_cursor = MagicMock()
mocked_process: MagicMock = MagicMock()
mocked_process_constructor: MagicMock = MagicMock()
mocked_process_constructor.return_value = mocked_process


def get_mocked_storage_cursor(*args):
    """Return fake storage cursor."""
    mocked_storage_cursor_constructor: MagicMock = MagicMock()
    mocked_storage_cursor_constructor.__enter__.return_value: MagicMock = mocked_storage_cursor
    return mocked_storage_cursor_constructor


def get_mocked_worker_pool(*args) -> MagicMock:
    """Return fake worker pool."""
    worker_pool: MagicMock = MagicMock()
    worker_pool.get_queue_length.return_value = 0
    return worker_pool


def get_mocked_pool_cursor(*args):
    """Return fake storage cursor."""
    mocked_pool_cursor_constructor: MagicMock = MagicMock()
    mocked_pool_cursor_constructor.__enter__.return_value: MagicMock = mocked_pool_cursor
    return mocked_pool_cursor_constructor


def fake_execute_table_query(self, query: Tuple, success_flag: Value) -> None:
    """Return dummy execute table query method."""
    success_flag.value = True


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
        worker_pool: MagicMock = get_mocked_worker_pool()
        return BackgroundJobManager(
            database_id,
            get_database_blocked(),
            get_connection_pool(),
            fake_loaded_tables,
            worker_pool,
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
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.add_job.return_value = None
        background_job_manager._scheduler = mock_scheduler

        jobs: List[Tuple[Callable, str, int]] = [
            (background_job_manager._update_krueger_data, "interval", 5),
            (background_job_manager._update_chunks_data, "interval", 5),
            (background_job_manager._update_system_data, "interval", 1),
            (background_job_manager._update_storage_data, "interval", 5),
            (background_job_manager._update_plugin_log, "interval", 1),
        ]

        expected = [
            call.add_job(func=job[0], trigger=job[1], seconds=job[2]) for job in jobs
        ]

        background_job_manager._init_jobs()

        mock_scheduler.mock_calls == expected

    def test_background_scheduler_starts(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start of background scheduler."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.start.return_value = None
        background_job_manager._scheduler = mock_scheduler

        background_job_manager.start()

        mock_scheduler.start.assert_called_once()

    def test_background_scheduler_closes(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test close of background scheduler object."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.shutdown.return_value = None
        background_job_manager._scheduler = mock_scheduler
        background_job_manager._update_krueger_data_job = MagicMock()
        background_job_manager._update_system_data_job = MagicMock()
        background_job_manager._update_chunks_data_job = MagicMock()
        background_job_manager._update_storage_data_job = MagicMock()
        background_job_manager._update_plugin_log_job = MagicMock()
        background_job_manager._update_queue_length_job = MagicMock()

        background_job_manager.close()

        background_job_manager._update_krueger_data_job.remove.assert_called_once()
        background_job_manager._update_system_data_job.remove.assert_called_once()
        background_job_manager._update_chunks_data_job.remove.assert_called_once()
        background_job_manager._update_storage_data_job.remove.assert_called_once()
        background_job_manager._update_plugin_log_job.remove.assert_called_once()
        background_job_manager._update_queue_length_job.remove.assert_called_once()
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

        result: DataFrame = background_job_manager._sql_to_data_frame("select ...")

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

        expected_df: DataFrame = DataFrame({"col1": ["data"]})
        received_df: DataFrame = background_job_manager._sql_to_data_frame("select ...")

        assert isinstance(received_df, DataframeType)
        assert expected_df.equals(received_df)

    def test_successfully_creates_chunks_data_frame(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully creates chunks dataframe from sql."""
        fake_data_frame_data: Dict[str, List[Union[str, int]]] = {
            "table_name": ["customer", "customer", "supplier", "supplier"],
            "column_name": ["c_custkey", "c_name", "s_address", "s_comment"],
            "chunk_id": [0, 0, 42, 5],
            "access_count": [15000, 15000, 1000, 600],
        }

        fake_chunks_df: DataFrame = DataFrame(data=fake_data_frame_data)
        fake_chunks_dict: Dict = background_job_manager._create_chunks_dictionary(
            fake_chunks_df
        )

        expected_dict: Dict[str, Dict[str, List[int]]] = {
            "customer": {"c_custkey": [15000], "c_name": [15000]},
            "supplier": {"s_address": [1000], "s_comment": [600]},
        }

        assert fake_chunks_dict == expected_dict

    def test_successfully_calculates_chunk_differences(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully calculates chunks differences."""
        fake_base_dict: Dict[str, Dict[str, List[int]]] = {
            "customer": {"c_custkey": [15000], "c_name": [15000]},
            "supplier": {"s_address": [1000], "s_comment": [600]},
        }
        fake_substractor_dict: Dict[str, Dict[str, List[int]]] = {
            "customer": {"c_custkey": [1000], "c_name": [5000]},
            "supplier": {"s_address": [1000], "s_comment": [555]},
        }
        expected_dict: Dict[str, Dict[str, List[int]]] = {
            "customer": {"c_custkey": [14000], "c_name": [10000]},
            "supplier": {"s_address": [0], "s_comment": [45]},
        }

        received_dict: Dict = background_job_manager._calculate_chunks_difference(
            fake_base_dict, fake_substractor_dict
        )

        assert expected_dict == received_dict

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_mocked_storage_cursor,
    )
    @patch("hyrisecockpit.database_manager.background_scheduler.time_ns", lambda: 42)
    def test_logs_updated_chunks_data_with_empty_meta_chunks(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test logs updated chunks data when meta chunks is empty."""
        mocked_sql_to_data_frame: MagicMock = MagicMock()
        mocked_sql_to_data_frame.return_value = DataFrame()

        background_job_manager._sql_to_data_frame = mocked_sql_to_data_frame  # type: ignore
        background_job_manager._create_chunks_dictionary = MagicMock()  # type: ignore
        background_job_manager._calculate_chunks_difference = MagicMock()  # type: ignore

        background_job_manager._update_chunks_data()

        global mocked_storage_cursor

        background_job_manager._create_chunks_dictionary.assert_not_called()  # type: ignore
        background_job_manager._calculate_chunks_difference.assert_not_called()  # type: ignore
        mocked_storage_cursor.log_meta_information.assert_called_once_with(
            "chunks_data", {"chunks_data_meta_information": "{}"}, 42
        )

        mocked_storage_cursor = MagicMock()
        mocked_storage_cursor.log_meta_information.return_value = None

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_mocked_storage_cursor,
    )
    @patch("hyrisecockpit.database_manager.background_scheduler.time_ns", lambda: 42)
    def test_logs_updated_chunks_data_with_meta_chunks(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test logs updated chunks data when meta chunks is not empty."""
        fake_not_empty_data_frame = DataFrame({"col1": [42]})

        mocked_sql_to_data_frame: MagicMock = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_not_empty_data_frame

        background_job_manager._sql_to_data_frame = (  # type: ignore
            mocked_sql_to_data_frame
        )
        background_job_manager._create_chunks_dictionary = MagicMock()  # type: ignore
        background_job_manager._calculate_chunks_difference = MagicMock()  # type: ignore
        background_job_manager._calculate_chunks_difference.return_value = {"new": 55}  # type: ignore

        background_job_manager._update_chunks_data()

        global mocked_storage_cursor

        background_job_manager._create_chunks_dictionary.assert_called_once_with(  # type: ignore
            fake_not_empty_data_frame
        )
        background_job_manager._calculate_chunks_difference.assert_called_once()  # type: ignore
        mocked_storage_cursor.log_meta_information.assert_called_once_with(
            "chunks_data", {"chunks_data_meta_information": '{"new": 55}'}, 42
        )

        mocked_storage_cursor = MagicMock()
        mocked_storage_cursor.log_meta_information.return_value = None

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_mocked_storage_cursor,
    )
    def test_logs_plugin_log(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test logs plugin log."""
        fake_not_empty_data_frame: DataFrame = DataFrame(
            {
                "timestamp": [0, 42],
                "reporter": ["KeepHyriseRunning", "HyrisePleaseStayAlive"],
                "message": ["error", "error"],
            }
        )
        mocked_sql_to_data_frame: MagicMock = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_not_empty_data_frame

        background_job_manager._sql_to_data_frame = (  # type: ignore
            mocked_sql_to_data_frame
        )

        background_job_manager._update_plugin_log()

        expected_function_argument: List[Tuple[int, str, str]] = [
            (0, "KeepHyriseRunning", "error"),
            (42, "HyrisePleaseStayAlive", "error"),
        ]

        global mocked_storage_cursor

        mocked_storage_cursor.log_plugin_log.assert_called_once_with(
            expected_function_argument
        )

        mocked_storage_cursor = MagicMock()

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_mocked_storage_cursor,
    )
    def test_doesnt_log_plugin_log_when_empty(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test logs plugin log."""
        fake_empty_data_frame: DataFrame = DataFrame()
        mocked_sql_to_data_frame: MagicMock = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_empty_data_frame

        background_job_manager._sql_to_data_frame = (  # type: ignore
            mocked_sql_to_data_frame
        )

        background_job_manager._update_plugin_log()

        global mocked_storage_cursor

        mocked_storage_cursor.log_plugin_log.assert_not_called()

        mocked_storage_cursor = MagicMock()

    def test_successfully_create_cpu_data_dict(
        self, background_job_manager: BackgroundJobManager
    ):
        """Test creates cpu data dict successfully."""
        fake_utilization_df: DataFrame = DataFrame(
            {
                "cpu_system_usage": [120],
                "cpu_process_usage": [300],
                "system_memory_free_bytes": [0],
                "process_physical_memory_bytes": [42],
            }
        )
        fake_system_df: DataFrame = DataFrame(
            {
                "cpu_count": [16],
                "cpu_clock_speed": [120],
                "system_memory_total_bytes": [1234],
            }
        )
        expected_dict: Dict[str, float] = {
            "cpu_system_usage": 120.0,
            "cpu_process_usage": 300.0,
            "cpu_count": 16,
            "cpu_clock_speed": 120,
        }

        received_dict: Dict[
            str, Union[int, float]
        ] = background_job_manager._create_cpu_data_dict(
            fake_utilization_df, fake_system_df
        )

        assert received_dict == expected_dict

    def test_successfully_create_memory_data_dict(
        self, background_job_manager: BackgroundJobManager
    ):
        """Test creates memory data dict successfully."""
        fake_utilization_df: DataFrame = DataFrame(
            {
                "cpu_system_usage": [120],
                "cpu_process_usage": [300],
                "system_memory_free_bytes": [0],
                "process_physical_memory_bytes": [42],
            }
        )
        fake_system_df: DataFrame = DataFrame(
            {
                "cpu_count": [16],
                "cpu_clock_speed": [120],
                "system_memory_total_bytes": [42],
            }
        )
        expected_dict: Dict[str, int] = {
            "free": 0,
            "used": 42,
            "total": 42,
            "percent": 1,
        }

        received_dict: Dict[
            str, Union[int, float]
        ] = background_job_manager._create_memory_data_dict(
            fake_utilization_df, fake_system_df
        )

        assert received_dict == expected_dict

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_mocked_storage_cursor,
    )
    @patch("hyrisecockpit.database_manager.background_scheduler.time_ns", lambda: 42)
    def test_logs_updated_system_data(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test logs updated system data."""
        fake_not_empty_df: DataFrame = DataFrame({"column1": [1]})
        fake_cpu_dict: Dict[str, float] = {
            "cpu_system_usage": 120.0,
            "cpu_process_usage": 300.0,
            "cpu_count": 16,
            "cpu_clock_speed": 120,
        }
        fake_memory_dict: Dict[str, int] = {
            "free": 0,
            "used": 42,
            "total": 42,
            "percent": 1,
        }

        mocked_sql_to_data_frame: MagicMock = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_not_empty_df
        background_job_manager._sql_to_data_frame = mocked_sql_to_data_frame  # type: ignore

        mocked_create_cpu_data_dict: MagicMock = MagicMock()
        mocked_create_cpu_data_dict.return_value = fake_cpu_dict
        background_job_manager._create_cpu_data_dict = mocked_create_cpu_data_dict  # type: ignore

        mocked_create_memory_data_dict: MagicMock = MagicMock()
        mocked_create_memory_data_dict.return_value = fake_memory_dict
        background_job_manager._create_memory_data_dict = mocked_create_memory_data_dict  # type: ignore

        background_job_manager._update_system_data()

        expected_function_argument: Dict[str, str] = {
            "cpu": dumps(fake_cpu_dict),
            "memory": dumps(fake_memory_dict),
            "database_threads": "16",
        }

        global mocked_storage_cursor

        mocked_storage_cursor.log_meta_information.assert_called_once_with(
            "system_data", expected_function_argument, 42
        )

        mocked_storage_cursor = MagicMock()

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_mocked_storage_cursor,
    )
    @patch("hyrisecockpit.database_manager.background_scheduler.time_ns", lambda: 42)
    def test_doesnt_log_updated_system_data(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesn't log updated system data when it's emtpy."""
        fake_empty_df: DataFrame = DataFrame()

        mocked_sql_to_data_frame: MagicMock = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_empty_df
        background_job_manager._sql_to_data_frame = mocked_sql_to_data_frame  # type: ignore

        background_job_manager._create_cpu_data_dict = MagicMock()  # type: ignore

        background_job_manager._create_memory_data_dict = MagicMock()  # type: ignore

        background_job_manager._update_system_data()

        global mocked_storage_cursor

        background_job_manager._create_cpu_data_dict.assert_not_called()  # type: ignore
        background_job_manager._create_memory_data_dict.assert_not_called()  # type: ignore
        mocked_storage_cursor.log_meta_information.assert_not_called()

        mocked_storage_cursor = MagicMock()

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_mocked_storage_cursor,
    )
    @patch("hyrisecockpit.database_manager.background_scheduler.time_ns", lambda: 42)
    def test_successfully_logs_storage_data(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully logs storage data."""
        fake_storage_df: DataFrame = DataFrame(
            {
                "table_name": ["customer", "customer", "supplier"],
                "chunk_id": [0, 0, 0],
                "column_id": [0, 1, 2],
                "column_name": ["c_custkey", "c_nationkey", "s_address"],
                "column_data_type": ["int", "string", "string"],
                "encoding_type": ["Dictionary", "Dictionary", "Dictionary"],
                "vector_compression_type": [
                    "FixedSize2ByteAligned",
                    "FixedSize2ByteAligned",
                    "FixedSize2ByteAligned",
                ],
                "estimated_size_in_bytes": [9000, 1000, 400],
            }
        )

        mocked_sql_to_data_frame: MagicMock = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_storage_df
        background_job_manager._sql_to_data_frame = mocked_sql_to_data_frame  # type: ignore

        expected_storage_dict: StorageDataType = {
            "customer": {
                "size": 10000,
                "number_columns": 2,
                "data": {
                    "c_custkey": {
                        "size": 9000,
                        "data_type": "int",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    },
                    "c_nationkey": {
                        "size": 1000,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    },
                },
            },
            "supplier": {
                "size": 400,
                "number_columns": 1,
                "data": {
                    "s_address": {
                        "size": 400,
                        "data_type": "string",
                        "encoding": [
                            {
                                "name": "Dictionary",
                                "amount": 1,
                                "compression": ["FixedSize2ByteAligned"],
                            }
                        ],
                    }
                },
            },
        }

        global mocked_storage_cursor

        background_job_manager._update_storage_data()

        mocked_storage_cursor.log_meta_information.assert_called_with(
            "storage", {"storage_meta_information": dumps(expected_storage_dict)}, 42
        )

        mocked_storage_cursor = MagicMock()

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.StorageCursor",
        get_mocked_storage_cursor,
    )
    @patch("hyrisecockpit.database_manager.background_scheduler.time_ns", lambda: 42)
    def test_logs_empty_storage_data(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesn't log storage data when it's empty."""
        fake_empty_storage_df: DataFrame = DataFrame()

        mocked_sql_to_data_frame: MagicMock = MagicMock()
        mocked_sql_to_data_frame.return_value = fake_empty_storage_df
        background_job_manager._sql_to_data_frame = mocked_sql_to_data_frame  # type: ignore

        global mocked_storage_cursor

        background_job_manager._update_storage_data()

        mocked_storage_cursor.log_meta_information.assert_called_with(
            "storage", {"storage_meta_information": dumps({})}, 42
        )

        mocked_storage_cursor = MagicMock()

    def tests_successfully_generates_table_loading_queries(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully generates table loading queries."""
        fake_folder_name: str = "hyriseDown"
        fake_table_names: List[str] = ["keep", "on", "going", "please!!!"]

        received_queries = background_job_manager._generate_table_loading_queries(
            fake_table_names, fake_folder_name
        )

        expected_queries = [
            (
                "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (("keep", "as_is"), (fake_folder_name, "as_is"), ("keep", "as_is"),),
            ),
            (
                "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (("on", "as_is"), (fake_folder_name, "as_is"), ("on", "as_is"),),
            ),
            (
                "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (("going", "as_is"), (fake_folder_name, "as_is"), ("going", "as_is"),),
            ),
            (
                "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (
                    ("please!!!", "as_is"),
                    ("hyriseDown", "as_is"),
                    ("please!!!", "as_is"),
                ),
            ),
        ]

        assert received_queries == expected_queries

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.AsIs",
        lambda name: f"AsIs({name})",
    )
    def test_successfully_formats_query_parameters(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully formats query parameters."""
        parameters = (
            ("keep", "as_is",),
            ("hyriseDown", None,),
            ("keep", None,),
        )
        received = background_job_manager._format_query_parameters(parameters)
        assert received == ("AsIs(keep)", "hyriseDown", "keep")

    def test_doesnt_format_no_parameters(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesn't format when there are no parameters."""
        assert background_job_manager._format_query_parameters(None) is None

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.PoolCursor",
        get_mocked_pool_cursor,
    )
    def test_successfully_executes_table_query(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully executes table queries."""
        mocked_format_query_parameters: MagicMock = MagicMock()
        mocked_format_query_parameters.return_value = (
            "keep",
            "hyriseDown",
            "keep",
        )
        background_job_manager._format_query_parameters = mocked_format_query_parameters  # type: ignore

        query_tuple: Tuple[str, Tuple[str, str, str]] = (
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )

        success_flag: Value = Value("b", 0)
        background_job_manager._execute_table_query(query_tuple, success_flag)

        global mocked_pool_cursor
        mocked_pool_cursor.execute.assert_called_once_with(
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )

        mocked_pool_cursor = MagicMock()

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.Process",
        mocked_process_constructor,
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.BackgroundJobManager._execute_table_query",
        lambda *args: 42,
    )
    def test_starts_processes_for_execute_queries_parallel(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start processes for table loading queries in parallel."""
        fake_table_names: List[str] = ["HyriseAreYoueStillAlive"]
        fake_queries: Tuple[str] = ("Ping Hyrise",)
        folder_name: str = "Hallo"

        background_job_manager._loaded_tables = {}

        background_job_manager._execute_queries_parallel(
            fake_table_names, fake_queries, folder_name
        )

        global mocked_process
        global mocked_process_constructor

        args, kwargs = mocked_process_constructor.call_args_list[0]

        assert kwargs["target"]() == 42
        assert kwargs["args"][0] == fake_queries[0]
        assert isinstance(kwargs["args"][1], ValueType)

        mocked_process.start.assert_called_once()
        mocked_process.join.assert_called_once()
        mocked_process.terminate.assert_called_once()

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.BackgroundJobManager._execute_table_query",
        fake_execute_table_query,
    )
    def test_successfully_updates_loaded_tables(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully update table loading queries in parallel."""
        fake_table_names: List[str] = ["HyriseAreYouStillAlive"]
        fake_queries: Tuple[str] = ("Ping Hyrise",)
        folder_name: str = "Hallo"

        background_job_manager._loaded_tables = {}

        background_job_manager._execute_queries_parallel(
            fake_table_names, fake_queries, folder_name
        )

        assert "HyriseAreYouStillAlive" in background_job_manager._loaded_tables
        assert (
            background_job_manager._loaded_tables["HyriseAreYouStillAlive"] == "Hallo"
        )

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.BackgroundJobManager._execute_table_query",
        lambda *args: "I do nothing",
    )
    def test_doesnt_update_loaded_tables_when_unsuccessful(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesnt update loaded tables when loading wasn't successful."""
        fake_table_names: List[str] = ["HyriseAreYouStillAlive"]
        fake_queries: Tuple[str] = ("Ping Hyrise",)
        folder_name: str = "Hallo"

        background_job_manager._loaded_tables = {}

        background_job_manager._execute_queries_parallel(
            fake_table_names, fake_queries, folder_name
        )

        assert "HyriseAreYouStillAlive" not in background_job_manager._loaded_tables

    def test_successfully_calls_execute_queries(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully calls execute queries in load tables job."""
        background_job_manager._database_blocked.value = True

        background_job_manager._generate_table_loading_queries = MagicMock()  # type: ignore
        background_job_manager._execute_queries_parallel = MagicMock()  # type: ignore

        background_job_manager._load_tables_job(["table_names"], "folder_name")

        background_job_manager._generate_table_loading_queries.assert_called_once()  # type: ignore
        background_job_manager._execute_queries_parallel.assert_called_once()  # type: ignore

        assert not background_job_manager._database_blocked.value

    @patch(
        "hyrisecockpit.database_manager.background_scheduler._table_names", fake_dict,
    )
    def test_get_load_table_names(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test gets table names of not imported tables."""
        fake_loaded_tables: Dict[str, Optional[str]] = {
            "The Dough Rollers": "alternative",
            "Broken Witt Rebels": "Hip Hop",
            "Bonny Doon": "alternative",
            "Jack White": "alternative",
            "Gary Clark Jr.": "Rock",
            "Greta Van Fleet": "Rock",
            "Tenacious D": "Rock",
        }

        background_job_manager._loaded_tables = fake_loaded_tables

        received: List[str] = background_job_manager._get_load_table_names(
            "alternative"
        )

        expected = ["Broken Witt Rebels"]

        assert received == expected

    @patch(
        "hyrisecockpit.database_manager.background_scheduler._table_names", fake_dict,
    )
    def test_get_empty_load_table_names(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test gets empty list when workload isn't available."""
        fake_loaded_tables: Dict[str, Optional[str]] = {
            "The Dough Rollers": "alternative",
            "Broken Witt Rebels": "Hip Hop",
            "Bonny Doon": "alternative",
            "Jack White": "alternative",
            "Gary Clark Jr.": "Rock",
            "Greta Van Fleet": "Rock",
            "Tenacious D": "Rock",
        }

        background_job_manager._loaded_tables = fake_loaded_tables

        received: List = background_job_manager._get_load_table_names(
            "techno techno... :("
        )

        assert received == []

    def test_doesnt_load_tables_when_database_locked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesn't load tables when database is locked."""
        background_job_manager._scheduler = MagicMock()
        background_job_manager._database_blocked.value = True

        mocked_get_load_table_names: MagicMock = MagicMock()
        background_job_manager._get_load_table_names = mocked_get_load_table_names  # type: ignore

        result = background_job_manager.load_tables("")

        background_job_manager._get_load_table_names.assert_not_called()  # type: ignore
        background_job_manager._scheduler.add_job.assert_not_called()

        assert not result
        assert background_job_manager._database_blocked.value

    def test_doesnt_load_tables_when_table_names_empty(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesn't load tables when table names is empty."""
        background_job_manager._scheduler = MagicMock()
        background_job_manager._database_blocked.value = False

        mocked_get_load_table_names: MagicMock = MagicMock()
        mocked_get_load_table_names.return_value = []
        background_job_manager._get_load_table_names = mocked_get_load_table_names  # type: ignore

        result: bool = background_job_manager.load_tables("folder_name")

        mocked_get_load_table_names.assert_called_once_with(workload_type="folder_name")
        background_job_manager._scheduler.add_job.assert_not_called()

        assert result
        assert not background_job_manager._database_blocked.value

    def test_successfully_loads_tables(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully loads tables."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.add_job.return_value = None
        background_job_manager._scheduler = mock_scheduler
        background_job_manager._database_blocked.value = False

        mocked_get_load_table_names: MagicMock = MagicMock()
        mocked_get_load_table_names.return_value = ["table_name"]
        background_job_manager._get_load_table_names = mocked_get_load_table_names  # type: ignore

        result: bool = background_job_manager.load_tables("folder_name")

        mocked_get_load_table_names.assert_called_once_with(workload_type="folder_name")
        background_job_manager._scheduler.add_job.assert_called_once_with(
            func=background_job_manager._load_tables_job,
            args=(["table_name"], "folder_name"),
        )

        assert result
        assert background_job_manager._database_blocked.value

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.PoolCursor",
        get_mocked_pool_cursor,
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.AsIs",
        lambda plugin: f"AsIs({plugin})",
    )
    def test_execute_plugin_activating_query_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully executes plugin activating query."""
        background_job_manager._activate_plugin_job("plugin")

        global mocked_pool_cursor

        expected_query: str = "INSERT INTO meta_plugins(name) VALUES ('/usr/local/hyrise/lib/lib%sPlugin.so');"
        expected_parameter: Tuple[str] = ("AsIs(plugin)",)

        mocked_pool_cursor.execute.assert_called_once_with(
            expected_query, expected_parameter
        )

        mocked_pool_cursor = MagicMock()

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.PoolCursor",
        get_mocked_pool_cursor,
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.AsIs",
        lambda plugin: f"AsIs({plugin})",
    )
    def test_execute_plugin_deactivating_query_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully executes plugin deactivating query."""
        background_job_manager._deactivate_plugin_job("plugin")

        global mocked_pool_cursor

        expected_query: str = "DELETE FROM meta_plugins WHERE name='%sPlugin';"
        expected_parameter: Tuple[str] = ("AsIs(plugin)",)

        mocked_pool_cursor.execute.assert_called_once_with(
            expected_query, expected_parameter
        )

        mocked_pool_cursor = MagicMock()

    def test_successfully_adds_plugin_activating_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully adds plugin activating job."""
        background_job_manager._database_blocked.value = False
        background_job_manager._scheduler = MagicMock()

        result: bool = background_job_manager.activate_plugin("HyriseHallo")

        background_job_manager._scheduler.add_job.assert_called_once_with(
            func=background_job_manager._activate_plugin_job, args=("HyriseHallo",)
        )
        assert result

    def test_successfully_adds_plugin_deactivating_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully adds plugin deactivating job."""
        background_job_manager._database_blocked.value = False
        background_job_manager._scheduler = MagicMock()

        result: bool = background_job_manager.deactivate_plugin("HyriseBye")

        background_job_manager._scheduler.add_job.assert_called_once_with(
            func=background_job_manager._deactivate_plugin_job, args=("HyriseBye",)
        )
        assert result

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.PoolCursor",
        get_mocked_pool_cursor,
    )
    def test_get_existing_tables(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test gets existing tables."""
        global mocked_pool_cursor

        mocked_pool_cursor.fetchall.return_value = [("table_name",)]

        result: Dict[
            str, List[Optional[str]]
        ] = background_job_manager._get_existing_tables(
            ["table_name", "another_table_name"]
        )

        expected: Dict[str, List[str]] = {
            "existing": ["table_name"],
            "not_existing": ["another_table_name"],
        }

        assert result == expected

        mocked_pool_cursor = MagicMock()

    def test_successfully_generates_table_dropping_queries(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully generates table dropping queries."""
        fake_existing_table_names: Dict[str, List[Optional[str]]] = {
            "existing": ["keep", "hyrise", "alive"],
            "not_existing": ["hyrise running"],
        }

        background_job_manager._get_existing_tables = MagicMock()  # type: ignore
        background_job_manager._get_existing_tables.return_value = (  # type: ignore
            fake_existing_table_names
        )

        received_queries = background_job_manager._generate_table_drop_queries(
            ["table_names"],
        )

        expected_queries = [
            ("DROP TABLE %s;", (("keep", "as_is"),),),
            ("DROP TABLE %s;", (("hyrise", "as_is"),),),
            ("DROP TABLE %s;", (("alive", "as_is"),),),
        ]

        assert received_queries == expected_queries

    def test_delete_tables_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test delete tables job."""
        fake_drop_queries: List[Tuple[str, Tuple[Tuple[str, str]]]] = [
            ("DROP TABLE %s;", (("keep", "as_is"),),),
            ("DROP TABLE %s;", (("hyrise", "as_is"),),),
            ("DROP TABLE %s;", (("alive", "as_is"),),),
        ]
        fake_table_names: List[str] = ["keep", "hyrise", "alive"]

        background_job_manager._database_blocked.value = True

        mocked_generate_table_drop_queries: MagicMock = MagicMock()
        mocked_generate_table_drop_queries.return_value = fake_drop_queries
        background_job_manager._generate_table_drop_queries = (  # type: ignore
            mocked_generate_table_drop_queries
        )

        background_job_manager._execute_queries_parallel = MagicMock()  # type: ignore

        background_job_manager._delete_tables_job(fake_table_names)

        background_job_manager._generate_table_drop_queries.assert_called_once_with(  # type: ignore
            fake_table_names
        )
        background_job_manager._execute_queries_parallel.assert_called_once_with(  # type: ignore
            fake_table_names, fake_drop_queries, None
        )
        assert not background_job_manager._database_blocked.value

    @patch(
        "hyrisecockpit.database_manager.background_scheduler._table_names", fake_dict,
    )
    def test_get_delete_table_names(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test gets table names of imported tables."""
        received: List[str] = background_job_manager._get_delete_table_names(
            "alternative"
        )

        expected: List[str] = [
            "The Dough Rollers",
            "Broken Witt Rebels",
            "Bonny Doon",
            "Jack White",
        ]

        assert received == expected

    def test_doesnt_delete_tables_when_database_locked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesn't delete tables when database is locked."""
        background_job_manager._scheduler = MagicMock()
        background_job_manager._database_blocked.value = True

        mocked_get_delete_table_names = MagicMock()
        background_job_manager._get_delete_table_names = mocked_get_delete_table_names  # type: ignore

        result: bool = background_job_manager.delete_tables("")

        background_job_manager._get_delete_table_names.assert_not_called()  # type: ignore
        background_job_manager._scheduler.add_job.assert_not_called()

        assert not result
        assert background_job_manager._database_blocked.value

    def test_doesnt_delete_tables_when_table_names_empty(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesn't delete tables when table names is empty."""
        background_job_manager._scheduler = MagicMock()
        background_job_manager._database_blocked.value = False

        mocked_get_delete_table_names: MagicMock = MagicMock()
        mocked_get_delete_table_names.return_value = []
        background_job_manager._get_delete_table_names = mocked_get_delete_table_names  # type: ignore

        result: bool = background_job_manager.delete_tables("folder_name")

        mocked_get_delete_table_names.assert_called_once_with("folder_name")
        background_job_manager._scheduler.add_job.assert_not_called()

        assert result
        assert not background_job_manager._database_blocked.value

    def test_successfully_delets_tables(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully deletes tables."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.add_job.return_value = None
        background_job_manager._scheduler = mock_scheduler
        background_job_manager._database_blocked.value = False

        mocked_get_delete_table_names: MagicMock = MagicMock()
        mocked_get_delete_table_names.return_value = ["table_name"]
        background_job_manager._get_delete_table_names = mocked_get_delete_table_names  # type: ignore

        result: bool = background_job_manager.delete_tables("folder_name")

        mocked_get_delete_table_names.assert_called_once_with("folder_name")
        background_job_manager._scheduler.add_job.assert_called_once_with(
            func=background_job_manager._delete_tables_job, args=(["table_name"],)
        )

        assert result
        assert background_job_manager._database_blocked.value

"""Tests for the background_scheduler module."""

from multiprocessing import Value
from multiprocessing.sharedctypes import Synchronized as ValueType
from typing import Any, Callable, Dict, List, Optional, Tuple
from unittest.mock import call, patch

from pandas import DataFrame
from pandas.core.frame import DataFrame as DataframeType
from psycopg2 import DatabaseError, InterfaceError
from pytest import fixture, mark

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.background_scheduler import (
    BackgroundJobManager,
    execute_table_query,
    format_query_parameters,
)
from hyrisecockpit.database_manager.cursor import ConnectionFactory
from hyrisecockpit.database_manager.job.ping_hyrise import ping_hyrise
from hyrisecockpit.database_manager.job.update_chunks_data import update_chunks_data
from hyrisecockpit.database_manager.job.update_krueger_data import update_krueger_data
from hyrisecockpit.database_manager.job.update_plugin_log import update_plugin_log
from hyrisecockpit.database_manager.job.update_queue_length import update_queue_length
from hyrisecockpit.database_manager.job.update_storage_data import update_storage_data
from hyrisecockpit.database_manager.job.update_system_data import update_system_data

database_id: str = "MongoDB"
get_database_blocked: Callable[[], Value] = lambda: Value("b", False)  # noqa: E731
get_hyrise_active: Callable[[], Value] = lambda: Value("b", True)
get_connection_pool: Callable[[], MagicMock] = lambda: MagicMock()  # noqa: E731
get_storage_connection_factory: Callable[
    [], MagicMock
] = lambda: MagicMock()  # noqa: E731
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


def fake_execute_table_query(
    query: Tuple, success_flag: Value, connection_factory: ConnectionFactory
) -> None:
    """Return dummy execute table query method that sets flag to true."""
    success_flag.value = True


def fake_unsuccessful_execute_table_query(
    query: Tuple, success_flag: Value, connection_factory: ConnectionFactory
) -> None:
    """Return dummy execute table query method that sets flag to false."""
    success_flag.value = False


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
            get_hyrise_active(),
            worker_pool,
            get_storage_connection_factory(),
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
        assert isinstance(background_job_manager._previous_chunks_data, dict)
        assert background_job_manager._hyrise_active.value == get_hyrise_active().value

    def test_initializes_background_scheduler_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test initialization of background scheduler job."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.add_job.return_value = None
        background_job_manager._scheduler = mock_scheduler

        jobs: Tuple[Callable[..., Any], str, int] = [
            (
                update_queue_length,
                "interval",
                1,
                (
                    background_job_manager._worker_pool,
                    background_job_manager._hyrise_active,
                ),
            ),
            (
                update_krueger_data,
                "interval",
                5,
                (background_job_manager._storage_connection_factory,),
            ),
            (
                update_chunks_data,
                "interval",
                5,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (
                update_system_data,
                "interval",
                1,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (
                update_storage_data,
                "interval",
                5,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (
                update_plugin_log,
                "interval",
                1,
                (
                    background_job_manager._database_blocked,
                    background_job_manager._connection_factory,
                    background_job_manager._storage_connection_factory,
                ),
            ),
            (ping_hyrise, "interval", 0.5, (background_job_manager._connection_factory, background_job_manager._hyrise_active)),  # type: ignore
        ]

        expected = [
            call.add_job(func=job[0], trigger=job[1], seconds=job[2], args=job[3])  # type: ignore
            for job in jobs
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
        background_job_manager._ping_hyrise_job = MagicMock()
        background_job_manager._update_queue_length_job = MagicMock()

        background_job_manager.close()

        background_job_manager._update_krueger_data_job.remove.assert_called_once()
        background_job_manager._update_system_data_job.remove.assert_called_once()
        background_job_manager._update_chunks_data_job.remove.assert_called_once()
        background_job_manager._update_storage_data_job.remove.assert_called_once()
        background_job_manager._update_plugin_log_job.remove.assert_called_once()
        background_job_manager._ping_hyrise_job.remove.assert_called_once()
        background_job_manager._update_queue_length_job.remove.assert_called_once()
        mock_scheduler.shutdown.assert_called_once()

    def tests_successfully_generates_table_loading_queries(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully generates table loading queries."""
        fake_folder_name: str = "hyriseDown"
        fake_table_names: List[str] = ["keep", "on", "going", "please!!!"]
        mock_get_original_table_names_from_workload_type = MagicMock()
        mock_get_original_table_names_from_workload_type.return_value = fake_table_names

        background_job_manager._get_origin_tables_from_workload_type = (  # type: ignore
            mock_get_original_table_names_from_workload_type
        )

        received_queries = background_job_manager._generate_table_loading_queries(
            fake_table_names, fake_folder_name
        )

        expected_queries = [
            (
                "COPY %s_%s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (
                    ("keep", "as_is"),
                    (fake_folder_name, "as_is"),
                    (fake_folder_name, "as_is"),
                    ("keep", "as_is"),
                ),
            ),
            (
                "COPY %s_%s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (
                    ("on", "as_is"),
                    (fake_folder_name, "as_is"),
                    (fake_folder_name, "as_is"),
                    ("on", "as_is"),
                ),
            ),
            (
                "COPY %s_%s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (
                    ("going", "as_is"),
                    (fake_folder_name, "as_is"),
                    (fake_folder_name, "as_is"),
                    ("going", "as_is"),
                ),
            ),
            (
                "COPY %s_%s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
                (
                    ("please!!!", "as_is"),
                    ("hyriseDown", "as_is"),
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
    def test_successfully_formats_query_parameters(self) -> None:
        """Test successfully formats query parameters."""
        parameters = (
            ("keep", "as_is",),
            ("hyriseDown", None,),
            ("keep", None,),
        )
        received = format_query_parameters(parameters)
        assert received == ("AsIs(keep)", "hyriseDown", "keep")

    def test_doesnt_format_no_parameters(self) -> None:
        """Test doesn't format when there are no parameters."""
        assert format_query_parameters(None) is None

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.format_query_parameters"
    )
    def test_successfully_executes_table_query(
        self, mock_format_query_parameters: MagicMock
    ) -> None:
        """Test successfully executes table queries."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        mock_format_query_parameters.return_value = (
            "keep",
            "hyriseDown",
            "keep",
        )

        query_tuple: Tuple[str, Tuple[str, str, str]] = (
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )

        success_flag: Value = Value("b", 0)
        execute_table_query(query_tuple, success_flag, mock_connection_factory)

        mock_cursor.execute.assert_called_once_with(
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )
        assert success_flag.value

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.format_query_parameters"
    )
    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_successfully_executes_table_query_with_exception_from_database(
        self, mock_format_query_parameters: MagicMock, exceptions
    ) -> None:
        """Test executes table queries with exception from database."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        mock_format_query_parameters.return_value = (
            "keep",
            "hyriseDown",
            "keep",
        )

        query_tuple: Tuple[str, Tuple[str, str, str]] = (
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )

        success_flag: Value = Value("b", False)
        execute_table_query(query_tuple, success_flag, mock_connection_factory)

        mock_cursor.execute.assert_called_once_with(
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )
        assert not success_flag.value

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.Process",
        mocked_process_constructor,
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.execute_table_query",
        lambda *args: 42,
    )
    def test_starts_processes_for_execute_queries_parallel(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start processes for table loading queries in parallel."""
        fake_table_names: List[str] = ["HyriseAreYoueStillAlive"]
        fake_queries: Tuple[str] = ("Ping Hyrise",)
        folder_name: str = "Hallo"

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

    def test_successfully_calls_execute_queries(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully calls execute queries in load tables job."""
        folder_name = "folder_name"
        table_names = ["table1", "table2"]
        background_job_manager._database_blocked.value = True

        background_job_manager._generate_table_loading_queries = MagicMock()  # type: ignore
        background_job_manager._execute_queries_parallel = MagicMock()  # type: ignore

        background_job_manager._load_tables_job(table_names, folder_name)

        background_job_manager._generate_table_loading_queries.assert_called_once()
        background_job_manager._execute_queries_parallel.assert_called_once()

        assert not background_job_manager._database_blocked.value

    def test_get_load_table_names(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test gets table names of not imported tables."""
        background_job_manager._get_required_table_names = MagicMock()  # type: ignore
        background_job_manager._get_required_table_names.return_value = [
            "table_1",
            "table_2",
        ]
        background_job_manager._get_existing_tables = MagicMock()  # type: ignore
        background_job_manager._get_existing_tables.return_value = {
            "existing": ["table_1"],
            "not_existing": ["table_2"],
        }

        received: List[str] = background_job_manager._get_load_table_names(
            "alternative"
        )

        expected = ["table_2"]

        assert received == expected
        background_job_manager._get_required_table_names.assert_called_once_with(
            "alternative"
        )
        background_job_manager._get_existing_tables.assert_called_once_with(
            ["table_1", "table_2"]
        )

    def test_doesnt_load_tables_when_database_locked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesn't load tables when database is locked."""
        background_job_manager._scheduler = MagicMock()
        background_job_manager._database_blocked.value = True

        mocked_get_load_table_names: MagicMock = MagicMock()
        background_job_manager._get_load_table_names = mocked_get_load_table_names  # type: ignore

        result = background_job_manager.load_tables("")

        background_job_manager._get_load_table_names.assert_not_called()
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
        "hyrisecockpit.database_manager.background_scheduler.AsIs",
        lambda plugin: f"AsIs({plugin})",
    )
    def test_execute_plugin_activating_query_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully executes plugin activating query."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        background_job_manager._connection_factory = mock_connection_factory
        background_job_manager._database_blocked.value = False

        background_job_manager._activate_plugin_job("plugin")

        expected_query: str = "INSERT INTO meta_plugins(name) VALUES ('/usr/local/hyrise/lib/lib%sPlugin.so');"
        expected_parameter: Tuple[str] = ("AsIs(plugin)",)

        mock_cursor.execute.assert_called_once_with(expected_query, expected_parameter)

    @patch(
        "hyrisecockpit.database_manager.background_scheduler.AsIs",
        lambda plugin: f"AsIs({plugin})",
    )
    def test_execute_plugin_deactivating_query_job(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully executes plugin deactivating query."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        background_job_manager._connection_factory = mock_connection_factory
        background_job_manager._database_blocked.value = False

        background_job_manager._deactivate_plugin_job("plugin")

        expected_query: str = "DELETE FROM meta_plugins WHERE name='%sPlugin';"
        expected_parameter: Tuple[str] = ("AsIs(plugin)",)

        mock_cursor.execute.assert_called_once_with(expected_query, expected_parameter)

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

    def test_get_existing_tables(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test gets existing tables."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        background_job_manager._connection_factory = mock_connection_factory
        background_job_manager._database_blocked.value = True

        mock_cursor.fetchall.return_value = [("table_name",)]

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

    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_get_existing_tables_with_exception_from_database(
        self, background_job_manager: BackgroundJobManager, exceptions
    ) -> None:
        """Test gets existing tables with exception from database."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        background_job_manager._connection_factory = mock_connection_factory
        background_job_manager._database_blocked.value = True

        result: Dict[
            str, List[Optional[str]]
        ] = background_job_manager._get_existing_tables(
            ["table_name", "another_table_name"]
        )

        expected: Dict[str, List[str]] = {
            "existing": [],
            "not_existing": [],
        }

        assert result == expected

    def test_successfully_generates_table_dropping_queries(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully generates table dropping queries."""
        fake_existing_table_names: Dict[str, List[Optional[str]]] = {
            "existing": ["keep", "hyrise", "alive"],
            "not_existing": ["hyrise running"],
        }

        background_job_manager._get_existing_tables = MagicMock()  # type: ignore
        background_job_manager._get_existing_tables.return_value = (
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

        background_job_manager._generate_table_drop_queries.assert_called_once_with(
            fake_table_names
        )
        background_job_manager._execute_queries_parallel.assert_called_once_with(
            fake_table_names, fake_drop_queries, None
        )
        assert not background_job_manager._database_blocked.value

    def test_get_delete_table_names(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test gets table names of not imported tables."""
        background_job_manager._get_required_table_names = MagicMock()  # type: ignore
        background_job_manager._get_required_table_names.return_value = [
            "table_1",
            "table_2",
        ]
        background_job_manager._get_existing_tables = MagicMock()  # type: ignore
        background_job_manager._get_existing_tables.return_value = {
            "existing": ["table_1"],
            "not_existing": ["table_2"],
        }

        received: List[str] = background_job_manager._get_delete_table_names(
            "alternative"
        )

        expected = ["table_1"]

        assert received == expected
        background_job_manager._get_required_table_names.assert_called_once_with(
            "alternative"
        )
        background_job_manager._get_existing_tables.assert_called_once_with(
            ["table_1", "table_2"]
        )

    def test_doesnt_delete_tables_when_database_locked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test doesn't delete tables when database is locked."""
        background_job_manager._scheduler = MagicMock()
        background_job_manager._database_blocked.value = True

        mocked_get_delete_table_names = MagicMock()
        background_job_manager._get_delete_table_names = mocked_get_delete_table_names  # type: ignore

        result: bool = background_job_manager.delete_tables("")

        background_job_manager._get_delete_table_names.assert_not_called()
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

    @patch(
        "hyrisecockpit.database_manager.background_scheduler._table_names",
        {"benchmark": ["table1", "table2"]},
    )
    def test_get_required_table_names(
        self, background_job_manager: BackgroundJobManager
    ):
        """Test get required table names."""
        required_tables = background_job_manager._get_required_table_names(
            "benchmark_sf"
        )

        assert required_tables == ["table1_benchmark_sf", "table2_benchmark_sf"]

    def test_get_origin_table_names(self, background_job_manager: BackgroundJobManager):
        """Test get original table names."""
        table_names = ["table1_benchmark_sf", "table2_benchmark_sf"]
        required_tables = background_job_manager._get_origin_tables_from_workload_type(
            table_names, "benchmark_sf"
        )

        assert required_tables == ["table1", "table2"]

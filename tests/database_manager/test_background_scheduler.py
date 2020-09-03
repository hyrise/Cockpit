"""Tests for the background_scheduler module."""
from multiprocessing import Value
from unittest.mock import patch

from pytest import fixture

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.background_scheduler import BackgroundJobManager
from hyrisecockpit.database_manager.job.activate_plugin import (
    activate_plugin as activate_plugin_job,
)
from hyrisecockpit.database_manager.job.deactivate_plugin import (
    deactivate_plugin as deactivate_plugin_job,
)
from hyrisecockpit.database_manager.job.delete_tables import (
    delete_tables as delete_tables_job,
)
from hyrisecockpit.database_manager.job.load_tables import (
    load_tables as load_tables_job,
)

database_id: str = "MongoDB"
database_blocked: Value = Value("b", False)
hyrise_active: Value = Value("b", True)
storage_connection_factory: MagicMock = MagicMock()
connection_factory: MagicMock = MagicMock()
worker_pool: MagicMock = MagicMock()
workload_drivers = MagicMock()


class TestBackgroundJobManager:
    """Tests for the BackgroundJobManager class."""

    @fixture
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.BackgroundScheduler",
        MagicMock(),
    )
    @patch(
        "hyrisecockpit.database_manager.background_scheduler.ContinuousJobHandler",
        MagicMock(),
    )
    def background_job_manager(self) -> BackgroundJobManager:
        """Get a new BackgrpundJobManager."""
        return BackgroundJobManager(
            database_id,
            database_blocked,
            connection_factory,
            hyrise_active,
            worker_pool,
            storage_connection_factory,
            workload_drivers,
        )

    def test_creates(self, background_job_manager: BackgroundJobManager):
        """A BackgroundJobManager can be created."""
        assert background_job_manager

    @patch("hyrisecockpit.database_manager.background_scheduler.BackgroundScheduler")
    def test_initializes_correctly(self, mock_background_scheduler: MagicMock) -> None:
        """A BackgroundJobManager initializes correctly."""
        background_job_manager = BackgroundJobManager(
            database_id,
            database_blocked,
            connection_factory,
            hyrise_active,
            worker_pool,
            storage_connection_factory,
            workload_drivers,
        )

        assert isinstance(background_job_manager, BackgroundJobManager)
        assert background_job_manager._database_id == database_id
        assert background_job_manager._database_blocked == database_blocked
        assert background_job_manager._connection_factory == connection_factory
        assert background_job_manager._workload_drivers == workload_drivers
        assert (
            background_job_manager._storage_connection_factory
            == storage_connection_factory
        )
        assert background_job_manager._hyrise_active == hyrise_active
        mock_background_scheduler.assert_called_once()

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
        """Test close of background scheduler."""
        mock_scheduler: MagicMock = MagicMock()
        mock_scheduler.close.return_value = None
        background_job_manager._scheduler = mock_scheduler

        background_job_manager.close()

        mock_scheduler.shutdown.assert_called_once()

    def test_successfully_start_loading_tables(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully start loading tables job."""
        background_job_manager._database_blocked.value = False
        background_job_manager._scheduler = MagicMock()
        background_job_manager._connection_factory = MagicMock()
        fake_workload_type = "tpch"
        fake_scale_factor = 1.0

        result: bool = background_job_manager.load_tables(
            fake_workload_type, fake_scale_factor
        )

        background_job_manager._scheduler.add_job.assert_called_once_with(
            func=load_tables_job,
            args=(
                background_job_manager._database_blocked,
                fake_workload_type,
                fake_scale_factor,
                background_job_manager._connection_factory,
                workload_drivers,
            ),
        )
        assert result

    def test_start_loading_tables_while_database_is_blocked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start loading tables job while database is blocked."""
        background_job_manager._database_blocked.value = True
        background_job_manager._scheduler = MagicMock()
        background_job_manager._connection_factory = MagicMock()
        fake_workload_type = "tpch"
        fake_scale_factor = 1.0

        result: bool = background_job_manager.load_tables(
            fake_workload_type, fake_scale_factor
        )

        background_job_manager._scheduler.add_job.assert_not_called()
        assert not result

    def test_successfully_delete_tables_tables(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully delete loading tables job."""
        background_job_manager._database_blocked.value = False
        background_job_manager._scheduler = MagicMock()
        background_job_manager._connection_factory = MagicMock()
        fake_workload_type = "tpch"
        fake_scale_factor = 1.0

        result: bool = background_job_manager.delete_tables(
            fake_workload_type, fake_scale_factor
        )

        background_job_manager._scheduler.add_job.assert_called_once_with(
            func=delete_tables_job,
            args=(
                background_job_manager._database_blocked,
                fake_workload_type,
                fake_scale_factor,
                background_job_manager._connection_factory,
                workload_drivers,
            ),
        )
        assert result

    def test_start_delete_tables_while_database_is_blocked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start delete tables job while database is blocked."""
        background_job_manager._database_blocked.value = True
        background_job_manager._scheduler = MagicMock()
        background_job_manager._connection_factory = MagicMock()
        fake_workload_type = "tpch"
        fake_scale_factor = 1.0

        result: bool = background_job_manager.delete_tables(
            fake_workload_type, fake_scale_factor
        )

        background_job_manager._scheduler.add_job.assert_not_called()
        assert not result

    def test_successfully_activate_plugin(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully start activate plug-in job."""
        background_job_manager._database_blocked.value = False
        background_job_manager._scheduler = MagicMock()
        background_job_manager._connection_factory = MagicMock()
        fake_plugin = "plugin"

        result: bool = background_job_manager.activate_plugin(fake_plugin)

        background_job_manager._scheduler.add_job.assert_called_once_with(
            func=activate_plugin_job,
            args=(background_job_manager._connection_factory, fake_plugin),
        )
        assert result

    def test_start_activate_plugin_while_database_is_blocked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start activate plug-in job while database is blocked."""
        background_job_manager._database_blocked.value = True
        background_job_manager._scheduler = MagicMock()
        background_job_manager._connection_factory = MagicMock()
        fake_plugin = "plugin"

        result: bool = background_job_manager.activate_plugin(fake_plugin)

        background_job_manager._scheduler.add_job.assert_not_called()
        assert not result

    def test_successfully_deactivate_plugin(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test successfully start deactivate plug-in job."""
        background_job_manager._database_blocked.value = False
        background_job_manager._scheduler = MagicMock()
        background_job_manager._connection_factory = MagicMock()
        fake_plugin = "plugin"

        result: bool = background_job_manager.deactivate_plugin(fake_plugin)

        background_job_manager._scheduler.add_job.assert_called_once_with(
            func=deactivate_plugin_job,
            args=(background_job_manager._connection_factory, fake_plugin),
        )
        assert result

    def test_start_deactivate_plugin_while_database_is_blocked(
        self, background_job_manager: BackgroundJobManager
    ) -> None:
        """Test start deactivate plug-in job while database is blocked."""
        background_job_manager._database_blocked.value = True
        background_job_manager._scheduler = MagicMock()
        background_job_manager._connection_factory = MagicMock()
        fake_plugin = "plugin"

        result: bool = background_job_manager.deactivate_plugin(fake_plugin)

        background_job_manager._scheduler.add_job.assert_not_called()
        assert not result

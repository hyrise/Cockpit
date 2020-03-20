"""Tests for the database module."""

from multiprocessing.sharedctypes import Synchronized as ValueType
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.database_manager.database import Database


class TestDatabase(object):
    """Tests for the Database class."""

    def get_id(self) -> str:
        """Return database id."""
        return "MongoDB Number One"

    def get_user(self) -> str:
        """Return database user."""
        return "Proform"

    def get_password(self) -> str:
        """Return database password."""
        return "passwort"

    def get_host(self) -> str:
        """Return host."""
        return "nsa"

    def get_port(self) -> str:
        """Return port."""
        return "666"

    def get_dbname(self) -> str:
        """Return database name."""
        return "MongoDB"

    def get_number_workers(self) -> int:
        """Return number of worker."""
        return 42

    def get_workload_publisher_url(self) -> str:
        """Return workload publisher URL."""
        return "lothar matthäus"

    def get_default_tables(self) -> str:
        """Return default tables."""
        return "Watt_ihr_Volt"

    def get_storage_host(self) -> str:
        """Return storage host."""
        return "xulfni"

    def get_storage_password(self) -> str:
        """Return storage password."""
        return "1234"

    def get_storage_port(self) -> str:
        """Return storage port."""
        return "42"

    def get_storage_user(self) -> str:
        """Return storage user."""
        return "Käptin Blaubär"

    def get_fake_background_job_manager(
        id,  # noqa
        database_blocked,
        connection_pool,
        storage_host,
        storage_password,
        storage_port,
        storage_user,
    ) -> MagicMock:
        """Return fake  BackgroundJobManager."""
        m = MagicMock()
        m.start.side_effect = None
        m.load_tables.side_effect = None
        return m

    @fixture
    @patch(
        "hyrisecockpit.database_manager.database.BackgroundJobManager",
        get_fake_background_job_manager,
    )
    @patch("hyrisecockpit.database_manager.database.WorkerPool", MagicMock())
    @patch("hyrisecockpit.database_manager.database.Driver", MagicMock())
    def database(self) -> Database:
        """Get a new Database."""
        return Database(
            self.get_id(),
            self.get_user(),
            self.get_password(),
            self.get_host(),
            self.get_port(),
            self.get_dbname(),
            self.get_number_workers(),
            self.get_workload_publisher_url(),
            self.get_default_tables(),
            self.get_storage_host(),
            self.get_storage_password(),
            self.get_storage_port(),
            self.get_storage_user(),
        )

    def test_inintialize_database(self, database) -> None:
        """Test initialization of worker pool attributes."""
        assert database._id == self.get_id()
        assert database.number_workers == self.get_number_workers()
        assert database._default_tables == self.get_default_tables()
        assert type(database._number_additional_connections) is int
        assert type(database._database_blocked) is ValueType
        assert not database._database_blocked.value
        database._background_scheduler.start.assert_called_once()
        database._background_scheduler.load_tables.assert_called_once_with(
            self.get_default_tables()
        )

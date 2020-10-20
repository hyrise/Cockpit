"""Tests for the set plug-in settings job."""
from multiprocessing import Value

from psycopg2 import DatabaseError, InterfaceError
from pytest import mark

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.set_plugin_setting import set_plugin_setting


class TestSetPluginSettingJob:
    """Tests for the set plug-in settings job."""

    def test_sets_plugin_setting_when_database_is_unblocked(self) -> None:
        """Test set plug-in setting while the database is not blocked."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database_blocked = Value("b", 0)

        result: bool = set_plugin_setting(
            "Compression",
            "MemoryBudget",
            "55555",
            mock_connection_factory,
            database_blocked,
        )

        mock_cursor.execute.assert_called_once_with(
            "UPDATE meta_settings SET value=%s WHERE name=%s;",
            (
                "55555",
                "Plugin::Compression::MemoryBudget",
            ),
        )

        assert type(result) is bool
        assert result

    def test_set_plugin_settings_when_database_blocked(self) -> None:
        """Test set plug-in setting while the database is blocked."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database_blocked = Value("b", 1)

        result: bool = set_plugin_setting(
            "Compression",
            "MemoryBudget",
            "55555",
            mock_connection_factory,
            database_blocked,
        )

        mock_cursor.execute.assert_not_called()

        assert type(result) is bool
        assert not result

    @mark.parametrize(
        "exceptions",
        [DatabaseError(), InterfaceError()],
    )
    def test_sets_plugin_settings_when_database_throws_exception(
        self, exceptions
    ) -> None:
        """Test sets plug-in settings when database throws exception."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database_blocked = Value("b", 0)
        mock_cursor.execute.side_effect = raise_exception

        result: bool = set_plugin_setting(
            "Compression",
            "MemoryBudget",
            "55555",
            mock_connection_factory,
            database_blocked,
        )

        assert not result

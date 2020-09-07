"""Tests for the get plug-ins job."""
from collections import Counter
from typing import List, Optional
from unittest.mock import patch

from psycopg2 import DatabaseError, InterfaceError
from pytest import mark

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.get_detailed_plugins import (
    _get_plugin_setting,
    _get_plugins,
    get_detailed_plugins,
)


class TestGetPluginsJob:
    """Tests for the get plug-ins job."""

    def test_gets_plugins_when_no_plugins_exists(self) -> None:
        """Test get not existing plug-ins."""
        mock_cursor = MagicMock()
        mock_cursor.fetchall.return_value = []
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        result: Optional[List] = _get_plugins(mock_connection_factory)

        mock_cursor.execute.assert_called_once_with(
            ("SELECT name FROM meta_plugins;"), None
        )
        assert type(result) is list
        assert result == []

    def test_gets_plugins_when_plugins_exists(self) -> None:
        """Test get existing plug-ins."""
        mock_cursor = MagicMock()
        mock_cursor.fetchall.return_value = [
            ("Hildegunst von Mythenmetz", "Lindwurm", "sprachliche Begabung",),
            (
                "Rumo von Zamonien",
                "Wolpertinger",
                "gute Schachspieler und gute Kämpfer",
            ),
        ]
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        expected: List[str] = ["Hildegunst von Mythenmetz", "Rumo von Zamonien"]
        result: Optional[List] = _get_plugins(mock_connection_factory)

        assert type(result) is list
        assert Counter(result) == Counter(expected)

    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_gets_plugins_when_database_throws_exception(self, exceptions) -> None:
        """Test get existing plug-ins when database throws exception."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        result: Optional[List] = _get_plugins(mock_connection_factory)

        assert result is None

    def test_gets_plugins_settings_when_no_plugins_exist(self) -> None:
        """Test get not existing plug-ins settings."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        result = _get_plugin_setting(mock_connection_factory)

        mock_cursor.execute.assert_called_once_with(
            "SELECT name, value, description FROM meta_settings WHERE name LIKE 'Plugin::%';",
            None,
        )

        assert isinstance(result, dict)
        assert result == {}

    def test_gets_plugins_settings_when_plugins_exist(self) -> None:
        """Test get existing plug-ins settings."""
        mock_cursor = MagicMock()
        mock_cursor.fetchall.return_value = [
            ("Plugin::Compression::MemoryBudget", "55555", "..."),
            ("Plugin::Something::SomeSetting", "true", "this should show up"),
        ]
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        expected = {
            "Compression": [
                {"name": "MemoryBudget", "value": "55555", "description": "..."}
            ],
            "Something": [
                {
                    "name": "SomeSetting",
                    "value": "true",
                    "description": "this should show up",
                }
            ],
        }

        result = _get_plugin_setting(mock_connection_factory)

        assert isinstance(result, dict)
        assert result == expected

    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_gets_plugin_settings_when_database_throws_exception(
        self, exceptions
    ) -> None:
        """Test gets plugin settings when database throws exception."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        result = _get_plugin_setting(mock_connection_factory)

        assert result is None

    @patch("hyrisecockpit.database_manager.job.get_detailed_plugins._get_plugins")
    @patch(
        "hyrisecockpit.database_manager.job.get_detailed_plugins._get_plugin_setting"
    )
    def test_get_plugins_if_plugins_is_none(
        self, mock_get_plugin_setting: MagicMock, mock_get_plugins: MagicMock
    ) -> None:
        """Test get detailed plug-ins if plugins in none.

        We test if get_detailed_plugins returns None, if _get_plugins returns None.
        This can happen if there is an Error in _get_plugins with the hyrise connection.
        """
        mock_connection_factory = MagicMock()
        mock_get_plugins.return_value = None
        result = get_detailed_plugins(mock_connection_factory)

        assert result is None

    @patch("hyrisecockpit.database_manager.job.get_detailed_plugins._get_plugins")
    @patch(
        "hyrisecockpit.database_manager.job.get_detailed_plugins._get_plugin_setting"
    )
    def test_get_plugins_if_settings_is_none(
        self, mock_get_plugin_setting: MagicMock, mock_get_plugins: MagicMock
    ) -> None:
        """Test get detailed plug-ins if settings in none.

        We test if get_detailed_plugins returns None, if _get_plugin_settings returns None.
        This can happen if there is an Error in _get_plugin_settings with the hyrise connection.
        """
        mock_connection_factory = MagicMock()
        mock_get_plugin_setting.return_value = None
        result = get_detailed_plugins(mock_connection_factory)

        assert result is None

    @patch("hyrisecockpit.database_manager.job.get_detailed_plugins._get_plugins")
    @patch(
        "hyrisecockpit.database_manager.job.get_detailed_plugins._get_plugin_setting"
    )
    def test_get_plugins(
        self, mock_get_plugin_setting: MagicMock, mock_get_plugins: MagicMock
    ) -> None:
        """Test get detailed plug-ins."""
        plugin_settins = {
            "compression": [
                {
                    "name": "compression_rate",
                    "value": "10",
                    "description": "rate of compression",
                }
            ],
            "pre-compile": [
                {
                    "name": "compile_limit",
                    "value": "5",
                    "description": "max compile time",
                }
            ],
        }
        plugins = ["compression", "vector-compression"]
        mock_connection_factory = MagicMock()
        mock_get_plugin_setting.return_value = plugin_settins
        mock_get_plugins.return_value = plugins
        expected = {
            "compression": [
                {
                    "name": "compression_rate",
                    "value": "10",
                    "description": "rate of compression",
                }
            ],
            "vector-compression": [],
        }
        result = get_detailed_plugins(mock_connection_factory)

        assert result == expected

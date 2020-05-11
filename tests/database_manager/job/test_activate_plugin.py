"""Tests for the activate plug-in job."""

from typing import Tuple
from unittest.mock import patch

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.activate_plugin import activate_plugin


class TestActivatePluginJob:
    """Tests for the TestActivatePluginJob."""

    @patch(
        "hyrisecockpit.database_manager.job.activate_plugin.AsIs",
        lambda plugin: f"AsIs({plugin})",
    )
    def test_execute_plugin_activating_query_job(self) -> None:
        """Test successfully executes plugin activating query."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        activate_plugin(mock_connection_factory, "plugin")

        expected_query: str = "INSERT INTO meta_plugins(name) VALUES ('/usr/local/hyrise/lib/lib%sPlugin.so');"
        expected_parameter: Tuple[str] = ("AsIs(plugin)",)

        mock_cursor.execute.assert_called_once_with(expected_query, expected_parameter)

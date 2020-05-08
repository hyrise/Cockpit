"""Tests for the deactivate plug-in job."""

from typing import Tuple
from unittest.mock import patch

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.deactivate_plugin import deactivate_plugin


class TestDeactivatePluginJob:
    """Tests for the TestActivatePluginJob."""

    @patch(
        "hyrisecockpit.database_manager.job.deactivate_plugin.AsIs",
        lambda plugin: f"AsIs({plugin})",
    )
    def test_execute_plugin_deactivating_query_job(self) -> None:
        """Test successfully executes plugin deactivating query."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        deactivate_plugin(mock_connection_factory, "plugin")

        expected_query: str = "DELETE FROM meta_plugins WHERE name='%sPlugin';"
        expected_parameter: Tuple[str] = ("AsIs(plugin)",)

        mock_cursor.execute.assert_called_once_with(expected_query, expected_parameter)

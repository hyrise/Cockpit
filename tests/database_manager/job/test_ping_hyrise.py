"""Tests for the ping hyrise job."""

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.ping_hyrise import ping_hyrise


class TestPingHyriseJob:
    """Tests for the BackgroundJobManager class."""

    def test_pings_hyrise_if_hyrise_alive(self) -> None:
        """Test handling of valid connection."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        mock_hyrise_active_value = MagicMock()

        ping_hyrise(mock_connection_factory, mock_hyrise_active_value)

        mock_cursor.execute.assert_called_once_with("SELECT 1;", None)
        assert mock_hyrise_active_value.value

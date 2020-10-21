from unittest.mock import patch
from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_memory_footprint import (
    update_memory_footprint,
    _get_memory_footprint,
)


class TestUpdateMemoryFootprint:
    @patch(
        "hyrisecockpit.database_manager.job.update_memory_footprint.time_ns", lambda: 42
    )
    def test_gets_memory_footprint(self) -> None:
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        memory_footprint = 98709271.0
        mock_cursor.fetchone.return_value = (memory_footprint,)
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        expected = (42, memory_footprint)

        res = _get_memory_footprint(mock_connection_factory)

        assert res == expected

    @patch(
        "hyrisecockpit.database_manager.job.update_memory_footprint.time_ns", lambda: 42
    )
    def test_gets_empty_memory_footprint(self) -> None:
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        # If there are no segments the response would be (None,)
        memory_footprint = None
        mock_cursor.fetchone.return_value = (memory_footprint,)
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        expected = (42, 0.0)

        res = _get_memory_footprint(mock_connection_factory)

        assert res == expected

    @patch(
        "hyrisecockpit.database_manager.job.update_memory_footprint._get_memory_footprint"
    )
    def test_updates_memory_footprints(
        self, mock_get_memory_footprint: MagicMock
    ) -> None:
        memory_footprint = 98709271.0
        time_stamp = 42
        mock_get_memory_footprint.return_value = (time_stamp, memory_footprint)
        mock_connection_factory = MagicMock()
        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        update_memory_footprint(
            connection_factory=mock_connection_factory,
            storage_connection_factory=mock_storage_connection_factory,
        )

        mock_cursor.log_meta_information.assert_called_once_with(
            "memory_footprint", {"memory_footprint": memory_footprint}, time_stamp
        )

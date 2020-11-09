"""Tests for the get loaded tables in database job."""

from psycopg2 import DatabaseError, InterfaceError
from pytest import mark

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.get_loaded_tables_in_database import (
    get_loaded_tables_in_database,
)


class TestGetLoadedTabledInDatabase:
    """Tests for the get loaded tables in database job."""

    def test_gets_loaded_tables(self) -> None:
        """Test get loaded tables."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        mock_cursor.fetchall.return_value = [
            (
                "hallo",
                "type",
            ),
            (
                "world",
                "boring",
            ),
        ]

        results = get_loaded_tables_in_database(mock_connection_factory)

        mock_cursor.execute.assert_called_once_with(
            "SELECT table_name from meta_tables;", None
        )
        assert results == ["hallo", "world"]  # type: ignore

    @mark.parametrize(
        "exceptions",
        [DatabaseError(), InterfaceError()],
    )
    def test_gets_loaded_tables_with_exception(self, exceptions) -> None:
        """Test get loaded tables in database with exception."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        results = get_loaded_tables_in_database(mock_connection_factory)

        mock_cursor.execute.assert_called_once_with(
            "SELECT table_name from meta_tables;", None
        )
        assert results == []

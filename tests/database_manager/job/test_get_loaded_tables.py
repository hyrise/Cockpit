"""Tests for the get loaded tables job."""
from typing import List

from psycopg2 import DatabaseError, InterfaceError
from pytest import mark

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.get_loaded_tables import get_loaded_tables


class TestGetLoadedTablesJob:
    """Tests for the get loaded tables job."""

    def test_get_existing_tables(self) -> None:
        """Test gets existing tables."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        fake_tables = ["table_name_one", "table_name_two"]

        mock_cursor.fetchall.return_value = [("table_name_one",)]

        result: List[str] = get_loaded_tables(fake_tables, mock_connection_factory)

        expected: List[str] = ["table_name_one"]

        assert result == expected

    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_get_existing_tables_with_exception_from_database(self, exceptions) -> None:
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

        fake_tables = ["table_name_one", "table_name_two"]

        result: List[str] = get_loaded_tables(
            fake_tables, mock_connection_factory,
        )

        expected: List = []

        assert result == expected

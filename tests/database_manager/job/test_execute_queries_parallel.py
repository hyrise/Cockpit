"""Tests for the execute_queries_parallel job."""
from typing import Tuple
from unittest.mock import patch

from psycopg2 import DatabaseError, InterfaceError
from pytest import mark

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.execute_queries_parallel import (
    _execute_table_query,
    _format_query_parameters,
    execute_queries_parallel,
)


class TestExecuteQueriesParallel:
    """Tests parallel execution of queries."""

    @patch(
        "hyrisecockpit.database_manager.job.execute_queries_parallel.AsIs",
        lambda name: f"AsIs({name})",
    )
    def test_successfully_formats_query_parameters(self) -> None:
        """Test successfully formats query parameters."""
        parameters = (
            ("keep", "as_is",),
            ("hyriseDown", None,),
            ("keep", None,),
        )
        received = _format_query_parameters(parameters)
        assert received == ("AsIs(keep)", "hyriseDown", "keep")

    def test_doesnt_format_no_parameters(self) -> None:
        """Test doesn't format when there are no parameters."""
        assert _format_query_parameters(None) is None

    @patch(
        "hyrisecockpit.database_manager.job.execute_queries_parallel._format_query_parameters"
    )
    def test_successfully_executes_table_query(
        self, mock_format_query_parameters: MagicMock
    ) -> None:
        """Test successfully executes table queries."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        mock_format_query_parameters.return_value = (
            "keep",
            "hyriseDown",
            "keep",
        )

        query_tuple: Tuple[str, Tuple[str, str, str]] = (
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )

        _execute_table_query(query_tuple, mock_connection_factory)

        mock_cursor.execute.assert_called_once_with(
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )

    @patch(
        "hyrisecockpit.database_manager.job.execute_queries_parallel._format_query_parameters"
    )
    @mark.parametrize(
        "exceptions", [DatabaseError(), InterfaceError()],
    )
    def test_successfully_executes_table_query_with_exception_from_database(
        self, mock_format_query_parameters: MagicMock, exceptions
    ) -> None:
        """Test executes table queries with exception from database."""

        def raise_exception(*args):
            """Throw exception."""
            raise exceptions

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        mock_format_query_parameters.return_value = (
            "keep",
            "hyriseDown",
            "keep",
        )

        query_tuple: Tuple[str, Tuple[str, str, str]] = (
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )

        _execute_table_query(query_tuple, mock_connection_factory)

        mock_cursor.execute.assert_called_once_with(
            "COPY %s FROM '/usr/local/hyrise/cached_tables/%s/%s.bin';",
            ("keep", "hyriseDown", "keep",),
        )

    @patch("hyrisecockpit.database_manager.job.execute_queries_parallel.Process")
    @patch(
        "hyrisecockpit.database_manager.job.execute_queries_parallel._execute_table_query"
    )
    def test_execute_queries_parallel(
        self, mock_execute_table_query: MagicMock, mock_process_constructor: MagicMock
    ) -> None:
        """Test start processes for table loading queries in parallel."""
        mock_process: MagicMock = MagicMock()
        mock_process_constructor.return_value = mock_process
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        queries = [
            "Why does dragons like the sun? Because they are scared of (k)nights."
        ]

        execute_queries_parallel(queries, mock_connection_factory)

        mock_process_constructor.assert_called_once_with(
            target=mock_execute_table_query,
            args=(
                "Why does dragons like the sun? Because they are scared of (k)nights.",
                mock_connection_factory,
            ),
        )
        mock_process.start.assert_called_once()
        mock_process.join.assert_called_once()
        mock_process.terminate.assert_called_once()

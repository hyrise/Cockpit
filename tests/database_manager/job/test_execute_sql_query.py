"""Tests for the execute sql query job."""
from multiprocessing import Value

from psycopg2 import Error

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.execute_sql_query import execute_sql_query


class TestExecuteSqlQueryJob:
    """Class to test execute SQL query job."""

    def test_executes_sql_query(self) -> None:
        """Test execute SQL query."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database_blocked = Value("b", 0)

        database_id = "Identification?"
        mock_cursor.fetchall.return_value = [
            (
                "I'm planning to make a film series on databases",
                "I've got the first part ready, but I can't think of a SQL.",
                None,
                42,
            )
        ]
        mock_cursor.fetch_column_names.return_value = ["bad", "joke"]

        expected = {
            "id": "Identification?",
            "successful": True,
            "results": [
                [
                    "I'm planning to make a film series on databases",
                    "I've got the first part ready, but I can't think of a SQL.",
                    "None",
                    "42",
                ]
            ],
            "col_names": ["bad", "joke"],
            "error_message": "",
        }

        result = execute_sql_query(
            "SELECT funny FROM not_funny",
            mock_connection_factory,
            database_blocked,
            database_id,
        )

        assert expected == result

    def test_executes_sql_query_with_throwing_exception(self) -> None:
        """Test execute sql query with throwing exception."""

        def raise_exception(*args) -> Exception:
            """Throw exception."""
            raise Error

        mock_cursor = MagicMock()
        mock_cursor.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database_blocked = Value("b", 0)

        database_id = "Identification?"
        mock_cursor.execute.side_effect = raise_exception

        expected = {
            "id": "Identification?",
            "successful": False,
            "results": [],
            "col_names": [],
            "error_message": "",
        }

        result = execute_sql_query(
            "SELECT funny FROM not_funny",
            mock_connection_factory,
            database_blocked,
            database_id,
        )

        assert expected == result

    def test_executes_sql_query_while_database_is_blocked(self) -> None:
        """Test execute sql query while database is blocked."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        database_blocked = Value("b", 1)
        database_id = "Identification?"

        result = execute_sql_query(
            "SELECT funny FROM not_funny",
            mock_connection_factory,
            database_blocked,
            database_id,
        )

        assert result is None
        mock_cursor.execute.assert_not_called()

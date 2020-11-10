from psycopg2 import DatabaseError, InterfaceError
from pytest import mark

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.execute_sql import execute_sql


class TestUpdateSegmentConfiguration:
    def test_executes_sql(self) -> None:
        mock_cursor = MagicMock()
        mock_cursor.fetchall.return_value = [("foo",)]
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        sql = "SELECT * FROM foo;"

        result = execute_sql(sql, mock_connection_factory)

        mock_cursor.execute.assert_called_once_with(sql, None)
        assert result == [("foo",)]

    @mark.parametrize(
        "exception",
        [DatabaseError(), InterfaceError()],
    )
    def test_executes_sql_if_database_throws_exception(self, exception) -> None:
        def raise_exception(*args):
            """Throw exception."""
            raise exception

        mock_cursor = MagicMock()
        mock_cursor.execute.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )

        sql = "SELECT * FROM foo;"

        result = execute_sql(sql, mock_connection_factory)

        assert isinstance(result, list)
        assert not result

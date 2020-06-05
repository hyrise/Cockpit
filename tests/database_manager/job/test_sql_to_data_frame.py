"""Tests for the sql to data frame job."""

from multiprocessing import Value

from pandas import DataFrame
from pandas.core.frame import DataFrame as DataframeType
from psycopg2 import DatabaseError, InterfaceError
from pytest import mark

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


class TestSqlToDataframeJob:
    """Tests for the sql to data frame job."""

    def test_converts_sql_to_data_frame_if_database_is_not_blocked(self) -> None:
        """Test read sql query and return dataframe."""
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        fake_database_blocked_value = Value("b", False)

        sql_to_data_frame(
            fake_database_blocked_value, mock_connection_factory, "select ...", None
        )

        mock_cursor.read_sql_query.assert_called_once_with("select ...", None)

    @mark.parametrize(
        "exception", [DatabaseError(), InterfaceError()],
    )
    def test_converts_sql_to_data_frame_if_database_throws_exception(
        self, exception
    ) -> None:
        """Test read sql query in the case that database throws exception."""

        def raise_exception(*args):
            """Throw exception."""
            raise exception

        mock_cursor = MagicMock()
        mock_cursor.read_sql_query.side_effect = raise_exception
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        fake_database_blocked_value = Value("b", False)

        result: DataFrame = sql_to_data_frame(
            fake_database_blocked_value, mock_connection_factory, "select ...", None
        )

        assert isinstance(result, DataframeType)
        assert result.empty

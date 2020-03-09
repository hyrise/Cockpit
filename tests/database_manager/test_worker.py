"""Tests for the worker module."""
from unittest.mock import MagicMock, patch

from psycopg2.extensions import AsIs

from hyrisecockpit.database_manager.worker import execute_task, get_formatted_parameters


class TestWorker:
    """Tests Worker functions."""

    def test_get_formatted_parameters_returns_none(self):
        """Test get_formatted_parameters returns None for not present parameters."""
        assert get_formatted_parameters(None) is None

    def test_get_formatted_parameters_returns_parameters_without_protocol(self):
        """Test get_formatted_parameters returns parameters for not present protocols."""
        not_formatted_parameters = ((1, None), (2, None), (3, None))

        formatted_parameters = get_formatted_parameters(not_formatted_parameters)

        for i in range(len(not_formatted_parameters)):
            assert not_formatted_parameters[i][0] == formatted_parameters[i]

    def test_get_formatted_parameters_returns_parameters_with_asis_protocol(self):
        """Test get_formatted_parameters returns parameters for asis protocol."""
        not_formatted_parameters = ((1, "as_is"), (2, "as_is"), (3, "as_is"))

        formatted_parameters = get_formatted_parameters(not_formatted_parameters)
        for i in range(len(not_formatted_parameters)):
            assert type(formatted_parameters[i]) == AsIs
            assert str(not_formatted_parameters[i][0]) == formatted_parameters[
                i
            ].getquoted().decode("utf-8")

    @patch("hyrisecockpit.database_manager.worker.time_ns",)
    def test_execute_task(self, mocked_time_ns):
        """Test execute_task."""
        mocked_time_ns.return_value = 10
        mocked_query = "SELECT 1;"
        mocked_cursor = MagicMock()
        mocked_cursor.execute.return_value = None
        formatted_parameters = None

        endts, latency = execute_task(mocked_cursor, mocked_query, formatted_parameters)

        mocked_cursor.execute.assert_any_call("SELECT 1;", None)
        assert endts == 10
        assert latency == 0

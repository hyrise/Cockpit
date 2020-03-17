"""Tests for the worker module."""
from typing import Optional, Tuple, Union
from unittest.mock import MagicMock, patch

from psycopg2.extensions import AsIs

from hyrisecockpit.database_manager.worker import execute_task, get_formatted_parameters


class TestWorker:
    """Tests Worker functions."""

    def test_get_formatted_parameters_returns_parameters_without_protocol(self) -> None:
        """Test get_formatted_parameters returns parameters for not present protocols."""
        unformatted_params = ((1, None), (2, None), (3, None))

        formatted_params = get_formatted_parameters(unformatted_params)

        for uf_param, f_param in zip(unformatted_params, formatted_params):
            assert uf_param[0] == f_param

    def test_get_formatted_parameters_returns_parameters_with_asis_protocol(
        self,
    ) -> None:
        """Test get_formatted_parameters returns parameters for asis protocol."""
        unformatted_params: Tuple[Tuple[Union[str, int], Optional[str]], ...] = (
            (1, "as_is"),
            ("2", "as_is"),
            (3, None),
            ("4", None),
        )

        formatted_params = get_formatted_parameters(unformatted_params)
        for uf_param, f_param in zip(unformatted_params, formatted_params):
            if uf_param[1] == "as_is":
                assert type(f_param) == AsIs
                assert str(uf_param[0]) == f_param.getquoted().decode("utf-8")  # type: ignore
            else:
                assert type(f_param) in (str, int)
                assert uf_param[0] == f_param

    @patch("hyrisecockpit.database_manager.worker.time_ns")
    def test_execute_task(self, time_ns):
        """Test execute_task."""
        time_ns.return_value = 10
        mocked_query = "SELECT 1;"
        mocked_cursor = MagicMock()
        mocked_cursor.execute.return_value = None
        formatted_params = None

        endts, latency = execute_task(mocked_cursor, mocked_query, formatted_params)

        mocked_cursor.execute.assert_called_once_with("SELECT 1;", None)
        assert endts == 10
        assert latency == 0

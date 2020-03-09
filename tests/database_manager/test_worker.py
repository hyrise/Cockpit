"""Tests for the worker module."""
from unittest.mock import MagicMock, patch

from psycopg2.extensions import AsIs
from pytest import fixture

from hyrisecockpit.database_manager.worker import (
    execute_task,
    get_formatted_parameters,
    handle_published_data,
)


class TestWorker:
    """Tests Worker functions."""

    @fixture
    def mocked_task_queue(self):
        """Mock task queue."""
        mocked_task_queue = MagicMock()
        mocked_task_queue.put.return_value = None
        return mocked_task_queue

    def test_subsciber_fills_task_queue_when_process_flag_is_unset(
        self, mocked_task_queue
    ):
        """Test filling of the queue."""
        querylist = ["task_1", "task_2", "task_3"]
        mocked_published_data = {"body": {"querylist": querylist}}
        mocked_processing_flag = MagicMock()
        mocked_processing_flag.value = False

        handle_published_data(
            mocked_published_data, mocked_task_queue, mocked_processing_flag
        )

        for task in querylist:
            mocked_task_queue.put.assert_any_call(task)
        assert 3 == mocked_task_queue.put.call_count

    def test_subsciber_dont_fill_task_queue_when_process_flag_is_set(
        self, mocked_task_queue
    ):
        """Test subscriber should not fill task queue when processing flag is set."""
        querylist = ["task_1", "task_2", "task_3"]
        mocked_published_data = {"body": {"querylist": querylist}}

        mocked_processing_flag = MagicMock()
        mocked_processing_flag.value = True

        handle_published_data(
            mocked_published_data, mocked_task_queue, mocked_processing_flag
        )

        mocked_task_queue.put.assert_not_called()

    def test_get_formated_parameters_returns_none(self):
        """Test get_formated_parameters returns None for not present parameters."""
        assert get_formatted_parameters(None) is None

    def test_get_formated_parameters_returns_parameters_without_protocol(self):
        """Test get_formated_parameters returns parameters for not present protocols."""
        not_formated_parameters = ((1, None), (2, None), (3, None))

        formated_parameters = get_formatted_parameters(not_formated_parameters)

        for i in range(len(not_formated_parameters)):
            assert not_formated_parameters[i][0] == formated_parameters[i]

    def test_get_formated_parameters_returns_parameters_with_asis_protocol(self):
        """Test get_formated_parameters returns parameters for asis protocol."""
        not_formated_parameters = ((1, "as_is"), (2, "as_is"), (3, "as_is"))

        formated_parameters = get_formatted_parameters(not_formated_parameters)
        for i in range(len(not_formated_parameters)):
            assert type(formated_parameters[i]) == AsIs
            assert str(not_formated_parameters[i][0]) == formated_parameters[
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

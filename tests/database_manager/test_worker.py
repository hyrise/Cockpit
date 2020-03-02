"""Tests for the worker module."""
from unittest.mock import MagicMock, patch

from psycopg2.extensions import AsIs
from pytest import fixture

from hyrisecockpit.database_manager.worker import (
    execute_task,
    fill_task_queue,
    get_formatted_parameters,
)


class TestWorker:
    """Tests Worker functions."""

    @fixture
    def mocked_sub_socket(self):
        """Mock subscriber socket with pre-defined tasks."""
        querylist = ["task_1", "task_2", "task_3"]
        mocked_sub_socket = MagicMock()
        mocked_sub_socket.recv_json.return_value = {"body": {"querylist": querylist}}
        return mocked_sub_socket

    @fixture
    def mocked_task_queue(self):
        """Mock task queue."""
        mocked_task_queue = MagicMock()
        mocked_task_queue.put.return_value = None
        return mocked_task_queue

    def test_subsciber_fills_task_queue_when_process_flag_is_unset(
        self, mocked_sub_socket, mocked_task_queue
    ):
        """Test filling of the queue."""
        querylist = ["task_1", "task_2", "task_3"]

        mocked_processing_flag = MagicMock()
        mocked_processing_flag.value = False

        fill_task_queue(mocked_sub_socket, mocked_task_queue, mocked_processing_flag)

        for task in querylist:
            mocked_task_queue.put.assert_any_call(task)
        assert 3 == mocked_task_queue.put.call_count

    def test_subsciber_dont_fill_task_queue_when_process_flag_is_set(
        self, mocked_sub_socket, mocked_task_queue
    ):
        """Test subscriber should not fill task queue when processing flag is set."""
        mocked_processing_flag = MagicMock()
        mocked_processing_flag.value = True

        fill_task_queue(mocked_sub_socket, mocked_task_queue, mocked_processing_flag)

        mocked_task_queue.put.assert_not_called()

    def test_get_formated_parameters_returns_none(
        self, mocked_sub_socket, mocked_task_queue
    ):
        """Test get_formated_parameters returns None for not present parameters."""
        assert get_formatted_parameters(None) is None

    def test_get_formated_parameters_returns_parameters_without_protocol(
        self, mocked_sub_socket, mocked_task_queue
    ):
        """Test get_formated_parameters returns parameters for not present protocols."""
        not_formated_parameters = ((1, None), (2, None), (3, None))

        formated_parameters = get_formatted_parameters(not_formated_parameters)
        for i in range(len(not_formated_parameters)):
            assert not_formated_parameters[i][0] == formated_parameters[i]

    def test_get_formated_parameters_returns_parameters_with_asis_protocol(
        self, mocked_sub_socket, mocked_task_queue
    ):
        """Test get_formated_parameters returns parameters for asis protocol."""
        not_formated_parameters = ((1, "as_is"), (2, "as_is"), (3, "as_is"))

        formated_parameters = get_formatted_parameters(not_formated_parameters)
        for i in range(len(not_formated_parameters)):
            assert type(formated_parameters[i]) == AsIs
            assert str(not_formated_parameters[i][0]) == formated_parameters[
                i
            ].getquoted().decode("utf-8")

    @patch("hyrisecockpit.database_manager.worker.time_ns",)
    def test_execute_task(self, mocked_time_ns, mocked_sub_socket, mocked_task_queue):
        """Test execute_task."""
        mocked_time_ns.return_value = 10
        mocked_task = ("SELECT 1;", None, "Benchmark", "query_no")
        mocked_cursor = MagicMock()
        mocked_cursor.execute.return_value = None
        successful_queries = []

        execute_task(mocked_task, mocked_cursor, successful_queries)

        mocked_cursor.execute.assert_any_call("SELECT 1;", None)
        assert successful_queries[0] == (10, 0, "Benchmark", "query_no")

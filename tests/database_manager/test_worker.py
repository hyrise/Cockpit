"""Tests for the database_manager module."""
from unittest.mock import MagicMock

from pytest import fixture

from hyrisecockpit.database_manager.worker import fill_task_queue


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

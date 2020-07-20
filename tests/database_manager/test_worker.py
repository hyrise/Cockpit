"""Tests for the worker module."""
from multiprocessing import Queue
from unittest.mock import MagicMock, patch

from hyrisecockpit.database_manager.worker.queue_worker import (
    fill_queue,
    handle_published_data,
)


class TestQueueWorker:
    """Tests for queue worker."""

    def test_handle_published_date(self) -> None:
        """Test handle of published data."""
        fake_data = {}  # type: ignore
        fake_data["body"] = {}
        fake_data["body"]["querylist"] = ["query a"]
        fake_queue = Queue()  # type: ignore
        handle_published_data(fake_data, fake_queue)
        assert fake_queue.get() == "query a"

    @patch("hyrisecockpit.database_manager.worker.queue_worker.handle_published_data")
    @patch("hyrisecockpit.database_manager.worker.queue_worker.SUB")
    @patch("hyrisecockpit.database_manager.worker.queue_worker.SUBSCRIBE")
    @patch("hyrisecockpit.database_manager.worker.queue_worker.Context")
    def test_fill_queue_worker(
        self, mock_context, mock_subscribe, mock_sub, mock_handle_published_data
    ) -> None:
        """Test of fill queue worker."""

        class LoopDone(Exception):
            pass

        mock_socket = MagicMock()
        mock_socket.recv_json.return_value = ["publish_data"]
        mock_context_obj = MagicMock()
        mock_context_obj.socket.return_value = mock_socket
        mock_context.return_value = mock_context_obj
        workload_publisher_url = "localhost"
        task_queue = []  # type: ignore
        mock_continue_execution_flag = MagicMock()
        mock_worker_wait_for_exit_event = MagicMock()
        mock_continue_execution_flag.value = True
        mock_worker_wait_for_exit_event.wait.side_effect = MagicMock(
            side_effect=LoopDone
        )
        mock_handle_published_data.side_effect = MagicMock(side_effect=LoopDone)

        try:
            fill_queue(
                workload_publisher_url,
                task_queue,  # type: ignore
                mock_continue_execution_flag,
                mock_worker_wait_for_exit_event,
            )
        except LoopDone:
            pass

        mock_worker_wait_for_exit_event.wait.assert_not_called()
        mock_handle_published_data.assert_called_once_with(["publish_data"], task_queue)

    @patch("hyrisecockpit.database_manager.worker.queue_worker.handle_published_data")
    @patch("hyrisecockpit.database_manager.worker.queue_worker.SUB")
    @patch("hyrisecockpit.database_manager.worker.queue_worker.SUBSCRIBE")
    @patch("hyrisecockpit.database_manager.worker.queue_worker.Context")
    def test_fill_queue_worker_with_unset_continue_execution_flag(
        self, mock_context, mock_subscribe, mock_sub, mock_handle_published_data
    ) -> None:
        """Test of fill queue worker with unset continue execution flag."""

        class LoopDone(Exception):
            pass

        mock_socket = MagicMock()
        mock_socket.recv_json.return_value = ["publish_data"]
        mock_context_obj = MagicMock()
        mock_context_obj.socket.return_value = mock_socket
        mock_context.return_value = mock_context_obj
        workload_publisher_url = "localhost"
        task_queue = []  # type: ignore
        mock_continue_execution_flag = MagicMock()
        mock_worker_wait_for_exit_event = MagicMock()
        mock_continue_execution_flag.value = False
        mock_worker_wait_for_exit_event.wait.side_effect = MagicMock(
            side_effect=LoopDone
        )
        mock_handle_published_data.side_effect = MagicMock(side_effect=LoopDone)

        try:
            fill_queue(
                workload_publisher_url,
                task_queue,  # type: ignore
                mock_continue_execution_flag,
                mock_worker_wait_for_exit_event,
            )
        except LoopDone:
            pass

        mock_worker_wait_for_exit_event.wait.assert_called_once()
        mock_handle_published_data.assert_not_called()

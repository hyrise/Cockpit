"""Tests for the worker module."""
from multiprocessing import Queue
from unittest.mock import MagicMock, patch

from psycopg2 import DatabaseError, InterfaceError, ProgrammingError
from pytest import mark

from hyrisecockpit.database_manager.worker.queue_worker import (
    fill_queue,
    handle_published_data,
)
from hyrisecockpit.database_manager.worker.task_worker import (
    execute_queries,
    log_results,
)


class OverloadTime:
    """Overload int."""

    def __init__(self, val):
        """Initialize a OverloadTime."""
        self.val = val

    def __sub__(self, other):
        """Overload subtraction."""
        return self.val + other

    def __int__(self):
        """Overload int."""
        return self.val

    def __lt__(self, other):
        """Overload comparison."""
        if int(other) < int(self.val):
            return False
        else:
            return True


class LoopDone(Exception):
    """LoopDone Exception."""

    pass


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


class TestTaskWorker:
    """Tests for task worker."""

    def test_log_of_results(self) -> None:
        """Test log of results."""
        mock_storage_curser = MagicMock()
        succesful_queries = [
            (10, 5, "tpch", 1.0, "01", "worker_01", True),
            (10, 5, "tpch", 1.0, "02", "worker_02", True),
        ]
        failed_queries = [(10, "worker_03", "select ...", "Error")]
        log_results(mock_storage_curser, succesful_queries, failed_queries)
        mock_storage_curser.log_queries.assert_called_once_with(succesful_queries)
        mock_storage_curser.log_failed_queries.assert_called_once_with(failed_queries)
        assert not succesful_queries
        assert not failed_queries

    @patch("hyrisecockpit.database_manager.worker.task_worker.StorageCursor")
    @patch("hyrisecockpit.database_manager.worker.task_worker.log_results")
    def test_execute_queries_with_unset_continue_execution_flag(
        self, mock_log_results: MagicMock, mock_storage_cursor: MagicMock
    ) -> None:
        """Test execute queries if continues execution flag is not set."""
        mock_pool_curser = MagicMock()
        mock_storage_log = MagicMock()
        mock_storage_cursor.return_value.__enter__.return_value = mock_storage_log
        mock_i_am_done_event = MagicMock()
        mock_continue_execution_flag = MagicMock()
        mock_worker_wait_for_exit_event = MagicMock()
        mock_continue_execution_flag.value = False
        mock_worker_wait_for_exit_event.wait.side_effect = MagicMock(
            side_effect=LoopDone
        )
        mock_workload_driver = MagicMock()
        mock_workload_driver.execute_task.side_effect = MagicMock(side_effect=LoopDone)
        workload_drivers = {"tpch": mock_workload_driver}
        fake_queue = Queue()  # type: ignore
        try:
            execute_queries(
                "01",
                fake_queue,
                mock_pool_curser,
                mock_continue_execution_flag,
                "database_id",
                mock_i_am_done_event,
                mock_worker_wait_for_exit_event,
                workload_drivers,
            )
        except LoopDone:
            pass

        mock_i_am_done_event.set.assert_called_once()
        mock_worker_wait_for_exit_event.wait.assert_called_once()

    @patch("hyrisecockpit.database_manager.worker.task_worker.StorageCursor")
    @patch("hyrisecockpit.database_manager.worker.task_worker.log_results")
    @patch("hyrisecockpit.database_manager.worker.task_worker.time_ns")
    def test_execute_queries(
        self,
        mock_time_ns: MagicMock,
        mock_log_results: MagicMock,
        mock_storage_cursor: MagicMock,
    ) -> None:
        """Test execute queries if continues execution flag is not set."""
        mock_time_ns.return_value = OverloadTime(0)  # type: ignore
        worker_id = "worker_id"
        database_id = "database_id"
        mock_pool_curser = MagicMock()
        mock_storage_log = MagicMock()
        mock_storage_cursor.return_value.__enter__.return_value = mock_storage_log
        mock_i_am_done_event = MagicMock()
        mock_continue_execution_flag = MagicMock()
        mock_worker_wait_for_exit_event = MagicMock()
        mock_continue_execution_flag.value = True
        mock_worker_wait_for_exit_event.wait.side_effect = MagicMock(
            side_effect=LoopDone
        )
        mock_workload_driver = MagicMock()
        mock_workload_driver.execute_task.return_value = (1, 1, 1.0, "01")
        mock_log_results.side_effect = MagicMock(side_effect=LoopDone)
        task = {"benchmark": "tpch"}
        workload_drivers = {"tpch": mock_workload_driver}
        fake_queue = Queue()  # type: ignore
        fake_queue.put(task)
        excepted_successful_queries = [(1, 1, "tpch", 1.0, "01", "worker_id", True)]
        try:
            execute_queries(
                worker_id,
                fake_queue,
                mock_pool_curser,
                mock_continue_execution_flag,
                database_id,
                mock_i_am_done_event,
                mock_worker_wait_for_exit_event,
                workload_drivers,
            )
        except LoopDone:
            pass

        mock_workload_driver.execute_task.assert_called_once_with(
            task, mock_pool_curser, worker_id
        )
        mock_log_results.assert_called_once_with(
            mock_storage_log, excepted_successful_queries, []
        )

    @mark.parametrize(
        "exception", [DatabaseError(), InterfaceError()],
    )
    @patch("hyrisecockpit.database_manager.worker.task_worker.StorageCursor")
    @patch("hyrisecockpit.database_manager.worker.task_worker.log_results")
    @patch("hyrisecockpit.database_manager.worker.task_worker.time_ns")
    def test_execute_task_if_database_error_occurs(
        self,
        mock_time_ns: MagicMock,
        mock_log_results: MagicMock,
        mock_storage_cursor: MagicMock,
        exception,
    ) -> None:
        """Test execute task if database error occurs."""

        def raise_exception(*args) -> Exception:
            """Throw exception."""
            raise exception

        mock_time_ns.return_value = OverloadTime(0)  # type: ignore
        worker_id = "worker_id"
        database_id = "database_id"
        mock_pool_curser = MagicMock()
        mock_pool_curser._connection.set_session.side_effect = MagicMock(
            side_effect=LoopDone
        )
        mock_storage_log = MagicMock()
        mock_storage_cursor.return_value.__enter__.return_value = mock_storage_log
        mock_i_am_done_event = MagicMock()
        mock_continue_execution_flag = MagicMock()
        mock_worker_wait_for_exit_event = MagicMock()
        mock_continue_execution_flag.value = True
        mock_worker_wait_for_exit_event.wait.side_effect = MagicMock(
            side_effect=LoopDone
        )
        mock_workload_driver = MagicMock()
        mock_workload_driver.execute_task.side_effect = raise_exception
        mock_log_results.side_effect = MagicMock(side_effect=LoopDone)
        task = {"benchmark": "tpch"}
        workload_drivers = {"tpch": mock_workload_driver}
        fake_queue = Queue()  # type: ignore
        fake_queue.put(task)
        try:
            execute_queries(
                worker_id,
                fake_queue,
                mock_pool_curser,
                mock_continue_execution_flag,
                database_id,
                mock_i_am_done_event,
                mock_worker_wait_for_exit_event,
                workload_drivers,
            )
        except LoopDone:
            pass

        mock_pool_curser._connection.rollback.assert_called_once()
        mock_pool_curser._connection.set_session.assert_called_once_with(
            autocommit=True
        )

        mock_workload_driver.execute_task.assert_called_once_with(
            task, mock_pool_curser, worker_id
        )
        mock_log_results.assert_not_called()

    @mark.parametrize(
        "exception", [ProgrammingError(), ValueError()],
    )
    @patch("hyrisecockpit.database_manager.worker.task_worker.StorageCursor")
    @patch("hyrisecockpit.database_manager.worker.task_worker.log_results")
    @patch("hyrisecockpit.database_manager.worker.task_worker.time_ns")
    def test_execute_task_if_programming_error_occurs(
        self,
        mock_time_ns: MagicMock,
        mock_log_results: MagicMock,
        mock_storage_cursor: MagicMock,
        exception,
    ) -> None:
        """Test execute task if database error occurs."""

        def raise_exception(*args) -> Exception:
            """Throw exception."""
            raise exception

        mock_time_ns.return_value = OverloadTime(0)  # type: ignore
        worker_id = "worker_id"
        database_id = "database_id"
        mock_pool_curser = MagicMock()
        mock_pool_curser._connection.set_session.side_effect = MagicMock(
            side_effect=LoopDone
        )
        mock_storage_log = MagicMock()
        mock_storage_cursor.return_value.__enter__.return_value = mock_storage_log
        mock_i_am_done_event = MagicMock()
        mock_continue_execution_flag = MagicMock()
        mock_worker_wait_for_exit_event = MagicMock()
        mock_continue_execution_flag.value = True
        mock_worker_wait_for_exit_event.wait.side_effect = MagicMock(
            side_effect=LoopDone
        )
        mock_workload_driver = MagicMock()
        mock_workload_driver.execute_task.side_effect = raise_exception
        mock_log_results.side_effect = MagicMock(side_effect=LoopDone)
        task = {"benchmark": "tpch"}
        workload_drivers = {"tpch": mock_workload_driver}
        fake_queue = Queue()  # type: ignore
        fake_queue.put(task)
        try:
            execute_queries(
                worker_id,
                fake_queue,
                mock_pool_curser,
                mock_continue_execution_flag,
                database_id,
                mock_i_am_done_event,
                mock_worker_wait_for_exit_event,
                workload_drivers,
            )
        except LoopDone:
            pass
        mock_workload_driver.execute_task.assert_called_once_with(
            task, mock_pool_curser, worker_id
        )
        mock_log_results.assert_called_once()

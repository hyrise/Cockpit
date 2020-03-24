"""Tests for the worker_pool module."""
from multiprocessing import Event, Value
from multiprocessing.context import Process as ProcessType
from multiprocessing.queues import Queue as QueueType
from multiprocessing.sharedctypes import Synchronized as ValueType
from multiprocessing.synchronize import Event as EventType
from unittest.mock import MagicMock, patch

from pytest import fixture, mark

from hyrisecockpit.database_manager.worker_pool import WorkerPool


class TestWorkerPool(object):
    """Tests for the WorkerPool class."""

    def get_fake_background_scheduler() -> MagicMock:  # type: ignore
        """Return mocked background scheduler."""
        m = MagicMock()
        m.start.side_effect = None
        return m

    def get_database_blocked_value(self) -> Value:
        """Return Value for blocked status."""
        return Value("b", False)

    def get_number_worker(self) -> int:
        """Return number of workers."""
        return 42

    def get_database_id(self) -> str:
        """Return database id."""
        return "Proformance"

    def get_workload_publisher_url(self) -> str:
        """Return workload publisher URL."""
        return "Lother_du_altes_haus"

    def get_fake_dummy_execute_queries_worker(
        i,  # noqa
        task_queue,
        connection_pool,
        failed_task_queue,
        continue_execution_flag,
        database_id,
        execute_task_worker_done_event,
        worker_continue_event,
    ) -> str:
        """Return a dummy execute task worker."""
        return "foo"

    def get_fake_dummy_fill_worker(
        workload_publisher_url,  # noqa
        task_queue,
        continue_execution_flag,
        worker_continue_event,
    ) -> str:
        """Return a dummy fill worker."""
        return "foo"

    @fixture
    @patch(
        "hyrisecockpit.database_manager.worker_pool.BackgroundScheduler",
        get_fake_background_scheduler,
    )
    @patch(
        "hyrisecockpit.database_manager.worker_pool.execute_queries",
        get_fake_dummy_execute_queries_worker,
    )
    @patch(
        "hyrisecockpit.database_manager.worker_pool.execute_queries",
        get_fake_dummy_fill_worker,
    )
    def worker_pool(self) -> WorkerPool:
        """Get a new WorkerPool."""
        return WorkerPool(
            connection_pool=None,
            number_worker=self.get_number_worker(),
            database_id=self.get_database_id(),
            workload_publisher_url=self.get_workload_publisher_url(),
            database_blocked=self.get_database_blocked_value(),
        )

    def test_inintialize_worker_pool(self, worker_pool) -> None:
        """Test initialization of worker pool attributes."""
        assert worker_pool._connection_pool is None
        assert worker_pool._number_worker == self.get_number_worker()
        assert worker_pool._database_id == self.get_database_id()
        assert type(worker_pool._database_blocked) is ValueType
        assert worker_pool._workload_publisher_url == self.get_workload_publisher_url()
        assert worker_pool._status == "closed"
        assert type(worker_pool._continue_execution_flag) is ValueType
        assert worker_pool._continue_execution_flag.value
        assert type(worker_pool._execute_task_workers) is list
        assert len(worker_pool._execute_task_workers) == 0
        assert worker_pool._fill_task_worker is None
        assert type(worker_pool._worker_wait_for_exit_event) is EventType
        assert type(worker_pool._task_queue) is QueueType

    def test_generation_of_execute_task_worker_done_events(self, worker_pool) -> None:
        """Check if enough events of type events are generated."""
        events = worker_pool._generate_execute_task_worker_done_events()
        assert len(events) == self.get_number_worker()
        assert all(type(event) is EventType for event in events)

    @patch(
        "hyrisecockpit.database_manager.worker_pool.execute_queries",
        get_fake_dummy_execute_queries_worker,
    )
    def test_generation_of_execute_task_worker(self, worker_pool) -> None:
        """Check if enough processes of type process are generated."""
        worker_pool._execute_task_worker_done_event = [
            "foo" for _ in range(self.get_number_worker())
        ]
        processes = worker_pool._generate_execute_task_worker()
        assert len(processes) == self.get_number_worker()
        assert all(type(process) is ProcessType for process in processes)

    @patch(
        "hyrisecockpit.database_manager.worker_pool.execute_queries",
        get_fake_dummy_fill_worker,
    )
    def test_generation_of_fill_task_worker(self, worker_pool) -> None:
        """Check if enough processes of type process are generated."""
        process = worker_pool._generate_fill_task_worker()
        assert type(process) is ProcessType

    def test_inintialization_of_worker(self, worker_pool) -> None:
        """Check if nothing get changed while both types of worker exists."""
        expected_event = ["new_event"]
        expected_event_execute_workers = ["new_worker_one", "new_worker_two"]
        expected_fill_task_worker = "new_fill_worker"

        worker_pool._generate_execute_task_worker_done_events = lambda: expected_event
        worker_pool._generate_execute_task_worker = (
            lambda: expected_event_execute_workers
        )
        worker_pool._generate_fill_task_worker = lambda: expected_fill_task_worker

        worker_pool._init_workers()

        event = worker_pool._execute_task_worker_done_event
        execute_workers = worker_pool._execute_task_workers
        fill_worker = worker_pool._fill_task_worker

        assert event[:] == expected_event[:]
        assert execute_workers[:] == expected_event_execute_workers[:]
        assert fill_worker == expected_fill_task_worker

    def test_termination_of_worker(self, worker_pool) -> None:
        """Check if pool is closed."""
        worker_pool._fill_task_worker = MagicMock()
        worker_pool._execute_task_workers = [
            MagicMock() for _ in range(self.get_number_worker())
        ]
        worker_pool._terminate_worker()

        assert worker_pool._fill_task_worker is None
        assert type(worker_pool._execute_task_workers) is list
        assert len(worker_pool._execute_task_workers) == 0
        assert type(worker_pool._worker_wait_for_exit_event) is EventType
        assert type(worker_pool._task_queue) is QueueType

    @mark.timeout(10)
    def test_waiting_for_workers(self, worker_pool) -> None:
        """Test waiting for event."""
        events = [Event() for _ in range(self.get_number_worker())]
        for event in events:
            event.set()

        worker_pool._execute_task_worker_done_event = events
        worker_pool._wait_for_worker()

        assert not worker_pool._worker_wait_for_exit_event.is_set()
        assert not worker_pool._continue_execution_flag.value

    def test_starting_worker(self, worker_pool) -> None:
        """Test start of worker."""
        worker_pool._continue_execution_flag.value = False
        mocked_fill_worker_process = MagicMock()
        mocked_fill_worker_process.start.return_value = None
        mocked_processes = []
        for _ in range(self.get_number_worker()):
            mocked_execute_task_worker_process = MagicMock()
            mocked_execute_task_worker_process.start.return_value = None
            mocked_processes.append(mocked_execute_task_worker_process)

        worker_pool._execute_task_workers = mocked_processes
        worker_pool._fill_task_worker = mocked_fill_worker_process

        worker_pool._start_worker()

        mocked_fill_worker_process.start.assert_called_once()
        for mocked_execute_task_process in mocked_processes:
            mocked_execute_task_process.start.assert_called_once()

        assert worker_pool._continue_execution_flag.value

    def test_starting_worker_job_if_workerpool_is_closed(self, worker_pool) -> None:
        """Test start job if the worker pool is closed."""
        worker_pool._status = "closed"
        init_workers_mock = MagicMock()
        start_worker_mock = MagicMock()

        worker_pool._init_workers = init_workers_mock
        worker_pool._start_worker = start_worker_mock

        worker_pool._start_job()

        init_workers_mock.assert_called_once()
        start_worker_mock.assert_called_once()
        assert worker_pool._worker_wait_for_exit_event.is_set()
        assert not worker_pool._database_blocked.value
        assert worker_pool._status == "running"

    def test_starting_worker_job_if_workerpool_is_running(self, worker_pool) -> None:
        """Test start job if the worker pool is running."""
        worker_pool._status = "running"
        init_workers_mock = MagicMock()
        start_worker_mock = MagicMock()

        worker_pool._init_workers = init_workers_mock
        worker_pool._start_worker = start_worker_mock

        worker_pool._start_job()

        init_workers_mock.assert_not_called()
        start_worker_mock.assert_not_called()
        assert not worker_pool._worker_wait_for_exit_event.is_set()
        assert not worker_pool._database_blocked.value
        assert worker_pool._status == "running"

    def test_closing_worker_job_if_workerpool_is_running(self, worker_pool) -> None:
        """Test close job if the worker pool is running."""
        worker_pool._status = "running"
        wait_for_worker_mock = MagicMock()
        terminate_worker_mock = MagicMock()

        worker_pool._wait_for_worker = wait_for_worker_mock
        worker_pool._terminate_worker = terminate_worker_mock

        worker_pool._close_job()

        wait_for_worker_mock.assert_called_once()
        terminate_worker_mock.assert_called_once()
        assert worker_pool._status == "closed"
        assert not worker_pool._database_blocked.value

    def test_closing_worker_job_if_workerpool_is_not_running(self, worker_pool) -> None:
        """Test close job if the worker pool is running."""
        worker_pool._status = "closed"
        wait_for_worker_mock = MagicMock()
        terminate_worker_mock = MagicMock()

        worker_pool._wait_for_worker = wait_for_worker_mock
        worker_pool._terminate_worker = terminate_worker_mock

        worker_pool._close_job()

        wait_for_worker_mock.assert_not_called()
        terminate_worker_mock.assert_not_called()
        assert worker_pool._status == "closed"
        assert not worker_pool._database_blocked.value

    def test_starting_of_start_job_while_databse_is_not_blocked(
        self, worker_pool
    ) -> None:
        """Test starting of start job if database is not blocked."""
        scheduler_mock = MagicMock()
        scheduler_mock.add_job.return_value = None
        worker_pool._scheduler = scheduler_mock
        worker_pool._start_job = "start_job_function"
        worker_pool._database_blocked.value = False

        result = worker_pool.start()

        assert result
        assert worker_pool._database_blocked.value
        scheduler_mock.add_job.assert_called_once_with(func="start_job_function")

    def test_starting_of_start_job_while_databse_is_blocked(self, worker_pool) -> None:
        """Test not starting of start job if database is blocked."""
        scheduler_mock = MagicMock()
        scheduler_mock.add_job.return_value = None
        worker_pool._scheduler = scheduler_mock
        worker_pool._start_job = "start_job_function"
        worker_pool._database_blocked.value = True

        result = worker_pool.start()

        assert not result
        assert worker_pool._database_blocked.value
        scheduler_mock.add_job.assert_not_called()

    def test_starting_of_close_job_while_databse_is_not_blocked(
        self, worker_pool
    ) -> None:
        """Test starting of closed job if database is not blocked."""
        scheduler_mock = MagicMock()
        scheduler_mock.add_job.return_value = None
        worker_pool._scheduler = scheduler_mock
        worker_pool._close_job = "close_job_function"
        worker_pool._database_blocked.value = False

        result = worker_pool.close()

        assert result
        assert worker_pool._database_blocked.value
        scheduler_mock.add_job.assert_called_once_with(func="close_job_function")

    def test_starting_of_close_job_while_databse_is_blocked(self, worker_pool) -> None:
        """Test not starting of closed job if database is blocked."""
        scheduler_mock = MagicMock()
        scheduler_mock.add_job.return_value = None
        worker_pool._scheduler = scheduler_mock
        worker_pool._close_job = "close_job_function"
        worker_pool._database_blocked.value = True

        result = worker_pool.close()

        assert not result
        assert worker_pool._database_blocked.value
        scheduler_mock.add_job.assert_not_called()

    def test_termination_of_worker_if_database_is_not_blocked_and_workerpool_is_running(
        self, worker_pool
    ) -> None:
        """Test termination of worker pool with no database block and running pool."""
        worker_pool._database_blocked.value = False
        worker_pool._status = "running"
        terminate_worker_mock = MagicMock()
        task_queue_mock = MagicMock()
        task_queue_mock.close.return_value = None

        worker_pool._terminate_worker = terminate_worker_mock
        worker_pool._task_queue = task_queue_mock

        result = worker_pool.terminate()

        assert result
        terminate_worker_mock.assert_called_once()
        task_queue_mock.close.assert_called_once()
        assert worker_pool._status == "closed"
        assert not worker_pool._database_blocked.value

    def test_termination_of_worker_if_database_is_blocked_and_workerpool_is_running(
        self, worker_pool
    ) -> None:
        """Test termination of worker pool with database block and running pool."""
        worker_pool._database_blocked.value = True
        worker_pool._status = "running"

        assert not worker_pool.terminate()

    def test_termination_of_worker_if_database_is_not_blocked_and_workerpool_is_closed(
        self, worker_pool
    ) -> None:
        """Test termination of worker pool with  no database block and closed pool."""
        worker_pool._database_blocked.value = False
        worker_pool._status = "closed"

        assert not worker_pool.terminate()

    def test_termination_of_worker_if_database_is_blocked_and_workerpool_is_closed(
        self, worker_pool
    ) -> None:
        """Test termination of worker pool with  database block and closed pool."""
        worker_pool._database_blocked.value = True
        worker_pool._status = "closed"

        assert not worker_pool.terminate()

    def test_get_status_while_workerpool_is_running(self, worker_pool) -> None:
        """Test get status while worker pool is running."""
        worker_pool._status = "running"
        assert worker_pool.get_status() == "running"

    def test_get_status_while_workerpool_is_closed(self, worker_pool) -> None:
        """Test get status while worker pool is closed."""
        worker_pool._status = "closed"
        assert worker_pool.get_status() == "closed"

    def test_gets_queue_length(self, worker_pool) -> None:
        """Test return of queue length."""
        mocked_task_queue = MagicMock()
        mocked_task_queue.qsize.return_value = 42
        worker_pool._task_queue = mocked_task_queue

        result = worker_pool.get_queue_length()

        assert type(result) is int
        assert result == 42

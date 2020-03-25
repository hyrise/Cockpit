"""Tests for the worker_pool module."""
from collections import Counter
from multiprocessing import Event, Process, Queue, Value
from multiprocessing.context import Process as ProcessType
from multiprocessing.queues import Queue as QueueType
from multiprocessing.sharedctypes import Synchronized as ValueType
from multiprocessing.synchronize import Event as EventType
from typing import List, Optional
from unittest.mock import MagicMock, patch

from psycopg2 import pool
from pytest import fixture, mark

from hyrisecockpit.database_manager.worker_pool import WorkerPool

database_blocked_value: Value = Value("b", False)
number_worker: int = 42
database_id: str = "Proformance"
workload_publisher_url: str = "Lother_du_altes_haus"


def get_fake_background_scheduler() -> MagicMock:
    """Return mocked background scheduler."""
    mocked_background_scheduler: MagicMock = MagicMock()
    mocked_background_scheduler.start.side_effect = None
    return mocked_background_scheduler


def get_fake_dummy_execute_queries_worker(
    i: str,
    task_queue: Queue,
    connection_pool: pool,
    continue_execution_flag: Value,
    database_id: str,
    execute_task_worker_done_event: EventType,
    worker_continue_event: EventType,
) -> str:
    """Return a dummy execute task worker."""
    return "foo"


def get_fake_dummy_fill_worker(
    workload_publisher_url: str,
    task_queue: Queue,
    continue_execution_flag: Value,
    worker_continue_event: EventType,
) -> str:
    """Return a dummy fill worker."""
    return "foo"


class TestWorkerPool(object):
    """Tests for the WorkerPool class."""

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
            number_worker=number_worker,
            database_id=database_id,
            workload_publisher_url=workload_publisher_url,
            database_blocked=database_blocked_value,
        )

    def test_initializes_worker_pool(self, worker_pool: WorkerPool) -> None:
        """Test initialization of worker pool attributes."""
        assert worker_pool._connection_pool is None
        assert worker_pool._number_worker == number_worker
        assert worker_pool._database_id == database_id
        assert type(worker_pool._database_blocked) is ValueType
        assert worker_pool._workload_publisher_url == workload_publisher_url
        assert worker_pool._status == "closed"
        assert type(worker_pool._continue_execution_flag) is ValueType
        assert worker_pool._continue_execution_flag.value
        assert type(worker_pool._execute_task_workers) is list
        assert len(worker_pool._execute_task_workers) == 0
        assert worker_pool._fill_task_worker is None
        assert type(worker_pool._worker_wait_for_exit_event) is EventType
        assert type(worker_pool._task_queue) is QueueType

    def test_generation_of_execute_task_worker_done_events(
        self, worker_pool: WorkerPool
    ) -> None:
        """Check if enough events of type events are generated."""
        events: List[
            EventType
        ] = worker_pool._generate_execute_task_worker_done_events()
        assert len(events) == number_worker
        assert all(type(event) is EventType for event in events)

    @patch(
        "hyrisecockpit.database_manager.worker_pool.execute_queries",
        get_fake_dummy_execute_queries_worker,
    )
    def test_generats_execute_task_worker(self, worker_pool: WorkerPool) -> None:
        """Check if enough processes of type process are generated."""
        worker_pool._execute_task_worker_done_event = [
            "foo" for _ in range(number_worker)  # type: ignore
        ]
        processes: List[Process] = worker_pool._generate_execute_task_worker()
        assert len(processes) == number_worker
        assert all(type(process) is ProcessType for process in processes)

    @patch(
        "hyrisecockpit.database_manager.worker_pool.execute_queries",
        get_fake_dummy_fill_worker,
    )
    def test_generats_fill_task_worker(self, worker_pool: WorkerPool) -> None:
        """Check if enough processes of type process are generated."""
        process: Process = worker_pool._generate_fill_task_worker()
        assert type(process) is ProcessType

    def test_initializes_worker(self, worker_pool: WorkerPool) -> None:
        """Check if nothing get changed while both types of worker exists."""
        expected_event: List[str] = ["new_event"]
        expected_event_execute_workers: List[str] = ["new_worker_one", "new_worker_two"]
        expected_fill_task_worker: str = "new_fill_worker"

        worker_pool._generate_execute_task_worker_done_events = lambda: expected_event  # type: ignore
        worker_pool._generate_execute_task_worker = (  # type: ignore
            lambda: expected_event_execute_workers  # type: ignore
        )
        worker_pool._generate_fill_task_worker = lambda: expected_fill_task_worker  # type: ignore

        worker_pool._init_workers()

        event: List[EventType] = worker_pool._execute_task_worker_done_event
        execute_workers: List[Process] = worker_pool._execute_task_workers
        fill_worker: Optional[Process] = worker_pool._fill_task_worker

        assert Counter(event) == Counter(expected_event)  # type: ignore
        assert Counter(execute_workers) == Counter(expected_event_execute_workers)  # type: ignore
        assert fill_worker == expected_fill_task_worker  # type: ignore

    def test_terminates_worker(self, worker_pool: WorkerPool) -> None:
        """Check if pool is closed."""
        worker_pool._fill_task_worker = MagicMock()
        worker_pool._execute_task_workers = [MagicMock() for _ in range(number_worker)]
        worker_pool._terminate_worker()

        assert worker_pool._fill_task_worker is None
        assert type(worker_pool._execute_task_workers) is list
        assert len(worker_pool._execute_task_workers) == 0
        assert type(worker_pool._worker_wait_for_exit_event) is EventType
        assert type(worker_pool._task_queue) is QueueType

    @mark.timeout(10)
    def test_waits_for_workers(self, worker_pool: WorkerPool) -> None:
        """Test waiting for event."""
        events: List[EventType] = [Event() for _ in range(number_worker)]
        for event in events:
            event.set()

        worker_pool._execute_task_worker_done_event = events
        worker_pool._wait_for_worker()

        assert not worker_pool._worker_wait_for_exit_event.is_set()
        assert not worker_pool._continue_execution_flag.value

    def test_starts_worker(self, worker_pool: WorkerPool) -> None:
        """Test start of worker."""
        worker_pool._continue_execution_flag.value = False
        mocked_fill_worker_process: MagicMock = MagicMock()
        mocked_fill_worker_process.start.return_value = None
        mocked_processes: MagicMock = []
        for _ in range(number_worker):
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

    def test_starts_worker_job_if_workerpool_is_closed(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test start job if the worker pool is closed."""
        worker_pool._status = "closed"
        init_workers_mock: MagicMock = MagicMock()
        start_worker_mock: MagicMock = MagicMock()

        worker_pool._init_workers = init_workers_mock  # type: ignore
        worker_pool._start_worker = start_worker_mock  # type: ignore

        worker_pool._start_job()

        init_workers_mock.assert_called_once()
        start_worker_mock.assert_called_once()
        assert worker_pool._worker_wait_for_exit_event.is_set()
        assert not worker_pool._database_blocked.value
        assert worker_pool._status == "running"

    def test_starts_worker_job_if_workerpool_is_running(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test start job if the worker pool is running."""
        worker_pool._status = "running"
        init_workers_mock: MagicMock = MagicMock()
        start_worker_mock: MagicMock = MagicMock()

        worker_pool._init_workers = init_workers_mock  # type: ignore
        worker_pool._start_worker = start_worker_mock  # type: ignore

        worker_pool._start_job()

        init_workers_mock.assert_not_called()
        start_worker_mock.assert_not_called()
        assert not worker_pool._worker_wait_for_exit_event.is_set()
        assert not worker_pool._database_blocked.value
        assert worker_pool._status == "running"

    def test_closes_worker_job_if_workerpool_is_running(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test close job if the worker pool is running."""
        worker_pool._status = "running"
        wait_for_worker_mock: MagicMock = MagicMock()
        terminate_worker_mock: MagicMock = MagicMock()

        worker_pool._wait_for_worker = wait_for_worker_mock  # type: ignore
        worker_pool._terminate_worker = terminate_worker_mock  # type: ignore

        worker_pool._close_job()

        wait_for_worker_mock.assert_called_once()
        terminate_worker_mock.assert_called_once()
        assert worker_pool._status == "closed"
        assert not worker_pool._database_blocked.value

    def test_closes_worker_job_if_workerpool_is_not_running(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test close job if the worker pool is running."""
        worker_pool._status = "closed"
        wait_for_worker_mock: MagicMock = MagicMock()
        terminate_worker_mock: MagicMock = MagicMock()

        worker_pool._wait_for_worker = wait_for_worker_mock  # type: ignore
        worker_pool._terminate_worker = terminate_worker_mock  # type: ignore

        worker_pool._close_job()

        wait_for_worker_mock.assert_not_called()
        terminate_worker_mock.assert_not_called()
        assert worker_pool._status == "closed"
        assert not worker_pool._database_blocked.value

    def test_starts_start_job_while_databse_is_not_blocked(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test starting of start job if database is not blocked."""
        scheduler_mock: MagicMock = MagicMock()
        scheduler_mock.add_job.return_value = None
        worker_pool._scheduler = scheduler_mock
        worker_pool._start_job = "start_job_function"  # type: ignore
        worker_pool._database_blocked.value = False

        result: bool = worker_pool.start()

        assert result
        assert worker_pool._database_blocked.value
        scheduler_mock.add_job.assert_called_once_with(func="start_job_function")

    def test_starts_start_job_while_databse_is_blocked(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test not starting of start job if database is blocked."""
        scheduler_mock: MagicMock = MagicMock()
        scheduler_mock.add_job.return_value = None
        worker_pool._scheduler = scheduler_mock
        worker_pool._start_job = "start_job_function"  # type: ignore
        worker_pool._database_blocked.value = True

        result: bool = worker_pool.start()

        assert not result
        assert worker_pool._database_blocked.value
        scheduler_mock.add_job.assert_not_called()

    def test_starts_close_job_while_databse_is_not_blocked(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test starting of closed job if database is not blocked."""
        scheduler_mock: MagicMock = MagicMock()
        scheduler_mock.add_job.return_value = None
        worker_pool._scheduler = scheduler_mock
        worker_pool._close_job = "close_job_function"  # type: ignore
        worker_pool._database_blocked.value = False

        result: bool = worker_pool.close()

        assert result
        assert worker_pool._database_blocked.value
        scheduler_mock.add_job.assert_called_once_with(func="close_job_function")

    def test_starts_close_job_while_databse_is_blocked(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test not starting of closed job if database is blocked."""
        scheduler_mock: MagicMock = MagicMock()
        scheduler_mock.add_job.return_value = None
        worker_pool._scheduler = scheduler_mock
        worker_pool._close_job = "close_job_function"  # type: ignore
        worker_pool._database_blocked.value = True

        result: bool = worker_pool.close()

        assert not result
        assert worker_pool._database_blocked.value
        scheduler_mock.add_job.assert_not_called()

    def test_terminates_worker_if_database_is_not_blocked_and_workerpool_is_running(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test termination of worker pool with no database block and running pool."""
        worker_pool._database_blocked.value = False
        worker_pool._status = "running"
        terminate_worker_mock: MagicMock = MagicMock()
        task_queue_mock: MagicMock = MagicMock()
        task_queue_mock.close.return_value = None

        worker_pool._terminate_worker = terminate_worker_mock  # type: ignore
        worker_pool._task_queue = task_queue_mock

        result: bool = worker_pool.terminate()

        assert result
        terminate_worker_mock.assert_called_once()
        task_queue_mock.close.assert_called_once()
        assert worker_pool._status == "closed"
        assert not worker_pool._database_blocked.value

    def test_terminates_worker_if_database_is_blocked_and_workerpool_is_running(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test termination of worker pool with database block and running pool."""
        worker_pool._database_blocked.value = True
        worker_pool._status = "running"

        assert not worker_pool.terminate()

    def test_terminates_worker_if_database_is_not_blocked_and_workerpool_is_closed(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test termination of worker pool with  no database block and closed pool."""
        worker_pool._database_blocked.value = False
        worker_pool._status = "closed"

        assert not worker_pool.terminate()

    def test_terminates_worker_if_database_is_blocked_and_workerpool_is_closed(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test termination of worker pool with  database block and closed pool."""
        worker_pool._database_blocked.value = True
        worker_pool._status = "closed"

        assert not worker_pool.terminate()

    def test_gets_status_while_workerpool_is_running(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test get status while worker pool is running."""
        worker_pool._status = "running"
        assert worker_pool.get_status() == "running"

    def test_gets_status_while_workerpool_is_closed(
        self, worker_pool: WorkerPool
    ) -> None:
        """Test get status while worker pool is closed."""
        worker_pool._status = "closed"
        assert worker_pool.get_status() == "closed"

    def test_gets_queue_length(self, worker_pool: WorkerPool) -> None:
        """Test return of queue length."""
        mocked_task_queue: MagicMock = MagicMock()
        mocked_task_queue.qsize.return_value = 42
        worker_pool._task_queue = mocked_task_queue

        result: int = worker_pool.get_queue_length()

        assert type(result) is int
        assert result == 42

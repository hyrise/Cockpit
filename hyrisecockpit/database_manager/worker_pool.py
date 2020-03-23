"""The WorkerPool object represents the workers."""
from multiprocessing import Event, Process, Queue, Value
from multiprocessing.synchronize import Event as EventType
from typing import Dict, List, Optional

from apscheduler.schedulers.background import BackgroundScheduler
from psycopg2 import pool

from .worker import execute_queries, fill_queue


class WorkerPool:
    """Represents WorkerPool."""

    def __init__(
        self,
        connection_pool: pool,
        number_worker: int,
        database_id: str,
        workload_publisher_url: str,
        database_blocked: Value,
    ) -> None:
        """Initialize WorkerPool object."""
        self._connection_pool: pool = connection_pool
        self._number_worker: int = number_worker
        self._database_id: str = database_id
        self._database_blocked: Value = database_blocked
        self._workload_publisher_url: str = workload_publisher_url
        self._status: str = "closed"
        self._continue_execution_flag: Value = Value("b", True)
        self._execute_task_workers: List[Process] = []
        self._execute_task_worker_done_event: List[EventType] = []
        self._fill_task_worker: Optional[Process] = None
        self._worker_continue_event: EventType = Event()
        self._task_queue: Queue = Queue(0)
        self._failed_task_queue: Queue = Queue(0)
        self._scheduler: BackgroundScheduler = BackgroundScheduler()
        self._scheduler.start()

    def _generate_execute_task_worker_done_events(self) -> List[EventType]:
        return [Event() for _ in range(self._number_worker)]

    def _generate_execute_task_worker(self) -> List[Process]:
        return [
            Process(
                target=execute_queries,
                args=(
                    i,
                    self._task_queue,
                    self._connection_pool,
                    self._failed_task_queue,
                    self._continue_execution_flag,
                    self._database_id,
                    self._execute_task_worker_done_event[i],
                    self._worker_continue_event,
                ),
            )
            for i in range(self._number_worker)
        ]

    def _generate_fill_task_worker(self) -> Process:
        return Process(
            target=fill_queue,
            args=(
                self._workload_publisher_url,
                self._task_queue,
                self._continue_execution_flag,
                self._worker_continue_event,
            ),
        )

    def _init_workers(self) -> None:
        if len(self._execute_task_workers) == 0:
            self._execute_task_worker_done_event = (
                self._generate_execute_task_worker_done_events()
            )
            self._execute_task_workers = self._generate_execute_task_worker()
        if not self._fill_task_worker:
            self._fill_task_worker = self._generate_fill_task_worker()

    def _terminate_worker(self) -> None:
        if not self._status == "closed":
            assert self._fill_task_worker is not None  # nosec
            self._fill_task_worker.terminate()
            self._fill_task_worker = None
            for i in range(self._number_worker):
                self._execute_task_workers[i].terminate()
            self._execute_task_workers = []
            self._worker_continue_event = Event()
            self._task_queue = Queue(0)
            self._failed_task_queue = Queue(0)
            self._status = "closed"

    def _wait_for_worker(self) -> None:
        self._worker_continue_event.clear()
        self._continue_execution_flag.value = False
        for i in range(self._number_worker):
            self._execute_task_worker_done_event[i].wait()

    def _start_worker(self) -> None:
        assert self._fill_task_worker is not None  # nosec
        self._continue_execution_flag.value = True
        self._fill_task_worker.start()
        for i in range(self._number_worker):
            self._execute_task_workers[i].start()

    def _start_job(self) -> None:
        if self._status == "closed":
            self._worker_continue_event.set()
            self._init_workers()
            self._start_worker()
            self._status = "running"
        elif self._status == "stopped":
            self._continue_execution_flag.value = True
            self._worker_continue_event.set()
            self._status = "running"
        self._database_blocked.value = False

    def _stop_job(self) -> None:
        if self._status == "running":
            self._wait_for_worker()
            self._status = "stopped"
        self._database_blocked.value = False

    def _close_job(self) -> None:
        if self._status == "stopped":
            self._terminate_worker()
        elif self._status == "running":
            self._wait_for_worker()
            self._terminate_worker()
        self._status == "closed"
        self._database_blocked.value = False

    def start(self) -> bool:
        """Start worker."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._scheduler.add_job(func=self._start_job)
            return True
        else:
            return False

    def stop(self) -> bool:
        """Stop worker."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._scheduler.add_job(func=self._stop_job)
            return True
        else:
            return False

    def close(self) -> bool:
        """Close worker."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._scheduler.add_job(func=self._close_job)
            return True
        else:
            return False

    def terminate(self) -> bool:
        """Terminates worker."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._terminate_worker()
            self._task_queue.close()
            self._failed_task_queue.close()
            self._status == "closed"
            self._database_blocked.value = False
            return True
        else:
            return False

    def get_status(self) -> str:
        """Return status of pool."""
        return self._status

    def get_queue_length(self) -> int:
        """Return queue length."""
        return self._task_queue.qsize()

    def get_failed_tasks(self) -> List[Dict[str, str]]:
        """Return failed tasks."""
        failed_task = []
        while not self._failed_task_queue.empty():
            failed_task.append(self._failed_task_queue.get())
        return failed_task

"""The WorkerPool object represents the workers."""
from multiprocessing import Event, Process, Queue, Value

from apscheduler.schedulers.background import BackgroundScheduler

from .worker import execute_queries, fill_queue


class WorkerPool(object):
    """Represents WorkerPool."""

    def __init__(
        self,
        connection_pool,
        number_worker,
        database_id,
        workload_publisher_url,
        database_blocked,
    ):
        """Initialize WorkerPool object."""
        self._connection_pool = connection_pool
        self._number_worker = number_worker
        self._database_id = database_id
        self._database_blocked = database_blocked
        self._workload_publisher_url = workload_publisher_url
        self._status = "closed"
        self._continue_execution_flag = Value("b", True)
        self._execute_task_workers = []
        self._execute_task_worker_done_event = []
        self._fill_task_worker = None
        self._worker_continue_event = Event()
        self._task_queue: Queue = Queue(0)
        self._failed_task_queue: Queue = Queue(0)
        self._scheduler = BackgroundScheduler()
        self._scheduler.start()

    def _generate_execute_task_worker_done_events(self):
        worker_done_event = []
        for _ in range(self._number_worker):
            worker_done_event.append(Event())
        return worker_done_event

    def _generate_execute_task_worker(self):
        workers = []
        for i in range(self._number_worker):
            p = Process(
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
            workers.append(p)
        return workers

    def _generate_fill_task_worker(self):
        fill_task_worker = Process(
            target=fill_queue,
            args=(
                self._workload_publisher_url,
                self._task_queue,
                self._continue_execution_flag,
                self._worker_continue_event,
            ),
        )
        return fill_task_worker

    def _init_workers(self):
        if len(self._execute_task_workers) == 0:
            self._execute_task_worker_done_event = (
                self._generate_execute_task_worker_done_events()
            )
            self._execute_task_workers = self._generate_execute_task_worker()
        if not self._fill_task_worker:
            self._fill_task_worker = self._generate_fill_task_worker()

    def _terminate_worker(self):
        self._fill_task_worker.terminate()
        self._fill_task_worker = None
        for i in range(self._number_worker):
            self._execute_task_workers[i].terminate()
        self._execute_task_workers = []
        self._worker_continue_event = Event()
        self._task_queue: Queue = Queue(0)
        self._failed_task_queue: Queue = Queue(0)

    def _wait_for_execute_task_worker(self):
        self._worker_continue_event.clear()
        self._continue_execution_flag.value = False
        for i in range(self._number_worker):
            self._execute_task_worker_done_event[i].wait()

    def _wait_for_all_worker(self):
        self._worker_continue_event.clear()
        self._continue_execution_flag.value = False
        for i in range(self._number_worker):
            self._execute_task_worker_done_event[i].wait()

    def _start_worker(self):
        self._continue_execution_flag.value = True
        self._fill_task_worker.start()
        for i in range(self._number_worker):
            self._execute_task_workers[i].start()

    def _start_job(self):
        self._database_blocked.value = True
        if self._status == "closed":
            self._init_workers()
            self._start_worker()
            self._status = "running"
        elif self._status == "stopped":
            self._continue_execution_flag.value = True
            self._worker_continue_event.set()
            self._status = "running"
        self._database_blocked.value = False

    def _stop_job(self):
        self._database_blocked.value = True
        self._wait_for_worker()
        self._database_blocked.value = False

    def _close_job(self):
        self._database_blocked.value = True
        if self._status == "stopped":
            self._terminate_worker()
        else:
            self._wait_for_execute_task_worker()
            self._terminate_worker()
            self._status == "closed"
        self._database_blocked.value = False

    def start(self) -> bool:
        """Start worker."""
        if not self._database_blocked.value:
            self._scheduler.add_job(func=self._start_job)
            return True
        else:
            return False

    def stop(self) -> bool:
        """Stop worker."""
        if not self._database_blocked.value:
            self._scheduler.add_job(func=self._stop_job)
            return True
        else:
            return False

    def close(self) -> bool:
        """Close worker."""
        if not self._database_blocked.value:
            self._scheduler.add_job(func=self._close_job)
            return True
        else:
            return False

    def terminate(self):
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

    def get_status(self):
        """Return status of pool."""
        return self._status

    def get_queue_length(self):
        """Return queue length."""
        return self._task_queue.qsize()

    def get_failed_tasks(self):
        """Return failed tasks."""
        failed_task = []
        while not self._failed_task_queue.empty():
            failed_task.append(self._failed_task_queue.get())
        return failed_task

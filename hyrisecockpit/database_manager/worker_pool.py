"""The WorkerPool object represents the workers."""
from multiprocessing import Event, Process, Queue, Value

from .worker import execute_queries, fill_queue


class WorkerPool(object):
    """Represents WorkerPool."""

    def __init__(
        self, connection_pool, number_worker, database_id, workload_publisher_url
    ):
        """Initialize WorkerPool object."""
        self._connection_pool = connection_pool
        self._number_worker = number_worker
        self._database_id = database_id
        self._workload_publisher_url = workload_publisher_url
        self._status = "closed"
        self._continue_execution_flag = Value("b", True)
        self._execute_task_workers = []
        self._execute_task_worker_done_event = []
        self._fill_task_worker = None
        self._fill_task_worker_done_event = None
        self._worker_continue_event = Event()
        self._task_queue: Queue = Queue(0)
        self._failed_task_queue: Queue = Queue(0)

    def _generate_execute_task_worker_done_events(self):
        worker_done_event = []
        for _ in range(self.number_workers):
            worker_done_event.append(Event())
        return worker_done_event

    def _generate_execute_task_worker(self):
        workers = []
        for i in range(self.number_workers):
            p = Process(
                target=execute_queries,
                args=(
                    i,
                    self._task_queue,
                    self._connection_pool,
                    self._failed_task_queue,
                    self._continue_execution_flag,
                    self._database_id,
                    self._worker_wait_event,
                    self._execute_task_worker_done_event[i],
                ),
            )
            workers.append(p)
        return workers

    def _generate_fill_task_worker(self):
        subscriber_process = Process(
            target=fill_queue,
            args=(
                self.workload_publisher_url,
                self._task_queue,
                self._fill_task_worker_done_event,
            ),
        )
        return subscriber_process

    def _init_workers(self):
        if len(self._execute_task_workers) == 0:
            self._execute_task_worker_done_event = (
                self._generate_execute_task_worker_done_events()
            )
            self._execute_task_workers = self._generate_execute_task_worker()
        if not self._fill_task_worker:
            self._fill_task_worker_done_event = Event()
            self._fill_task_worker = self._generate_fill_task_worker()

    def _terminate_worker(self):
        self._fill_task_worker.terminate()
        self._fill_task_worker = None
        for i in range(self._number_worker):
            self._execute_task_workers[i].terminate()
        self._execute_task_workers = []
        self._fill_task_worker_done_event = []
        self._worker_continue_event = Event()
        self._task_queue: Queue = Queue(0)
        self._failed_task_queue: Queue = Queue(0)

    def _wait_for_worker(self):
        self._worker_continue_event.clear()
        self._continue_execution_flag.value = False
        self._fill_task_worker_done_event.wait()
        for i in range(self._number_worker):
            self._fill_task_worker_done_event[i].wait()

    def _start_worker(self):
        self._continue_execution_flag.value = True
        self._fill_task_worker.start()
        for i in range(self._number_worker):
            self._execute_task_workers[i].start()

    def start(self):
        """Start worker."""
        if self._status == "closed":
            self._init_workers()
            self._start_worker()
            self._status = "running"
        elif self._status == "stopped":
            self._continue_execution_flag.value = True
            self._worker_continue_event.set()
            self._status = "running"

    def stop(self):
        """Stop worker."""
        self._wait_for_worker()

    def close(self):
        """Close worker."""
        if self._status == "stopped":
            self._terminate_worker()
        else:
            self._wait_for_worker()
            self._terminate_worker()
            self._status == "closed"

    def terminate(self):
        """Terminates worker."""
        self._terminate_worker()
        self._task_queue.close()
        self._failed_task_queue.close()
        self._status == "closed"

    def get_status(self):
        """Return status of pool."""
        return self._status

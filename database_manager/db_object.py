"""The database object represents the instanz of a database."""

from multiprocessing import Manager, Process, Queue


def task_execute_querys(
    worker_id, task_queue, throughput_data_container, connection_pool
):
    """Define workers work loop."""
    connection = connection_pool.getconn()
    connection.set_session(autocommit=True)
    cur = connection.cursor()
    while True:
        # If Queue is emty go to sleep
        task = task_queue.get(block=True)
        cur.execute(task)
        throughput_data_container[str(worker_id)] = (
            throughput_data_container[str(worker_id)] + 1
        )


class DbObject(object):
    """Represents database."""

    def __init__(self, number_worker, driver):
        """Initialize the database object."""
        self.number_worker = number_worker
        self._manager = Manager()
        self._task_queue = Queue()
        self._connection_pool = driver.get_connection_pool()
        self._throughput_data_container = self._init_throughput_data_container()
        self._worker_pool = self._init_worler_pool()
        self._start_workers()
        self._lost = 0

    def _init_throughput_data_container(self):
        """Initialize meta data container."""
        throughput_data_container = self._manager.dict()
        for i in range(self.number_worker):
            throughput_data_container[str(i)] = 0
        return throughput_data_container

    def _init_worler_pool(self):
        """Initialize a pool of workers."""
        worker_pool = []
        for i in range(self.number_worker):
            p = Process(
                target=task_execute_querys,
                args=[
                    i,
                    self._task_queue,
                    self._throughput_data_container,
                    self._connection_pool,
                ],
            )
            worker_pool.append(p)
        return worker_pool

    def _start_workers(self):
        """Start all workers in pool."""
        for i in range(len(self._worker_pool)):
            self._worker_pool[i].start()

    def execute_workload(self, workload):
        """Put workload in queue."""
        # Eventuell ist es sinnvoll für jeden Worker eine Queue anzulegen
        # Max size ist ca 30.000
        for i in range(len(workload)):
            if self._task_queue.full():
                self._lost = self._lost + 1
            else:
                self._task_queue.put(workload[i])

    def execute_query(self, query):
        """Put single query in queue."""
        self._task_queue.put(query)

    def get_throughput_data(self):
        """Put meta data from all workers together."""
        throughput_data = 0
        for i in range(self.number_worker):
            throughput_data = throughput_data + self._throughput_data_container[str(i)]
            self._throughput_data_container[str(i)] = 0
        return throughput_data

    def _close_pool(self):
        """Close worker pool."""
        for i in range(len(self._worker_pool)):
            self._worker_pool[i].terminate()
        print("Worker terminatet")

    def _close_connections(self):
        """Close connections."""
        self._connection_pool.closeall()
        print("Pool closed")

    def _close_queue(self):
        """Close queue."""
        self._task_queue.close()
        print("Queue closed")

    def clean_exit(self):
        """Clean exit."""
        print(f"lost {self._lost}")
        self._close_queue()
        self._close_pool()
        self._close_connections()

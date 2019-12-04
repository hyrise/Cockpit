"""Drivers control real databases.

A driver uses analyzers to measure data about a database.
Includes a database object.
"""

from time import time

from apscheduler.schedulers.background import BackgroundScheduler
from rq import Queue
from rq.registry import FinishedJobRegistry

import settings as s


class DatabaseDriver:
    """An abstract driver for a database."""

    def __init__(self, id, user, password, host, port, dbname, redis_connection):
        """Initialize a database driver."""
        self._id = id
        self._metadata = dict(storage=[])
        self._jobs = dict(storage=None)
        self._init_database(user, password, host, port, dbname)
        self._init_queue(redis_connection)
        self._init_measurements()
        self._init_scheduler()

    def _init_database(self, user, password, host, port, dbname):
        self._database = dict(
            user=user, password=password, host=host, port=port, dbname=dbname
        )

    def _init_queue(self, redis_connection):
        self._redis_connection = redis_connection
        self._queue = Queue(name=self._id, connection=self._redis_connection)
        self._finished_job_registry = FinishedJobRegistry(
            connection=self._redis_connection, queue=self._queue,
        )

    def _init_measurements(self):
        self._throughput = []
        self._queue_length = []

    def _init_scheduler(self):
        self._scheduler = BackgroundScheduler()
        self._scheduler.add_job(self._measure_throughput, trigger="interval", seconds=1)
        self._scheduler.add_job(
            self._measure_queue_length, trigger="interval", seconds=1
        )
        self._scheduler.add_job(self._measure_storage, trigger="interval", seconds=5)
        self._scheduler.start()

    def _measure_throughput(self):
        # TODO instead of counting jobs, the job.meta["n_queries"]
        # should be counted, as executemany and executelist are countend
        # as one job.
        now = time()
        throughput = self._finished_job_registry.connection.zremrangebyscore(
            self._finished_job_registry.key, 0, now + s.JOB_RESULT_TTL
        )
        result = (now, throughput)
        self._throughput.append(result)
        return self.throughput

    def _measure_queue_length(self):
        now = time()
        queue_length = self._queue.count
        result = (now, queue_length)
        self._queue_length.append(result)
        return self.queue_length

    def _measure_storage(self):
        return True  # TODO
        now = time()
        job = self._jobs["storage"]
        if job is None:
            self._jobs["storage"] = self._queue.enqueue("task.get_hyrise_storage")
            return
        if job.result is None:
            return
        self._metadata["storage"].append((now, job.result))
        self._jobs["storage"] = None
        return self.storage

    def task_execute(self, query, vars=None):
        """Task to enqueue a query to be executed by a worker."""
        self._queue.enqueue("task.execute", query, vars)

    def task_executemany(self, query, vars_list):
        """Task to enqueue a query with multiple vars to be executed by a worker."""
        self._queue.enqueue("task.executemany", query, vars_list)

    def task_executelist(self, query_list):
        """Task to enqueue a query list to be executed by a worker."""
        self._queue.enqueue("task.executelist", query_list)

    @property
    def throughput(self):
        """Get the most recent throughput value."""
        return self._throughput[-1] if len(self._throughput) > 0 else (0, 0)

    @property
    def queue_length(self):
        """Get the most recent queue_length value."""
        return self._queue_length[-1] if len(self._queue_length) > 0 else (0, 0)

    @property
    def storage(self):
        """Get the most recent storage metadata."""
        return (
            self._metadata["storage"][-1]
            if len(self._metadata["storage"]) > 0
            else (0, 0)
        )

    def __repr__(self):
        """Return identification, most useful information."""
        return f"DatabaseDriver {self._id}: {self._database}"

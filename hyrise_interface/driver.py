"""Drivers control real databases.

A driver uses analyzers to measure data about a database.
Includes a database object.
"""

from abc import ABC, abstractmethod
from time import time

from apscheduler.schedulers.background import BackgroundScheduler
from rq import Queue
from rq.registry import FinishedJobRegistry

from database import HyriseDatabase


class DatabaseDriver(ABC):
    """An abstract driver for a database."""

    def __init__(self, id, user, password, host, port, dbname, redis_connection):
        """Initialize a Hyrise driver with a Hyrise db."""
        self._id = id
        self._init_database(user, password, host, port, dbname)
        self._init_queue(redis_connection)
        self._init_measurements()
        self._init_scheduler()

    @abstractmethod
    def _init_database(self, user, password, host, port, dbname):
        pass

    def _init_queue(self, redis_connection):
        self._redis_connection = redis_connection
        self._queue = Queue(connection=self._redis_connection)
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
        self._scheduler.start()

    def _measure_throughput(self):
        now = time()
        throughput = self._finished_job_registry.connection.zremrangebyscore(
            self._finished_job_registry.key, 0, now + 500
        )
        result = (now, throughput)
        self._throughput.append(result)
        return result

    def _measure_queue_length(self):
        now = time()
        queue_length = self._queue.count
        result = (now, queue_length)
        self._queue_length.append(result)
        return result

    @property
    def throughput(self):
        """Get the 5 most recent throughput values."""
        return self._throughput[-5:]

    @property
    def queue_length(self):
        """Get the 5 most recent queue_length values."""
        return self._queue_length[-5:]

    def __repr__(self):
        """Return identification, most useful information."""
        return f"Hyrise Driver {self._id}: {self._database}"


class HyriseDriver(DatabaseDriver):
    """A concrete Hyrise driver."""

    def _init_database(self, user, password, host, port, dbname):
        self._database = HyriseDatabase(user, password, host, port, dbname)

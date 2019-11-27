"""Module for the HyriseInterface component LoadGenerator.

LoadGenerator submits jobs to a Queue.
"""
from redis import Redis
from rq import Queue

from tasks import execute_raw_query_task, execute_raw_workload_task


class LoadGenerator(object):
    """A QueueUser submitting jobs concerning artificial load generation."""

    def __init__(self):
        """Initialize a QueueUser with a Redis Queue."""
        self.queue = Queue(connection=Redis())

    def execute_raw_query(self, query):
        """Submit a job to execute a SQL query."""
        return self.queue.enqueue(execute_raw_query_task, query)
        # return self.busy_wait(job)

    def execute_raw_workload(self, workload):
        """Submit a job to execute a list of SQL queries forming a workload."""
        return self.queue.enqueue(execute_raw_workload_task, workload)
        # return self.busy_wait(job)

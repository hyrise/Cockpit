"""Module for the HyriseInterface component LoadGenerator.

LoadGenerator submits jobs to a Queue.
"""


from tasks import execute, executemany


class LoadGenerator(object):
    """A QueueUser submitting jobs concerning artificial load generation."""

    def execute(self, queue, db_info, *args, **kwargs):
        """Submit a job to execute a SQL query."""
        return queue.enqueue(execute, db_info, *args, **kwargs)

    def executemany(self, queue, db_info, *args, **kwargs):
        """Submit a job to execute a list of SQL queries forming a workload."""
        return queue.enqueue(executemany, db_info, *args, **kwargs)

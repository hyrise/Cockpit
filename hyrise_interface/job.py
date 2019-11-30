"""A ConnectionJob expects a connection when being performed.

Connection may be accessed in the task to perform.
"""
from rq.job import Job


class ConnectionJob(Job):
    """A job getting a connection when performed."""

    def perform(self, connection, *args, **kwargs):
        """Perform the job with a connection."""
        self.connection = connection
        super().perform(*args, **kwargs)

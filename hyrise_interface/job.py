"""A ConnectionJob expects a connection when being performed.

Connection may be accessed in the task to perform.
"""
from rq.job import Job


class ConnectionJob(Job):
    """A job getting a connection when performed."""

    def perform(self, db_connection, *args, **kwargs):
        """Perform the job with a connection, pass cursor to the task."""
        self.db_connection = db_connection
        with db_connection.cursor() as self.db_connection_cursor:
            super().perform(*args, **kwargs)

"""HyriseJob file."""
from rq.job import Job


class HyriseJob(Job):
    """Custom rq-Job with a connection."""

    def perform(self, connection, *args, **kwargs):
        """Override perform method including getting a connection."""
        self.connection = connection
        super().perform(*args, **kwargs)

    def _execute(self):
        return self.func(self.connection, *self.args, **self.kwargs)

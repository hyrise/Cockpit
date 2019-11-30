from rq.job import Job


class HyriseJob(Job):
    def perform(self, connection, *args, **kwargs):
        self.connection = connection
        super().perform(*args, **kwargs)

    def _execute(self):
        return self.func(self.connection, *self.args, **self.kwargs)

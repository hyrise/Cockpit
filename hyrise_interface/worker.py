"""Workers with a connection to a database.

The connection to a database is established once.
It will be handed to the jobs for improved performance.
"""

from rq.worker import (
    JobTimeoutException,
    StartedJobRegistry,
    Worker,
    as_text,
    blue,
    green,
    pop_connection,
    push_connection,
    sys,
    text_type,
    traceback,
    utcnow,
    yellow,
)


class ConnectionWorker(Worker):
    """A worker with a connection to a database."""

    def __init__(self, database, *args, **kwargs):
        """Inititialze the worker with a connection to a database."""
        self.connection = database.connect()
        super().__init__(*args, **kwargs)

    def __del__(self):
        """Clean up by closing the connection."""
        self.connection.close()
        super().__del__()

    def perform_job(self, job, queue, heartbeat_ttl=None):
        """Perform the actual work of a job."""
        self.prepare_job_execution(job, heartbeat_ttl)
        push_connection(self.connection)

        started_job_registry = StartedJobRegistry(
            job.origin, self.connection, job_class=self.job_class
        )

        try:
            job.started_at = utcnow()
            timeout = job.timeout or self.queue_class.DEFAULT_TIMEOUT
            with self.death_penalty_class(timeout, JobTimeoutException, job_id=job.id):
                rv = job.perform(self.connection)

            job.ended_at = utcnow()

            # Pickle the result in the same try-except block since we need
            # to use the same exc handling when pickling fails
            job._result = rv
            self.handle_job_success(
                job=job, queue=queue, started_job_registry=started_job_registry
            )
        except Exception:
            job.ended_at = utcnow()
            exc_info = sys.exc_info()
            exc_string = self._get_safe_exception_string(
                traceback.format_exception(*exc_info)
            )
            self.handle_job_failure(
                job=job,
                exc_string=exc_string,
                started_job_registry=started_job_registry,
            )
            self.handle_exception(job, *exc_info)
            return False

        finally:
            pop_connection()

        self.log.info("%s: %s (%s)", green(job.origin), blue("Job OK"), job.id)
        if rv is not None:
            log_result = "{0!r}".format(as_text(text_type(rv)))
            self.log.debug("Result: %s", yellow(log_result))

        if self.log_result_lifespan:
            result_ttl = job.get_result_ttl(self.default_result_ttl)
            if result_ttl == 0:
                self.log.info("Result discarded immediately")
            elif result_ttl > 0:
                self.log.info("Result is kept for %s seconds", result_ttl)
            else:
                self.log.info("Result will never expire, clean up result key manually")

        return True

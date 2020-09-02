"""Scheduler module."""
import logging
from threading import Event, Thread
from time import sleep

logging.basicConfig(
    level=logging.INFO,
    format="[%(asctime)s :: %(name)s :: %(levelname)s :: %(message)s]",
)


def run_task(func, args, task_done_event):
    """Execute a function and sends an event when done.

    This function should be executed in an threaded context. It is just
    a wrapper over a function it gets from a parameter to tell the run_job
    thread via an event that the function was executed.

    Args:
        func (function): The function that defines the task.
        args (tuple): arguments for the function.
        task_done_event (event): event to tell the run_job thread
            that the function was executed.
    """
    func(*args)
    task_done_event.set()


def run_job(func, seconds, args, job_stop_event, task_done_event, logger):
    """Run a job.

    A job defines the context in which a task gets executed. A task is
    always the same. The run_job function checks is the task was executed
    via. the task_done_event. If not it will wait the time interval defined by
    seconds again and try to execute the task again. If the scheduler sends the
    event that the job is finished the run job will return false and tells by that
    the job handler that it should exit.
    """
    if job_stop_event.is_set():
        task_done_event.wait()
        return False
    if task_done_event.is_set():
        task_done_event.clear()
        task_thread = Thread(target=run_task, args=(func, args, task_done_event))
        task_thread.start()
    else:
        logger.warning("missed run (last job still running)")
    sleep(seconds)
    return True


def job_handler(func, seconds, args, job_stop_event, signal_exit):
    """Handel the running job.

    This function executes the job so long the job_stop_event is not set.

    Args:
        func (function): The function that defines the task.
        seconds (float): sleep interval between job execution
        args (tuple): arguments for the function.
        job_stop_event (event): event to tell the job to stop
            the execution.
        signal_exit (event): event that the job uses to tell the scheduler
            that the job is finished.
    """
    logger = logging.getLogger(func.__name__)
    logger.setLevel(logging.WARNING)
    task_done_event = Event()
    task_done_event.set()
    running = True
    while running:
        running = run_job(func, seconds, args, job_stop_event, task_done_event, logger)
    signal_exit.set()


class Scheduler:
    """This class manages the continues running jobs."""

    def __init__(self):
        """Initialize the scheduler class."""
        self._jobs = []
        self._stop_event = Event()
        self._running = False

    def add_job(self, func, seconds, args):
        """Add a job to the scheduler.

        Args:
            func (function): The function that defines the task.
            seconds (float): sleep interval between job execution
            args (tuple): arguments for the function.
        """
        signal_exit = Event()
        job_stop_event = Event()
        job_thread = Thread(
            target=job_handler, args=(func, seconds, args, job_stop_event, signal_exit)
        )
        self._jobs.append(
            {
                "job_thread": job_thread,
                "func": func,
                "seconds": seconds,
                "args": args,
                "job_stop_event": job_stop_event,
                "signal_exit": signal_exit,
            }
        )

    def _reset_job(self, job):
        """Reset the job.

        If the scheduler was stopped we need to initialize a new thread
        for the job since in python we can just start a thread once.
        """
        del job["job_thread"]
        job["job_thread"] = Thread(
            target=job_handler,
            args=(
                job["func"],
                job["seconds"],
                job["args"],
                job["job_stop_event"],
                job["signal_exit"],
            ),
        )

    def run(self):
        """Will start all jobs and clear the flags."""
        if not self._running:
            for job in self._jobs:
                job["job_stop_event"].clear()
                job["signal_exit"].clear()
                job["job_thread"].start()
            self._running = True

    def stop(self):
        """Will stop all jobs.

        The scheduler setting the job_stop_event so that the jobs get notified to
        stop the execution of the tasks. Then the scheduler will check if the signal_exit
        event is set. That way we can stop the jobs gracefully.
        """
        if self._running:
            for job in self._jobs:
                job["job_stop_event"].set()
                job["signal_exit"].wait()
                job["job_thread"].join()
                self._reset_job(job)
            self._running = False

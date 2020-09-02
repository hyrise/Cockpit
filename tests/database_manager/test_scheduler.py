# noqa
# type: ignore
# flake8: noqa
"""Tests for the scheduler module"""
from threading import Event
from unittest.mock import patch

from pytest import fixture

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.scheduler import (
    Scheduler,
    job_handler,
    run_job,
    run_task,
)


class TestScheduler:
    """Test for the Scheduler class, job and task functions."""

    @fixture
    def scheduler(self) -> Scheduler:
        """Create scheduler object."""
        return Scheduler()

    def test_executes_task(self) -> None:
        """Test execute run_task function.
        
        In this test we check if the function defined by the argument func
        will get executed with the arguments (args). We also check if the
        task_done_event is set.
        """
        mock_func = MagicMock()
        args = ("hallo", "world")
        task_done_event = Event()
        task_done_event.clear()

        run_task(mock_func, args, task_done_event)

        mock_func.assert_called_once_with("hallo", "world")
        assert task_done_event.is_set()

    @patch("hyrisecockpit.database_manager.scheduler.sleep")
    @patch("hyrisecockpit.database_manager.scheduler.Thread")
    def test_runs_job_with_stop_event(self, mock_thread, mock_sleep) -> None:
        """Test executes run_job function.
        
        In this test we will check that the function will return false if
        the job_stop_event is set. We also check that the mocked Thread constructor
        wasn't called since we don't want to run a task if the job_stop_event is set.
        """
        mock_logger = MagicMock()
        mock_func = MagicMock()
        args = ("hallo", "world")
        seconds = 0.1
        task_done_event = Event()
        task_done_event.set()
        job_stop_event = Event()
        job_stop_event.set()

        result = run_job(
            mock_func, seconds, args, job_stop_event, task_done_event, mock_logger
        )

        mock_thread.assert_not_called()
        mock_sleep.assert_not_called()
        assert not result

    @patch("hyrisecockpit.database_manager.scheduler.sleep")
    @patch("hyrisecockpit.database_manager.scheduler.Thread")
    def test_runs_job_with_task_done_event(self, mock_thread, mock_sleep) -> None:
        """Test executes run_job function.
        
        In this test we will check that the function will start a new task in a thread
        if the task_done_event is set.
        """
        mock_logger = MagicMock()
        mock_func = MagicMock()
        args = ("hallo", "world")
        seconds = 0.1
        task_done_event = Event()
        task_done_event.set()
        job_stop_event = Event()
        job_stop_event.clear()
        mock_task_thread = MagicMock()
        mock_thread.return_value = mock_task_thread

        result = run_job(
            mock_func, seconds, args, job_stop_event, task_done_event, mock_logger
        )

        mock_thread.assert_called_once_with(
            target=run_task, args=(mock_func, args, task_done_event)
        )
        mock_sleep.assert_called_once_with(seconds)
        mock_task_thread.start.assert_called_once()
        assert not task_done_event.is_set()
        assert result

    @patch("hyrisecockpit.database_manager.scheduler.run_job")
    def test_job_handler(self, mock_run_job) -> None:
        """Test the job handler function."""
        mock_func = MagicMock()
        mock_func.__name__ = "function"
        args = ("hallo", "world")
        seconds = 0.1
        signal_exit = Event()
        job_stop_event = Event()
        mock_run_job.return_value = False

        job_handler(mock_func, seconds, args, job_stop_event, signal_exit)

        assert signal_exit.is_set()

    def test_initializes_scheduler(self) -> None:
        """Test the initialization of the scheduler object."""
        scheduler = Scheduler()

        assert scheduler._jobs == []
        assert not scheduler._stop_event.is_set()
        assert not scheduler._running

    @patch("hyrisecockpit.database_manager.scheduler.Event")
    @patch("hyrisecockpit.database_manager.scheduler.Thread")
    def test_adds_job(self, mock_thread, mock_event, scheduler) -> None:
        """Test the adding of a job."""
        mock_func = MagicMock()
        mock_thread_obj = MagicMock()
        mock_thread.return_value = mock_thread_obj
        mock_event_obj = MagicMock()
        mock_event.return_value = mock_event_obj
        args = ("hallo", "world")
        seconds = 0.1
        expected_jobs = {
            "job_thread": mock_thread_obj,
            "func": mock_func,
            "seconds": seconds,
            "args": args,
            "job_stop_event": mock_event_obj,
            "signal_exit": mock_event_obj,
        }

        scheduler.add_job(mock_func, seconds, args)

        mock_thread.assert_called_once_with(
            target=job_handler,
            args=(mock_func, seconds, args, mock_event_obj, mock_event_obj),
        )
        assert scheduler._jobs == [expected_jobs]

    @patch("hyrisecockpit.database_manager.scheduler.Thread")
    def test_reset_job(self, mock_thread, scheduler) -> None:
        """Test the reset of a job."""
        mock_thread_obj = MagicMock()
        mock_thread.return_value = mock_thread_obj
        job = {
            "job_thread": "mock_thread_obj",
            "func": "func",
            "seconds": 0.1,
            "args": ("a", "b"),
            "job_stop_event": "mock_event_obj",
            "signal_exit": "mock_event_obj",
        }
        expected = {
            "job_thread": mock_thread_obj,
            "func": "func",
            "seconds": 0.1,
            "args": ("a", "b"),
            "job_stop_event": "mock_event_obj",
            "signal_exit": "mock_event_obj",
        }

        scheduler._reset_job(job)

        assert job == expected

    def test_run_scheduler(self, scheduler) -> None:
        """Test the start of the scheduler."""
        mock_job_stop_event = MagicMock()
        mock_signal_exit = MagicMock()
        mock_job_thread = MagicMock()
        job = {
            "job_thread": mock_job_thread,
            "func": "func",
            "seconds": 0.1,
            "args": ("a", "b"),
            "job_stop_event": mock_job_stop_event,
            "signal_exit": mock_signal_exit,
        }
        scheduler._running = False
        scheduler._jobs = [job]

        scheduler.run()

        assert scheduler._running
        mock_job_stop_event.clear.assert_called_once()
        mock_signal_exit.clear.assert_called_once()
        mock_job_thread.start.assert_called_once()

    def test_stop_scheduler(self, scheduler) -> None:
        """Test the stopping of  the scheduler."""
        mock_job_stop_event = MagicMock()
        mock_signal_exit = MagicMock()
        mock_job_thread = MagicMock()
        mock_reset_job = MagicMock()
        job = {
            "job_thread": mock_job_thread,
            "func": "func",
            "seconds": 0.1,
            "args": ("a", "b"),
            "job_stop_event": mock_job_stop_event,
            "signal_exit": mock_signal_exit,
        }
        scheduler._running = True
        scheduler._jobs = [job]
        scheduler._reset_job = mock_reset_job

        scheduler.stop()

        assert not scheduler._running
        mock_job_stop_event.set.assert_called_once()
        mock_signal_exit.wait.assert_called_once()
        mock_job_thread.join.assert_called_once()
        mock_reset_job.assert_called_once_with(job)

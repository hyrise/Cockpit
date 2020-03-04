"""Wrapper for workload generator."""

from signal import SIGINT
from subprocess import DEVNULL, Popen  # nosec


class CockpitManager:
    """Wrapper for database manager."""

    def start(self):
        """Start database manager."""
        self.manager_process = Popen(  # nosec
            ["pipenv", "run", "python", "cli_manager.py"],
            stderr=DEVNULL,
            stdout=DEVNULL,
        )

    def shutdown(self):
        """Shutdown database manager."""
        self.manager_process.send_signal(SIGINT)
        self.manager_process.wait()

"""Wrapper for workload generator."""

from signal import SIGINT
from subprocess import DEVNULL, Popen  # nosec


class CockpitGenerator:
    """Wrapper for workload generator."""

    def start(self):
        """Start workload generator."""
        self.generator_process = Popen(  # nosec
            ["pipenv", "run", "python", "cli_generator.py"],
            stderr=DEVNULL,
            stdout=DEVNULL,
        )

    def shutdown(self):
        """Shutdown workload generator."""
        self.generator_process.send_signal(SIGINT)
        self.generator_process.wait()

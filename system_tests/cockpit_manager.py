"""Wrapper for workload generator."""

from os import remove
from signal import SIGINT
from subprocess import Popen  # nosec
from time import sleep


class CockpitManager:
    """Wrapper for database manager."""

    def start(self):
        """Start database manager."""
        self.error_file = open("manager_stderr.txt", "w")
        self.output_file = open("manager_stdout.txt", "w")

        self.manager_process = Popen(  # nosec
            ["pipenv", "run", "python", "-u", "cli_manager.py"],
            stderr=self.error_file,
            stdout=self.output_file,
        )

    def get_stderr(self):
        """Get standard error output."""
        with open("manager_stderr.txt", "r") as err:
            errors = err.read()
        return errors

    def get_stdout(self):
        """Get standard output."""
        with open("manager_stdout.txt", "r") as out:
            output = out.read()
        return output

    def shutdown(self):
        """Shutdown database manager."""
        self.manager_process.send_signal(SIGINT)
        sleep(0.1)
        self.manager_process.send_signal(SIGINT)
        self.manager_process.wait()
        self.output_file.close()
        self.error_file.close()
        remove("manager_stderr.txt")
        remove("manager_stdout.txt")

"""Wrapper for workload generator."""

from os import remove
from signal import SIGINT
from subprocess import Popen  # nosec


class CockpitGenerator:
    """Wrapper for workload generator."""

    def start(self):
        """Start workload generator."""
        self.error_file = open("generator_stderr.txt", "w")
        self.output_file = open("generator_stdout.txt", "w")

        self.generator_process = Popen(  # nosec
            ["pipenv", "run", "python", "cli_generator.py"],
            stderr=self.error_file,
            stdout=self.output_file,
        )

    def get_stderr(self):
        """Get standard error output."""
        with open("generator_stderr.txt", "r") as err:
            errors = err.read()
        return errors

    def get_stdout(self):
        """Get standard output."""
        with open("generator_stdout.txt", "r") as out:
            output = out.read()
        return output

    def shutdown(self):
        """Shutdown workload generator."""
        self.generator_process.send_signal(SIGINT)
        self.generator_process.wait()
        self.output_file.close()
        self.error_file.close()
        remove("generator_stderr.txt")
        remove("generator_stdout.txt")

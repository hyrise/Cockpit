#!/usr/bin/env python3

"""Script to start all back-end components."""

import logging
from argparse import ArgumentParser as Ag
from os import close, fdopen, pipe
from signal import SIGINT
from subprocess import Popen, TimeoutExpired, run  # nosec
from sys import platform
from threading import Event, Thread

from hyrisecockpit.settings import (
    BACKEND_PORT,
    DB_MANAGER_PORT,
    FRONTEND_PORT,
    GENERATOR_PORT,
)

FRONTEND_PATH = "hyrisecockpit/frontend"
TIME_OUT = 5
PORTS = {
    "cockpit-backend": BACKEND_PORT,
    "cockpit-manager": DB_MANAGER_PORT,
    "cockpit-generator": GENERATOR_PORT,
    "cockpit-frontend": FRONTEND_PORT,
}


class ArgumentParser:
    """Parse arguments from command line."""

    def __init__(self):
        """Initialize a ArgumentParser."""
        self.parser = Ag(description="Process manager to start cockpit components.")
        self._add_arguments()

    def _add_arguments(self):
        """Add accepted arguments to parser."""
        self.parser.add_argument(
            "--backend",
            "-b",
            dest="backend",
            action="store_true",
            help="Start backend only.",
        )
        self.parser.add_argument(
            "--frontend",
            "-f",
            dest="frontend",
            action="store_true",
            help="Start frontend only.",
        )

    def get_components(self):
        """Extract arguments from parser."""
        backend = self.parser.parse_args().backend
        frontend = self.parser.parse_args().frontend
        if not backend and not frontend:
            backend = True
            frontend = True
        return {"backend": backend, "frontend": frontend}


class LogPipe(Thread):
    """Log component output."""

    def __init__(self, level, logger):
        """Initialize the object with a logger and a loglevel and start the thread."""
        Thread.__init__(self)
        self.daemon = False
        self.level = level
        self.fdRead, self.fdWrite = pipe()
        self.pipeReader = fdopen(self.fdRead)
        self.start()
        self.logger = logger

    def fileno(self):
        """Return the write file descriptor of the pipe."""
        return self.fdWrite

    def run(self):
        """Run the thread, logging everything."""
        for line in iter(self.pipeReader.readline, ""):
            self.logger.log(self.level, line.strip("\n"))
        self.pipeReader.close()

    def close(self):
        """Close the write end of the pipe."""
        close(self.fdWrite)


class ProcessManager:
    """Manage processes from sub components."""

    def __init__(self, cockpit_components):
        """Initialize the process manager."""
        self._cockpit_components = cockpit_components
        self._running_processes = {}
        self._set_logging()
        self._start_commands = self._init_start_commands()
        self._logger_pipes = self._init_logger_pipes()

    def _set_logging(self):
        """Set the logger."""
        logging.basicConfig(
            level=logging.INFO,
            format="%(asctime)s :: %(name)s :: %(levelname)s :: %(message)s",
        )

    def _init_start_commands(self):
        """Return start commands."""
        return {
            "cockpit-backend": ["cockpit-backend"],
            "cockpit-manager": ["cockpit-manager"],
            "cockpit-generator": ["cockpit-generator"],
            "cockpit-frontend": ["npm", "run", "deploy", "--prefix", FRONTEND_PATH],
        }

    def _create_logger_pipes(self, component):
        """Create logger for a component and needed pipes."""
        logger = logging.getLogger(component)
        logger.setLevel(logging.INFO)
        logpipe_stdout = LogPipe(logging.INFO, logger)
        logpipe_stderr = LogPipe(logging.WARNING, logger)
        return {"logpipe_stdout": logpipe_stdout, "logpipe_stderr": logpipe_stderr}

    def _init_logger_pipes(self):
        """Create log pipes for requested components."""
        loggers_pipes = {}
        if self._cockpit_components["backend"]:
            loggers_pipes["cockpit-backend"] = self._create_logger_pipes(
                "cockpit-backend"
            )
            loggers_pipes["cockpit-manager"] = self._create_logger_pipes(
                "cockpit-manager"
            )
            loggers_pipes["cockpit-generator"] = self._create_logger_pipes(
                "cockpit-generator"
            )
        if self._cockpit_components["frontend"]:
            loggers_pipes["cockpit-frontend"] = self._create_logger_pipes(
                "cockpit-frontend"
            )
        return loggers_pipes

    def _kill_process(self, component, messege):
        """Kill subprocess ungracefully."""
        logging.warning(f"shutdown {component} ungracefully [{messege}]")
        if platform.startswith("linux"):  # noqa
            run(["fuser", "-k", f"{PORTS[component]}/tpc"])
        elif platform.startswith("darwin"):
            run(
                [
                    "lsof",
                    "-t",
                    "-i",
                    f"tcp:{PORTS[component]}",
                    "|",
                    "xcomand_line_arguments",
                    "kill",
                ]
            )

    def _shutdown_component(self, component, sub_process):
        """Shutdown component."""
        try:
            sub_process.send_signal(SIGINT)
            sub_process.wait(timeout=TIME_OUT)
            if sub_process.poll() is None:
                self._kill_process(sub_process, "still alive")
        except TimeoutExpired:
            self._kill_process(sub_process, f"timeout expired {TIME_OUT}s")

    def close(self):
        """Close components."""
        for component, sub_process in self._running_processes.items():
            logging.info(f"shutdown {component}")
            self._shutdown_component(component, sub_process)
            self._logger_pipes[component]["logpipe_stdout"].close()
            self._logger_pipes[component]["logpipe_stderr"].close()

    def run(self):
        """Start components in subprocesses."""
        for component, logger_pipe in self._logger_pipes.items():
            logging.info(f"start {component}")
            self._running_processes[component] = Popen(
                self._start_commands[component],
                stdout=logger_pipe["logpipe_stdout"],
                stderr=logger_pipe["logpipe_stderr"],
            )


def main():
    """Start components and handle interrupt."""
    argp = ArgumentParser()
    command_line_arguments = argp.get_components()
    process_manager = ProcessManager(command_line_arguments)
    try:
        process_manager.run()
        Event().wait()
    except KeyboardInterrupt:
        process_manager.close()

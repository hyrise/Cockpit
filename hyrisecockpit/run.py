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


def run_components(loggers_pipes, start_commands):
    """Start components in subprocesses."""
    components = {}
    for component, logger_pipe in loggers_pipes.items():
        logging.info(f"start {component}")
        components[component] = Popen(
            start_commands[component],
            stdout=logger_pipe["logpipe_stdout"],
            stderr=logger_pipe["logpipe_stderr"],
        )
    return components


def kill_process(component, messege):
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


def shutdown_component(component, sub_process):
    """Shutdown component."""
    try:
        sub_process.send_signal(SIGINT)
        sub_process.wait(timeout=TIME_OUT)
        if sub_process.poll() is None:
            kill_process(sub_process, "still alive")
    except TimeoutExpired:
        kill_process(sub_process, f"timeout expired {TIME_OUT}s")


def shutdown(components, loggers_pipes):
    """Shutdown components."""
    for component, sub_process in components.items():
        logging.info(f"shutdown {component}")
        shutdown_component(component, sub_process)
        loggers_pipes[component]["logpipe_stdout"].close()
        loggers_pipes[component]["logpipe_stderr"].close()


def create_logger_pipes(component):
    """Create logger for a component and needed pipes."""
    logger = logging.getLogger(component)
    logger.setLevel(logging.INFO)
    logpipe_stdout = LogPipe(logging.INFO, logger)
    logpipe_stderr = LogPipe(logging.WARNING, logger)
    return {"logpipe_stdout": logpipe_stdout, "logpipe_stderr": logpipe_stderr}


def get_looger_pipes(comand_line_arguments):
    """Create log pipes for requested components."""
    loggers_pipes = {}
    if comand_line_arguments["backend"]:
        loggers_pipes["cockpit-backend"] = create_logger_pipes("cockpit-backend")
        loggers_pipes["cockpit-manager"] = create_logger_pipes("cockpit-manager")
        loggers_pipes["cockpit-generator"] = create_logger_pipes("cockpit-generator")
    if comand_line_arguments["frontend"]:
        loggers_pipes["cockpit-frontend"] = create_logger_pipes("cockpit-frontend")
    return loggers_pipes


def get_start_commands(comand_line_arguments):
    """Return shell commands for requested components."""
    start_commands = {}
    if comand_line_arguments["backend"]:
        start_commands["cockpit-backend"] = ["cockpit-backend"]
        start_commands["cockpit-manager"] = ["cockpit-manager"]
        start_commands["cockpit-generator"] = ["cockpit-generator"]
    if comand_line_arguments["frontend"]:
        start_commands["cockpit-frontend"] = [
            "npm",
            "run",
            "deploy",
            "--prefix",
            FRONTEND_PATH,
        ]
    return start_commands


def main():
    """Start components and handle interrupt."""
    argp = ArgumentParser()
    comand_line_arguments = argp.get_components()
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s :: %(name)s :: %(levelname)s :: %(message)s",
    )
    loggers_pipes = get_looger_pipes(comand_line_arguments)
    start_commands = get_start_commands(comand_line_arguments)
    try:
        components = run_components(loggers_pipes, start_commands)
        Event().wait()
    except KeyboardInterrupt:
        shutdown(components, loggers_pipes)

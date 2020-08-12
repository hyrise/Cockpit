"""Setup script for the starting of the cockpit."""
import logging
from os import close, fdopen, pipe
from signal import SIGINT
from subprocess import Popen, TimeoutExpired, run  # nosec
from sys import platform
from threading import Event, Thread

from hyrisecockpit.settings import BACKEND_PORT, DB_MANAGER_PORT, GENERATOR_PORT

TIME_OUT = 5
PORTS = {
    "cockpit-backend": BACKEND_PORT,
    "cockpit-manager": DB_MANAGER_PORT,
    "cockpit-generator": GENERATOR_PORT,
}


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


def run_components(loggers_pipes):
    """Start components in subprocesses."""
    components = {}
    logging.info("start cockpit-backend")
    components["cockpit-backend"] = Popen(
        ["pipenv", "run", "cockpit-backend"],
        stdout=loggers_pipes["cockpit-backend"]["logpipe_stdout"],
        stderr=loggers_pipes["cockpit-backend"]["logpipe_stderr"],
    )
    logging.info("start cockpit-manager")
    components["cockpit-manager"] = Popen(
        ["pipenv", "run", "cockpit-manager"],
        stdout=loggers_pipes["cockpit-manager"]["logpipe_stdout"],
        stderr=loggers_pipes["cockpit-manager"]["logpipe_stderr"],
    )
    logging.info("start cockpit-manager")
    components["cockpit-generator"] = Popen(
        ["pipenv", "run", "cockpit-generator"],
        stdout=loggers_pipes["cockpit-generator"]["logpipe_stdout"],
        stderr=loggers_pipes["cockpit-generator"]["logpipe_stderr"],
    )
    return components


def kill_process(component, messege):
    """Kill subprocess ungracefully."""
    logging.warning(f"shutdown {component} ungracefully [{messege}]")
    if platform.startswith("linux"):  # noqa
        run(["fuser", "-k", f"{PORTS[component]}/tpc"])
    elif platform.startswith("darwin"):
        run(["lsof", "-t", "-i", f"tcp:{PORTS[component]}", "|", "xargs", "kill"])


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


def main():
    """Start components and handle interrupt."""
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s :: %(name)s :: %(levelname)s :: %(message)s",
    )
    loggers_pipes = {
        "cockpit-backend": create_logger_pipes("cockpit-backend"),
        "cockpit-manager": create_logger_pipes("cockpit-manager"),
        "cockpit-generator": create_logger_pipes("cockpit-generator"),
    }
    try:
        components = run_components(loggers_pipes)
        Event().wait()
    except KeyboardInterrupt:
        shutdown(components, loggers_pipes)

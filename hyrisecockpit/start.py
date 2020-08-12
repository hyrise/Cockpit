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

    def __init__(self, level):
        """Initialize the object with a logger and a loglevel and start the thread."""
        Thread.__init__(self)
        self.daemon = False
        self.level = level
        self.fdRead, self.fdWrite = pipe()
        self.pipeReader = fdopen(self.fdRead)
        self.start()

    def fileno(self):
        """Return the write file descriptor of the pipe."""
        return self.fdWrite

    def run(self):
        """Run the thread, logging everything."""
        for line in iter(self.pipeReader.readline, ""):
            logging.log(self.level, line.strip("\n"))

        self.pipeReader.close()

    def close(self):
        """Close the write end of the pipe."""
        close(self.fdWrite)


def run_components(logpipe):
    """Start components in subprocesses."""
    components = {}
    logging.info("start cockpit-backend")
    components["cockpit-backend"] = Popen(
        ["pipenv", "run", "cockpit-backend"], stdout=logpipe, stderr=logpipe
    )
    logging.info("start cockpit-manager")
    components["cockpit-manager"] = Popen(
        ["pipenv", "run", "cockpit-manager"], stdout=logpipe, stderr=logpipe
    )
    logging.info("start cockpit-manager")
    components["cockpit-generator"] = Popen(
        ["pipenv", "run", "cockpit-generator"], stdout=logpipe, stderr=logpipe
    )
    return components


def kill_process(component, messege):
    """Kill subprocess ungracefully."""
    logging.warning(f"shutdown {component} ungracefully [{messege}]")
    if platform.startswith("linux"):  # noqa
        run(["fuser", "-k", f"{PORTS[component]}/tpc"])
    elif platform.startswith("darwin"):
        pid = run(["lsof", "-i", f":{PORTS[component]}"], capture_output=True).stdout
        run(["kill", "-9", f"{pid}"])


def shutdown_component(component, sub_process):
    """Shutdown component."""
    try:
        sub_process.send_signal(SIGINT)
        sub_process.wait(timeout=TIME_OUT)
        if sub_process.poll() is None:
            kill_process(sub_process, "still alive")
    except TimeoutExpired:
        kill_process(sub_process, "timeout expired")


def shutdown(components, logpipe):
    """Shutdown components."""
    for component, sub_process in components.items():
        logging.info(f"shutdown {component}")
        shutdown_component(component, sub_process)
    logpipe.close()


def main():
    """Start components and handle interrupt."""
    logging.basicConfig(
        level=logging.INFO, format="%(asctime)s :: %(levelname)s :: %(message)s"
    )
    logpipe = LogPipe(logging.INFO)
    try:
        components = run_components(logpipe)
        Event().wait()
    except KeyboardInterrupt:
        shutdown(components, logpipe)

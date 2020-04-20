"""This module start the components inside the docker container."""

import signal
import sys
from subprocess import DEVNULL, Popen  # nosec
from time import sleep

subprocesses = []


def print_green(value):
    """Print green colored text."""
    print("\033[92m{}\033[00m".format(value))


def print_cyan(value):
    """Print cyan colored text."""
    print("\033[96m{}\033[00m".format(value))


def start_backend():
    """Start backend components.."""
    backend_prosess = Popen(  # nosec
        ["pipenv", "run", "cockpit-backend"], stderr=DEVNULL, stdout=DEVNULL,
    )
    subprocesses.append(backend_prosess)
    sleep(1)
    print_green("cockpit-backend running " + "\N{check mark}")
    manager_process = Popen(  # nosec
        ["pipenv", "run", "cockpit-manager"], stderr=DEVNULL, stdout=DEVNULL,
    )
    subprocesses.append(manager_process)
    sleep(0.5)
    print_green("cockpit-manager running " + "\N{check mark}")
    generator_process = Popen(  # nosec
        ["pipenv", "run", "cockpit-generator"], stderr=DEVNULL, stdout=DEVNULL,
    )
    subprocesses.append(generator_process)
    sleep(0.5)
    print_green("cockpit-generator running " + "\N{check mark}")


def close_components() -> None:
    """Close main cockpit components."""
    for i in range(len(subprocesses)):
        subprocesses[i].send_signal(signal.SIGINT)
        subprocesses[i].wait()


def signal_handler(sig, frame):
    """Handle interrupt signal."""
    print("You pressed Ctrl+C!")
    close_components()
    sys.exit(0)


if __name__ == "__main__":
    print_cyan("Starting backend components...")  # type: ignore
    start_backend()  # type: ignore
    signal.signal(signal.SIGINT, signal_handler)
    print("All Components running.")
    print("Press Ctrl+C to close components.")
    signal.pause()

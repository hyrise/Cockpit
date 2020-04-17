"""This module start the components inside the docker container."""

import argparse
import signal
import sys
from subprocess import DEVNULL, Popen  # nosec
from time import sleep

subprocesses = []


class ArgumentParser:
    """Parse arguments from command line."""

    def __init__(self):
        """Initialize a ArgumentParser."""
        self.parser = argparse.ArgumentParser(
            formatter_class=argparse.ArgumentDefaultsHelpFormatter
        )
        self._add_arguments()

    def _add_arguments(self):
        self.parser.add_argument(
            "-s", action="store_true", help="start Hyrise server",
        )
        self.parser.add_argument(
            "-i", action="store_true", help="start influx",
        )
        self.parser.add_argument(
            "-b", action="store_true", help="start backend",
        )
        self.parser.add_argument(
            "-all", action="store_true", help="start backend",
        )

    def get_coniguration(self):
        """Return which component to start."""
        args, leftovers = self.parser.parse_known_args()
        arguments = vars(args)
        if arguments["all"]:
            return {"s": True, "i": True, "b": True}
        return arguments


def start_hyriseserver():
    """Start hyrise server."""
    hyrise_one_prosess = Popen(  # nosec
        ["./hyriseServer"],
        cwd="/hyrise_server/hyrise/cmake-build-release",
        stderr=DEVNULL,
        stdout=DEVNULL,
    )
    subprocesses.append(hyrise_one_prosess)
    sleep(0.5)
    hyrise_two_prosess = Popen(  # nosec
        ["./hyriseServer"],
        cwd="/hyrise_server/hyrise_two/cmake-build-release",
        stderr=DEVNULL,
        stdout=DEVNULL,
    )
    subprocesses.append(hyrise_two_prosess)
    sleep(0.5)


def start_influxdb():
    """Start InfluxDB."""
    influxdb_process = Popen(["influxd"], stderr=DEVNULL, stdout=DEVNULL,)  # nosec
    subprocesses.append(influxdb_process)
    sleep(0.5)


def start_backend():
    """Start backend components.."""
    backend_prosess = Popen(  # nosec
        ["pipenv", "run", "cockpit-backend"], stderr=DEVNULL, stdout=DEVNULL,
    )
    subprocesses.append(backend_prosess)
    sleep(1)
    manager_process = Popen(  # nosec
        ["pipenv", "run", "cockpit-manager"], stderr=DEVNULL, stdout=DEVNULL,
    )
    subprocesses.append(manager_process)
    sleep(0.5)
    generator_process = Popen(  # nosec
        ["pipenv", "run", "cockpit-generator"], stderr=DEVNULL, stdout=DEVNULL,
    )
    subprocesses.append(generator_process)
    sleep(0.5)


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


def print_green(value):
    """Print green colored text."""
    print("\033[92m{}\033[00m".format(value))


def print_cyan(value):
    """Print cyan colored text."""
    print("\033[96m{}\033[00m".format(value))


if __name__ == "__main__":
    coniguration = ArgumentParser().get_coniguration()  # type: ignore
    if coniguration["s"]:
        print_cyan("Starting Hyrise server...")  # type: ignore
        start_hyriseserver()  # type: ignore
        print_green("Hyrise Server running " + "\N{check mark}")  # type: ignore
    if coniguration["i"]:
        print_cyan("Starting INfluxdb...")  # type: ignore
        start_influxdb()  # type: ignore
        print_green("INfluxdb running " + "\N{check mark}")  # type: ignore
    if coniguration["b"]:
        print_cyan("Starting Backend-Components...")  # type: ignore
        start_backend()  # type: ignore
        print_green("Backend-Components running " + "\N{check mark}")  # type: ignore
    signal.signal(signal.SIGINT, signal_handler)
    print("All Components running.")
    print("Press Ctrl+C to close components.")
    signal.pause()

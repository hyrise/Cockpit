"""Setup script for the starting of the cockpit."""
import logging
from signal import SIGINT
from subprocess import Popen, TimeoutExpired, run  # nosec
from sys import platform
from threading import Event

from hyrisecockpit.settings import BACKEND_PORT, DB_MANAGER_PORT, GENERATOR_PORT

TIME_OUT = 5
PORTS = {
    "cockpit-backend": BACKEND_PORT,
    "cockpit-manager": DB_MANAGER_PORT,
    "cockpit-generator": GENERATOR_PORT,
}


def run_components():
    """Start components in subprocesses."""
    components = {}
    logging.info("start cockpit-backend")
    components["cockpit-backend"] = Popen(["pipenv", "run", "cockpit-backend"])
    logging.info("start cockpit-manager")
    components["cockpit-manager"] = Popen(["pipenv", "run", "cockpit-manager"])
    logging.info("start cockpit-manager")
    components["cockpit-generator"] = Popen(["pipenv", "run", "cockpit-generator"])
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


def shutdown(components):
    """Shutdown components."""
    for component, sub_process in components.items():
        logging.info(f"shutdown {component}")
        shutdown_component(component, sub_process)


def main():
    """Start components and handle interrupt."""
    logging.basicConfig(
        level=logging.INFO, format="%(asctime)s :: %(levelname)s :: %(message)s"
    )
    try:
        components = run_components()
        Event().wait()
    except KeyboardInterrupt:
        shutdown(components)


if __name__ == "__main__":
    main()  # type: ignore

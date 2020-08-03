"""Setup script for the starting of the cockpit."""
from signal import SIGINT
from subprocess import Popen  # nosec
from threading import Event
from time import sleep

try:
    print("Starting components...")
    backend = Popen(["pipenv", "run", "cockpit-backend"])
    manager = Popen(["pipenv", "run", "cockpit-manager"])
    generator = Popen(["pipenv", "run", "cockpit-generator"])
    print("Cockpit is running")
    Event().wait()
except KeyboardInterrupt:
    print("Shutdown...")
    backend.send_signal(SIGINT)
    backend.wait()
    generator.send_signal(SIGINT)
    generator.wait()
    manager.send_signal(SIGINT)
    sleep(0.1)  # TODO: fix ZMQ closing error
    manager.send_signal(SIGINT)
    manager.wait()
    print("Done")

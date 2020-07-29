"""Module for starting the cockpit components."""

from threading import Event

from system_tests.cockpit_backend import CockpitBackend
from system_tests.cockpit_generator import CockpitGenerator
from system_tests.cockpit_manager import CockpitManager

backend = CockpitBackend()  # type: ignore
manager = CockpitManager()
generator = CockpitGenerator()

try:
    print("Starting components...")
    backend.start()
    manager.start()  # type: ignore
    generator.start()  # type: ignore
    print("Cockpit is running...")
    Event().wait()
except KeyboardInterrupt:
    print("Shutting down...")
    manager.shutdown()  # type: ignore
    backend.shutdown()
    generator.shutdown()  # type: ignore
    print("Done")

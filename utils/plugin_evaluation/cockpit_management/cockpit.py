"""Module for system tests."""

from system_tests.cockpit_backend import CockpitBackend

backend = CockpitBackend()  # type: ignore
backend.start()

print(backend.get_stderr())

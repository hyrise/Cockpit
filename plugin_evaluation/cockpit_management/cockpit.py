"""Module for system tests."""

from plugin_evaluation.cockpit_management.cockpit_backend import CockpitBackend
from plugin_evaluation.cockpit_management.cockpit_generator import CockpitGenerator
from plugin_evaluation.cockpit_management.cockpit_manager import CockpitManager

backend = CockpitBackend()
backend.start()
manager = CockpitManager()
manager.start()
generator = CockpitGenerator()
generator.start()

backend.shutdown()
manager.shutdown()
generator.shutdown()

"""Module for cockpit management."""

from plugin_evaluation.cockpit_management.cockpit_backend import CockpitBackend
from plugin_evaluation.cockpit_management.cockpit_generator import CockpitGenerator
from plugin_evaluation.cockpit_management.cockpit_manager import CockpitManager


class Cockpit:
    """Class for managing of the cockpit components."""

    def __init__(self):
        """Initialize all cokcpit components."""
        self.backend = CockpitBackend()
        self.manager = CockpitManager()
        self.generator = CockpitGenerator()

    def start(self):
        """Start all cockpit components."""
        self.backend.start()
        self.manager.start()
        self.generator.start()

    def shutdown(self):
        """Shutdown all cockpit components."""
        self.backend.shutdown()
        self.manager.shutdown()
        self.generator.shutdown()

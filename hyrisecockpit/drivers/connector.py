"""Connector for cockpit and drivers."""
from hyrisecockpit.drivers.tpch.tpch_driver import TpchDriver


class Workload:
    """Represents a workload."""

    def __init__(self, driver):
        """Initialize a workload object."""
        self.running = False
        self.scale_factor = 0
        self.weights = driver.get_default_weights()
        self.frequency = 0
        self.driver = driver

    def get_default_weights(self):
        """Return default weights."""
        return self.driver.get_default_weights()

    def update(self, scale_factor, frequency, weights):
        """Update workload object."""
        if bool(weights):
            self.weights = weights
        self.scale_factor = scale_factor
        self.frequency = frequency

    def resert(self):
        """Reset attributes."""
        self.scale_factor = 0
        self.weights = self.driver.get_default_weights()
        self.frequency = 0


class Connector:
    """Represents a connector between drivers and cockpit."""

    @classmethod
    def get_workload(cls):
        """Return a dictionary with workload objects."""
        return {"tpch": Workload(TpchDriver())}

    @classmethod
    def get_workload_drivers(cls):
        """Return a dictionary with workload drivers."""
        return {"tpch": TpchDriver()}

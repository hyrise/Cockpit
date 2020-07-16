"""Different workload classes."""

from hyrisecockpit.drivers.tpch.tpch_driver import TpchDriver


class Tpch:
    """Represents tpch workload."""

    def __init__(self):
        """Initialize a tpch object."""
        self.scale_factores = []
        self.weights = []
        self.frequency = 0
        self.driver = TpchDriver()

    def update(self, weights, frequency):
        """Update tpch object."""
        self.weights = weights
        self.frequency = frequency

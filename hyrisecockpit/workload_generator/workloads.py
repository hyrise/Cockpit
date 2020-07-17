"""Default workload class."""


class Workload:
    """Represents tpch workload."""

    def __init__(self, driver):
        """Initialize a tpch object."""
        self.scale_factores = []
        self.weights = []
        self.frequency = 0
        self.driver = driver

    def update(self, weights, frequency):
        """Update tpch object."""
        self.weights = weights
        self.frequency = frequency

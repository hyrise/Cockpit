"""Default workload class."""


class Workload:
    """Represents a workload."""

    def __init__(self, driver):
        """Initialize a workload object."""
        self.running = False
        self.scale_factor = 0
        self.weights = driver.get_default_weights()
        self.frequency = 0
        self.driver = driver

    def update(self, scale_factor, frequency, weights):
        """Update workload object."""
        self.weights = weights
        self.scale_factor = scale_factor
        self.frequency = frequency

    def resert(self):
        """Reset attributes."""
        self.scale_factor = 0
        self.weights = self.driver.get_default_weights()
        self.frequency = 0

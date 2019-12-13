"""Tests for the workload_generator module."""
from hyrisecockpit.workload_generator.generator import WorkloadGenerator


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    def test_initializes(self):
        """A WorkloadGenerator initializes."""
        workload_generator = WorkloadGenerator()
        assert isinstance(workload_generator, WorkloadGenerator)

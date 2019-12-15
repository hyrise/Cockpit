"""Tests for the workload_generator module."""
from hyrisecockpit.workload_generator.generator import (
    WorkloadGenerator,
    WorkloadProducer,
)


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    def test_initializes(self):
        """A WorkloadGenerator initializes."""
        workload_generator = WorkloadGenerator()
        assert isinstance(workload_generator, WorkloadGenerator)


class TestWorkloadProducer:
    """Tests for the WorkloadProducer class."""

    def test_initializes(self):
        """A WorkloadProducer initializes."""
        workload_producer = WorkloadProducer(name="MyWorkloadProducer")
        assert isinstance(workload_producer, WorkloadProducer)

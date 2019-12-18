"""Tests for the workload_generator module."""
from hyrisecockpit.settings import (
    GENERATOR_HOST,
    GENERATOR_PORT,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)
from hyrisecockpit.workload_generator.generator import (
    WorkloadGenerator,
    WorkloadProducer,
)


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    def test_initializes(self):
        """A WorkloadGenerator initializes."""
        workload_generator = WorkloadGenerator(
            GENERATOR_HOST, GENERATOR_PORT, WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT
        )
        assert isinstance(workload_generator, WorkloadGenerator)


class TestWorkloadProducer:
    """Tests for the WorkloadProducer class."""

    def test_initializes(self):
        """A WorkloadProducer initializes."""
        workload_producer = WorkloadProducer(
            "MyWorkloadProducer", WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT
        )
        assert isinstance(workload_producer, WorkloadProducer)

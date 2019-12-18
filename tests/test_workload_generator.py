"""Tests for the workload_generator module."""
from pytest import fixture, mark
from zmq import Context, Socket

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

    @fixture
    def workload_generator(self) -> WorkloadGenerator:
        """Get a new WorkloadGenerator."""
        with WorkloadGenerator(
            GENERATOR_HOST, GENERATOR_PORT, WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT
        ) as workload_generator:
            return workload_generator

    def test_initializes(self, workload_generator: WorkloadGenerator):
        """A WorkloadGenerator initializes."""
        assert isinstance(workload_generator, WorkloadGenerator)

    def test_has_a_context(self, workload_generator: WorkloadGenerator):
        """A WorkloadGenerator has a ZMQ Context."""
        assert isinstance(workload_generator._context, Context)

    def test_has_a_socket(self, workload_generator: WorkloadGenerator):
        """A WorkloadGenerator has a ZMQ Socket."""
        assert isinstance(workload_generator._socket, Socket)

    @mark.parametrize("call", ["start", "stop", "shutdown"])
    def test_has_server_call(self, workload_generator: WorkloadGenerator, call: str):
        """A WorkloadGenerator has a server call."""
        assert call in workload_generator._server_calls.keys()


class TestWorkloadProducer:
    """Tests for the WorkloadProducer class."""

    @fixture
    def workload_producer(self) -> WorkloadProducer:
        """Get a new WorkloadProducer."""
        with WorkloadProducer(
            "MyWorkloadProducer", WORKLOAD_SUB_HOST, WORKLOAD_PUBSUB_PORT
        ) as workload_producer:
            return workload_producer

    def test_initializes(self, workload_producer: WorkloadProducer):
        """A WorkloadProducer initializes."""
        assert isinstance(workload_producer, WorkloadProducer)

    def test_has_a_context(self, workload_producer: WorkloadProducer):
        """A WorkloadProducer has a ZMQ Context."""
        assert isinstance(workload_producer._context, Context)

    def test_has_a_socket(self, workload_producer: WorkloadProducer):
        """A WorkloadProducer has a ZMQ Socket."""
        assert isinstance(workload_producer._socket, Socket)

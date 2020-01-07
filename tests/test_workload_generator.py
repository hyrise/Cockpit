"""Tests for the workload_generator module's generator."""
from pytest import fixture, mark
from zmq import Context, Socket

from hyrisecockpit.settings import (
    GENERATOR_HOST,
    GENERATOR_PORT,
    WORKLOAD_PUBSUB_PORT,
    WORKLOAD_SUB_HOST,
)
from hyrisecockpit.workload_generator.generator import WorkloadGenerator


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
        assert isinstance(workload_generator._rep_socket, Socket)
        assert isinstance(workload_generator._pub_socket, Socket)

    @mark.parametrize("call", ["workload"])
    def test_has_server_call(self, workload_generator: WorkloadGenerator, call: str):
        """A WorkloadGenerator has a server call."""
        assert call in workload_generator._server_calls.keys()

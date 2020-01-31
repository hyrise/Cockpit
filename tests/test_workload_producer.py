"""Tests for the workload_generator module's producer."""
from pytest import fixture
from zmq import Context, Socket

from hyrisecockpit.settings import WORKLOAD_PUBSUB_PORT, WORKLOAD_SUB_HOST
from hyrisecockpit.workload_generator.producer import WorkloadProducer


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

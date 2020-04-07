"""Tests for the Workload interface."""
from pytest import fixture

from hyrisecockpit.api.app.workload.interface import WorkloadInterface
from hyrisecockpit.api.app.workload.model import Workload


@fixture(params=[("workload0", "tpch_0.1", 420), ("workload1", "job", 0)],)
def interface(request) -> WorkloadInterface:
    """Return a real Workload interface."""
    workload_id, folder_name, frequency = request.param
    return WorkloadInterface(
        workload_id=workload_id, folder_name=folder_name, frequency=frequency
    )


class TestWorkloadInterface:
    """Tests for the Workload interface."""

    def test_creates(self, interface: WorkloadInterface):
        """A Workload interface can be created."""
        assert interface

    def test_works(self, interface: WorkloadInterface):
        """A Workload model can be created from an interface."""
        assert Workload(**interface)

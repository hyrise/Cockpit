"""Tests for the Workload model."""
from pytest import fixture

from hyrisecockpit.api.app.workload.model import Workload


@fixture(params=[("workload0", "tpch_0.1", 420), ("workload1", "job", 0)],)
def workload(request) -> Workload:
    """Return a real Workload model."""
    workload_id, folder_name, frequency = request.param
    return Workload(
        workload_id=workload_id, folder_name=folder_name, frequency=frequency
    )


class TestWorkload:
    """Tests for the Workload model."""

    def test_creates(self, workload: Workload):
        """A Workload model can be created."""
        assert workload

"""Tests for the Workload model."""
from typing import Dict

from pytest import fixture

from hyrisecockpit.api.app.workload.model import DetailedWorkload, Workload


@fixture(params=["tpch", "job"])
def workload_type(request) -> str:
    """Get examples of workload types."""
    return request.param


@fixture(params=[0, 420])
def frequency(request) -> int:
    """Get examples of frequencies."""
    return request.param


@fixture(params=[0.1, 1])
def scale_factor(request) -> int:
    """Get examples of scale-factor."""
    return request.param


@fixture(params=[{}, {"01": 0.0, "23c": 100.1}])
def weights(request) -> Dict[str, float]:
    """Get examples of weights."""
    return request.param


@fixture
def workload(workload_type: str, frequency: int, scale_factor: float) -> Workload:
    """Return a Workload model."""
    return Workload(
        workload_type=workload_type, frequency=frequency, scale_factor=scale_factor
    )


@fixture
def detailed_workload(
    workload_type: str, frequency: int, scale_factor: float, weights: Dict[str, float]
) -> Workload:
    """Return a DetailedWorkload model."""
    return DetailedWorkload(
        workload_type=workload_type,
        frequency=frequency,
        scale_factor=scale_factor,
        weights=weights,
    )


class TestWorkload:
    """Tests for the Workload model."""

    def test_creates(self, workload: Workload):
        """A Workload model can be created."""
        assert workload


class TestDetailedWorkload:
    """Tests for the DetailedWorkload model."""

    def test_creates(self, detailed_workload: DetailedWorkload):
        """A Workload model can be created."""
        assert workload

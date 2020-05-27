"""Tests for the Workload model."""
from typing import Dict

from pytest import fixture

from hyrisecockpit.api.app.workload.model import DetailedWorkload, Workload


@fixture(params=["tpch_0.1", "job"])
def folder_name(request) -> str:
    """Get examples of folder names."""
    return request.param


@fixture(params=[0, 420])
def frequency(request) -> int:
    """Get examples of frequencies."""
    return request.param


@fixture(params=[{}, {"01": 0.0, "23c": 100.1}])
def weights(request) -> Dict[str, float]:
    """Get examples of weights."""
    return request.param


@fixture
def workload(folder_name: str, frequency: int) -> Workload:
    """Return a Workload model."""
    return Workload(folder_name=folder_name, frequency=frequency)


@fixture
def detailed_workload(
    folder_name: str, frequency: int, weights: Dict[str, float]
) -> Workload:
    """Return a DetailedWorkload model."""
    return DetailedWorkload(
        folder_name=folder_name, frequency=frequency, weights=weights
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

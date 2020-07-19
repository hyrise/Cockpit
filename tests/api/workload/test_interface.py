"""Tests for the Workload interface."""

from typing import Dict

from pytest import fixture

from hyrisecockpit.api.app.workload.interface import (
    DetailedWorkloadInterface,
    WorkloadInterface,
)
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
def weights(request) -> Dict[str, int]:
    """Get examples of weights."""
    return request.param


@fixture(params=[True, False])
def running(request) -> bool:
    """Get examples of running."""
    return request.param


@fixture
def interface(
    workload_type: str, frequency: int, scale_factor: float
) -> WorkloadInterface:
    """Return a Workload model."""
    return WorkloadInterface(
        workload_type=workload_type, frequency=frequency, scale_factor=scale_factor
    )


@fixture
def detailed_interface(
    workload_type: str,
    frequency: int,
    scale_factor: float,
    weights: Dict[str, float],
    running: bool,
) -> DetailedWorkloadInterface:
    """Return a DetailedWorkload model."""
    return DetailedWorkloadInterface(
        workload_type=workload_type,
        frequency=frequency,
        scale_factor=scale_factor,
        weights=weights,
        running=running,
    )


class TestWorkloadInterface:
    """Tests for the Workload interface."""

    def test_creates(self, interface: WorkloadInterface):
        """A Workload interface can be created."""
        assert interface

    def test_works(self, interface: WorkloadInterface):
        """A Workload model can be created from an interface."""
        assert Workload(**interface)


class TestDetailedWorkloadInterface:
    """Tests for the DetailedWorkload interface."""

    def test_creates(self, detailed_interface: DetailedWorkloadInterface):
        """A DetailedWorkload interface can be created."""
        assert detailed_interface

    def test_works(self, detailed_interface: DetailedWorkloadInterface):
        """A DetailedWorkload model can be created from an interface."""
        assert DetailedWorkload(**detailed_interface)

"""Tests for the Workload interface."""

from typing import Dict, List

from pytest import fixture

from hyrisecockpit.api.app.workload.interface import (
    BaseWorkloadInterface,
    DetailedWorkloadInterface,
    WorkloadInterface,
)
from hyrisecockpit.api.app.workload.model import (
    BaseWorkload,
    DetailedWorkload,
    Workload,
)


@fixture(params=["job"])
def workload_type(request) -> str:
    """Get examples of workload types."""
    return request.param


@fixture(params=[420])
def frequency(request) -> int:
    """Get examples of frequencies."""
    return request.param


@fixture(params=[0.1])
def scale_factor(request) -> int:
    """Get examples of scale-factor."""
    return request.param


@fixture(params=[{}, {"01": 0.0, "23c": 100.1}])
def weights(request) -> Dict[str, int]:
    """Get examples of weights."""
    return request.param


@fixture(params=[True])
def running(request) -> bool:
    """Get examples of running."""
    return request.param


@fixture(params=[[0.1, 1]])
def supported_scale_factors(request) -> List[float]:
    """Get examples of scale-factor."""
    return request.param


@fixture(params=[{}, {"01": 1.0, "23c": 1.0}])
def default_weights(request) -> Dict[str, int]:
    """Get examples of weights."""
    return request.param


@fixture
def base_interface(
    workload_type: str, frequency: int, scale_factor: float, weights: Dict
) -> BaseWorkloadInterface:
    """Return a Workload model."""
    return BaseWorkloadInterface(
        workload_type=workload_type,
        frequency=frequency,
        scale_factor=scale_factor,
        weights=weights,
    )


@fixture
def interface(
    workload_type: str,
    frequency: int,
    scale_factor: float,
    weights: Dict[str, float],
    running: bool,
) -> WorkloadInterface:
    """Return a DetailedWorkload model."""
    return WorkloadInterface(
        workload_type=workload_type,
        frequency=frequency,
        scale_factor=scale_factor,
        weights=weights,
        running=running,
    )


@fixture
def detailed_interface(
    workload_type: str,
    frequency: int,
    scale_factor: float,
    weights: Dict[str, float],
    running: bool,
    supported_scale_factors: List,
    default_weights: Dict,
) -> DetailedWorkloadInterface:
    """Return a DetailedWorkload model."""
    return DetailedWorkloadInterface(
        workload_type=workload_type,
        frequency=frequency,
        scale_factor=scale_factor,
        weights=weights,
        running=running,
        supported_scale_factors=supported_scale_factors,
        default_weights=default_weights,
    )


class TestBaseWorkloadInterface:
    """Tests for the base workload interface."""

    def test_creates(self, base_interface: BaseWorkloadInterface):
        """A base workload interface can be created."""
        assert base_interface

    def test_works(self, base_interface: BaseWorkloadInterface):
        """A base workload model can be created from an interface."""
        assert BaseWorkload(**base_interface)


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

    def test_creates(self, detailed_interface: DetailedWorkload):
        """A DetailedWorkload interface can be created."""
        assert detailed_interface

    def test_works(self, detailed_interface: DetailedWorkload):
        """A DetailedWorkload model can be created from an interface."""
        assert DetailedWorkload(**detailed_interface)  # type: ignore

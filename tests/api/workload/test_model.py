"""Tests for the Workload model."""
from typing import Dict, List

from pytest import fixture

from hyrisecockpit.api.app.workload.model import (
    BaseWorkload,
    DetailedWorkload,
    Workload,
)


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


@fixture(params=[True, False])
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
def base_workload(
    workload_type: str, frequency: int, scale_factor: float, weights: Dict[str, float]
) -> BaseWorkload:
    """Return a Workload model."""
    return BaseWorkload(
        workload_type=workload_type,
        frequency=frequency,
        scale_factor=scale_factor,
        weights=weights,
    )


@fixture
def workload(
    workload_type: str,
    frequency: int,
    scale_factor: float,
    weights: Dict[str, float],
    running: bool,
) -> Workload:
    """Return a DetailedWorkload model."""
    return Workload(
        workload_type=workload_type,
        frequency=frequency,
        scale_factor=scale_factor,
        weights=weights,
        running=running,
    )


@fixture
def detailed_workload(
    workload_type: str,
    frequency: int,
    scale_factor: float,
    weights: Dict[str, float],
    running: bool,
    supported_scale_factors: List[float],
    default_weights: Dict[str, int],
) -> DetailedWorkload:
    """Return a DetailedWorkload model."""
    return DetailedWorkload(
        workload_type=workload_type,
        frequency=frequency,
        scale_factor=scale_factor,
        weights=weights,
        running=running,
        supported_scale_factors=supported_scale_factors,
        default_weights=default_weights,
    )


class TestBaseWorkload:
    """Tests for the BaseWorkload model."""

    def test_creates(self, base_workload: BaseWorkload):
        """A base Workload model can be created."""
        assert base_workload


class TestWorkload:
    """Tests for the Workload model."""

    def test_creates(self, workload: Workload):
        """A  Workload model can be created."""
        assert workload


class TestDetailedWorkload:
    """Tests for the DetailedWorkload model."""

    def test_creates(self, detailed_workload: DetailedWorkload):
        """A base Workload model can be created."""
        assert detailed_workload

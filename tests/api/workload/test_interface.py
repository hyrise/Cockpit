"""Tests for the Workload interface."""
from typing import Dict

from pytest import fixture

from hyrisecockpit.api.app.workload.interface import (
    DetailedWorkloadInterface,
    WorkloadInterface,
)
from hyrisecockpit.api.app.workload.model import DetailedWorkload, Workload


@fixture(params=["tpch_0.1", "job"])
def folder_name(request) -> str:
    """Get examples of folder names."""
    return request.param


@fixture(params=[0, 420])
def frequency(request) -> int:
    """Get examples of frequencies."""
    return request.param


@fixture(params=[{}, {"01": 0, "23c": 101}])
def weights(request) -> Dict[str, int]:
    """Get examples of weights."""
    return request.param


@fixture
def interface(folder_name: str, frequency: int) -> WorkloadInterface:
    """Return a real Workload model."""
    return WorkloadInterface(folder_name=folder_name, frequency=frequency)


@fixture
def detailed_interface(
    folder_name: str, frequency: int, weights: Dict[str, int]
) -> DetailedWorkloadInterface:
    """Return a real DetailedWorkload model."""
    return DetailedWorkloadInterface(
        folder_name=folder_name, frequency=frequency, weights=weights
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

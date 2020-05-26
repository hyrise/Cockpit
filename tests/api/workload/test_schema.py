"""Tests for the Workload schema."""

from typing import Dict

from pytest import fixture

from hyrisecockpit.api.app.workload.interface import (
    DetailedWorkloadInterface,
    WorkloadInterface,
)
from hyrisecockpit.api.app.workload.model import DetailedWorkload, Workload
from hyrisecockpit.api.app.workload.schema import DetailedWorkloadSchema, WorkloadSchema


@fixture(params=["tpch_0.1", "job"])
def folder_name(request) -> str:
    """Get examples of folder names."""
    return request.param


@fixture(params=[0, 420])
def frequency(request) -> int:
    """Get examples of frequencies."""
    return request.param


@fixture(params=[{}, {"01": 0.0, "23c": 100.1}])
def weights(request) -> Dict[str, int]:
    """Get examples of weights."""
    return request.param


@fixture
def schema() -> WorkloadSchema:
    """Return a real Workload schema."""
    return WorkloadSchema()


@fixture
def detailed_schema() -> DetailedWorkloadSchema:
    """Return a real Workload schema."""
    return DetailedWorkloadSchema()


class TestWorkloadSchema:
    """Tests for the Workload schema."""

    def test_creates(self, schema: WorkloadSchema):
        """A Workload schema can be created."""
        assert schema

    def test_deserializes(
        self, schema: WorkloadSchema, folder_name: str, frequency: int
    ):
        """A Workload schema can create a Workload model."""
        interface: WorkloadInterface = {
            "folder_name": folder_name,
            "frequency": frequency,
        }
        deserialized: WorkloadInterface = schema.load(interface)
        workload = Workload(**deserialized)
        assert folder_name == workload.folder_name == deserialized["folder_name"]
        assert frequency == workload.frequency == deserialized["frequency"]

    def test_serializes(self, schema: WorkloadSchema, folder_name: str, frequency: int):
        """A Workload model can be serialized with a Workload schema."""
        interface: WorkloadInterface = {
            "folder_name": folder_name,
            "frequency": frequency,
        }
        workload = Workload(**interface)
        serialized = schema.dump(workload)
        assert folder_name == workload.folder_name == serialized["folder_name"]
        assert frequency == workload.frequency == serialized["frequency"]


class TestDetailedWorkloadSchema:
    """Tests for the DetailedWorkload schema."""

    def test_creates(self, detailed_schema: DetailedWorkloadSchema):
        """A DetailedWorkload schema can be created."""
        assert schema

    def test_deserializes(
        self,
        detailed_schema: DetailedWorkloadSchema,
        folder_name: str,
        frequency: int,
        weights: Dict[str, float],
    ):
        """A DetailedWorkload schema can create a DetailedWorkload model."""
        interface: DetailedWorkloadInterface = {
            "folder_name": folder_name,
            "frequency": frequency,
            "weights": weights,
        }
        deserialized: DetailedWorkloadInterface = detailed_schema.load(interface)
        workload = DetailedWorkload(**deserialized)
        assert folder_name == workload.folder_name == deserialized["folder_name"]
        assert frequency == workload.frequency == deserialized["frequency"]
        assert weights == workload.weights == deserialized["weights"]

    def test_serializes(
        self,
        detailed_schema: DetailedWorkloadSchema,
        folder_name: str,
        frequency: int,
        weights: Dict[str, float],
    ):
        """A DetailedWorkload model can be serialized with a DetailedWorkload schema."""
        interface: DetailedWorkloadInterface = {
            "folder_name": folder_name,
            "frequency": frequency,
            "weights": weights,
        }
        workload = DetailedWorkload(**interface)
        serialized: DetailedWorkloadInterface = detailed_schema.dump(workload)
        assert folder_name == workload.folder_name == serialized["folder_name"]
        assert frequency == workload.frequency == serialized["frequency"]
        assert weights == workload.weights == serialized["weights"]

"""Tests for the Workload schema."""

from typing import Dict

from pytest import fixture

from hyrisecockpit.api.app.workload.interface import (
    DetailedWorkloadInterface,
    WorkloadInterface,
)
from hyrisecockpit.api.app.workload.model import DetailedWorkload, Workload
from hyrisecockpit.api.app.workload.schema import DetailedWorkloadSchema, WorkloadSchema


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
def schema() -> WorkloadSchema:
    """Return a Workload schema."""
    return WorkloadSchema()


@fixture
def detailed_schema() -> DetailedWorkloadSchema:
    """Return a detailed Workload schema."""
    return DetailedWorkloadSchema()


class TestWorkloadSchema:
    """Tests for the Workload schema."""

    def test_creates(self, schema: WorkloadSchema):
        """A Workload schema can be created."""
        assert schema

    def test_deserializes(
        self,
        schema: WorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
    ):
        """A Workload schema can create a Workload model."""
        interface: WorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
        }
        deserialized: WorkloadInterface = schema.load(interface)
        workload = Workload(**deserialized)
        assert workload_type == workload.workload_type == deserialized["workload_type"]
        assert frequency == workload.frequency == deserialized["frequency"]
        assert scale_factor == workload.scale_factor == deserialized["scale_factor"]

    def test_serializes(
        self,
        schema: WorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
    ):
        """A Workload model can be serialized with a Workload schema."""
        interface: WorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
        }
        workload = Workload(**interface)
        serialized = schema.dump(workload)
        assert workload_type == workload.workload_type == serialized["workload_type"]
        assert frequency == workload.frequency == serialized["frequency"]
        assert scale_factor == workload.scale_factor == serialized["scale_factor"]


class TestDetailedWorkloadSchema:
    """Tests for the DetailedWorkload schema."""

    def test_creates(self, detailed_schema: DetailedWorkloadSchema):
        """A DetailedWorkload schema can be created."""
        assert schema

    def test_deserializes(
        self,
        detailed_schema: DetailedWorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
        running: bool,
    ):
        """A DetailedWorkload schema can create a DetailedWorkload model."""
        interface: DetailedWorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
            "weights": weights,
            "running": running,
        }
        deserialized: DetailedWorkloadInterface = detailed_schema.load(interface)
        workload = DetailedWorkload(**deserialized)
        assert workload_type == workload.workload_type == deserialized["workload_type"]
        assert frequency == workload.frequency == deserialized["frequency"]
        assert scale_factor == workload.scale_factor == deserialized["scale_factor"]
        assert weights == workload.weights == deserialized["weights"]
        assert running == workload.running == deserialized["running"]

    def test_serializes(
        self,
        detailed_schema: DetailedWorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
        running: bool,
    ):
        """A DetailedWorkload model can be serialized with a DetailedWorkload schema."""
        interface: DetailedWorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
            "weights": weights,
            "running": running,
        }
        workload = DetailedWorkload(**interface)
        serialized: DetailedWorkloadInterface = detailed_schema.dump(workload)
        assert workload_type == workload.workload_type == serialized["workload_type"]
        assert frequency == workload.frequency == serialized["frequency"]
        assert scale_factor == workload.scale_factor == serialized["scale_factor"]
        assert weights == workload.weights == serialized["weights"]
        assert running == workload.running == serialized["running"]

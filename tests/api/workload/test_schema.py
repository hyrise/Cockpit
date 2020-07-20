"""Tests for the Workload schema."""

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
from hyrisecockpit.api.app.workload.schema import (
    BaseWorkloadSchema,
    DetailedWorkloadSchema,
    WorkloadSchema,
)


@fixture(params=["tpch"])
def workload_type(request) -> str:
    """Get examples of workload types."""
    return request.param


@fixture(params=[0])
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


@fixture(params=[[0.1, 1.0]])
def supported_scale_factors(request) -> int:
    """Get examples of scale-factor."""
    return request.param


@fixture(params=[{}, {"01": 1.0, "23c": 1.0}])
def default_weights(request) -> Dict[str, int]:
    """Get examples of weights."""
    return request.param


#####
@fixture
def base_schema() -> BaseWorkloadSchema:
    """Return abase Workload schema."""
    return BaseWorkloadSchema()


@fixture
def schema() -> WorkloadSchema:
    """Return a Workload schema."""
    return WorkloadSchema()


@fixture
def detailed_schema() -> DetailedWorkloadSchema:
    """Return a detailed Workload schema."""
    return DetailedWorkloadSchema()


class TestBaseWorkloadSchema:
    """Tests for the base Workload schema."""

    def test_creates(self, base_schema: BaseWorkloadSchema):
        """A base Workload schema can be created."""
        assert base_schema

    def test_deserializes(
        self,
        base_schema: BaseWorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
    ):
        """A base Workload schema can create a base Workload model."""
        interface: BaseWorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
            "weights": weights,
        }
        deserialized: BaseWorkloadInterface = base_schema.load(interface)
        workload = BaseWorkload(**deserialized)
        assert workload_type == workload.workload_type == deserialized["workload_type"]
        assert frequency == workload.frequency == deserialized["frequency"]
        assert scale_factor == workload.scale_factor == deserialized["scale_factor"]
        assert weights == workload.weights == deserialized["weights"]

    def test_serializes(
        self,
        base_schema: BaseWorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
    ):
        """A base Workload model can be serialized with a base Workload schema."""
        interface: BaseWorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
            "weights": weights,
        }
        workload = BaseWorkload(**interface)
        serialized = base_schema.dump(workload)
        assert workload_type == workload.workload_type == serialized["workload_type"]
        assert frequency == workload.frequency == serialized["frequency"]
        assert scale_factor == workload.scale_factor == serialized["scale_factor"]
        assert weights == workload.weights == serialized["weights"]


class TestWorkloadSchema:
    """Tests for the Workload schema."""

    def test_creates(self, schema: WorkloadSchema):
        """A DetailedWorkload schema can be created."""
        assert schema

    def test_deserializes(
        self,
        schema: WorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
        running: bool,
    ):
        """A DetailedWorkload schema can create a DetailedWorkload model."""
        interface: WorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
            "weights": weights,
            "running": running,
        }
        deserialized: WorkloadInterface = schema.load(interface)
        workload = Workload(**deserialized)
        assert workload_type == workload.workload_type == deserialized["workload_type"]
        assert frequency == workload.frequency == deserialized["frequency"]
        assert scale_factor == workload.scale_factor == deserialized["scale_factor"]
        assert weights == workload.weights == deserialized["weights"]
        assert running == workload.running == deserialized["running"]

    def test_serializes(
        self,
        schema: WorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
        running: bool,
    ):
        """A DetailedWorkload model can be serialized with a DetailedWorkload schema."""
        interface: WorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
            "weights": weights,
            "running": running,
        }
        workload = Workload(**interface)
        serialized: WorkloadInterface = schema.dump(workload)
        assert workload_type == workload.workload_type == serialized["workload_type"]
        assert frequency == workload.frequency == serialized["frequency"]
        assert scale_factor == workload.scale_factor == serialized["scale_factor"]
        assert weights == workload.weights == serialized["weights"]
        assert running == workload.running == serialized["running"]


class TestDetailedWorkloadSchema:
    """Tests for the Workload schema."""

    def test_creates(self, detailed_schema: DetailedWorkloadSchema):
        """A DetailedWorkload schema can be created."""
        assert detailed_schema

    def test_deserializes(
        self,
        detailed_schema: DetailedWorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
        running: bool,
        supported_scale_factors: List,
        default_weights: Dict,
    ):
        """A DetailedWorkload schema can create a DetailedWorkload model."""
        interface: DetailedWorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
            "weights": weights,
            "running": running,
            "supported_scale_factors": supported_scale_factors,
            "default_weights": default_weights,
        }
        deserialized: DetailedWorkloadInterface = detailed_schema.load(interface)
        workload = DetailedWorkload(**deserialized)
        assert workload_type == workload.workload_type == deserialized["workload_type"]
        assert frequency == workload.frequency == deserialized["frequency"]
        assert scale_factor == workload.scale_factor == deserialized["scale_factor"]
        assert weights == workload.weights == deserialized["weights"]
        assert running == workload.running == deserialized["running"]
        assert (
            supported_scale_factors
            == workload.supported_scale_factors
            == deserialized["supported_scale_factors"]
        )
        assert (
            default_weights
            == workload.default_weights
            == deserialized["default_weights"]
        )

    def test_serializes(
        self,
        detailed_schema: DetailedWorkloadSchema,
        workload_type: str,
        frequency: int,
        scale_factor: float,
        weights: Dict[str, float],
        running: bool,
        supported_scale_factors: List,
        default_weights: Dict,
    ):
        """A DetailedWorkload model can be serialized with a DetailedWorkload schema."""
        interface: DetailedWorkloadInterface = {
            "workload_type": workload_type,
            "frequency": frequency,
            "scale_factor": scale_factor,
            "weights": weights,
            "running": running,
            "supported_scale_factors": supported_scale_factors,
            "default_weights": default_weights,
        }
        workload = DetailedWorkload(**interface)
        serialized: DetailedWorkloadInterface = detailed_schema.dump(workload)
        assert workload_type == workload.workload_type == serialized["workload_type"]
        assert frequency == workload.frequency == serialized["frequency"]
        assert scale_factor == workload.scale_factor == serialized["scale_factor"]
        assert weights == workload.weights == serialized["weights"]
        assert running == workload.running == serialized["running"]
        assert (
            supported_scale_factors
            == workload.supported_scale_factors
            == serialized["supported_scale_factors"]
        )
        assert (
            default_weights == workload.default_weights == serialized["default_weights"]
        )

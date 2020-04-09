"""Tests for the Workload schema."""

from pytest import fixture, mark

from hyrisecockpit.api.app.workload.interface import WorkloadInterface
from hyrisecockpit.api.app.workload.model import Workload
from hyrisecockpit.api.app.workload.schema import WorkloadSchema


@fixture
def schema() -> WorkloadSchema:
    """Return a real Workload schema."""
    return WorkloadSchema()


class TestWorkloadSchema:
    """Tests for the Workload schema."""

    def test_creates(self, schema: WorkloadSchema):
        """A Workload schema can be created."""
        assert schema

    @mark.parametrize("workload_id", ["workload0"])
    @mark.parametrize("folder_name", ["tpch_0.1", "tpcds_1", "job"])
    @mark.parametrize("frequency", [0, 1, 100])
    def test_deserializes(
        self, schema: WorkloadSchema, workload_id: str, folder_name: str, frequency: int
    ):
        """A Workload schema can create a Workload model."""
        interface: WorkloadInterface = {
            "workload_id": workload_id,
            "folder_name": folder_name,
            "frequency": frequency,
        }
        deserialized: WorkloadInterface = schema.load(interface)
        workload = Workload(**deserialized)
        assert workload_id == workload.workload_id == deserialized["workload_id"]
        assert folder_name == workload.folder_name == deserialized["folder_name"]
        assert frequency == workload.frequency == deserialized["frequency"]

    @mark.parametrize("workload_id", ["workload0"])
    @mark.parametrize("folder_name", ["tpch_0.1", "tpcds_1", "job"])
    @mark.parametrize("frequency", [0, 1, 100])
    def test_serializes(
        self, schema: WorkloadSchema, workload_id: str, folder_name: str, frequency: int
    ):
        """A Workload model can be serialized with a Workload schema."""
        interface: WorkloadInterface = {
            "workload_id": workload_id,
            "folder_name": folder_name,
            "frequency": frequency,
        }
        workload = Workload(**interface)
        serialized = schema.dump(workload)
        assert workload_id == workload.workload_id == serialized["workload_id"]
        assert folder_name == workload.folder_name == serialized["folder_name"]
        assert frequency == workload.frequency == serialized["frequency"]

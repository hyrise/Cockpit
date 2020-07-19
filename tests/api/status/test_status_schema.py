"""Tests for the status schema's."""

from hyrisecockpit.api.app.status.model import (
    DatabaseStatus,
    FailedQuery,
    FailedTask,
    LoadedTables,
    LoadedWorkload,
    WorkloadStatus,
)
from hyrisecockpit.api.app.status.schema import (
    DatabaseStatusSchema,
    FailedQuerySchema,
    FailedTaskSchema,
    LoadedTablesSchema,
    LoadedWorkloadSchema,
    WorkloadStatusSchema,
)


class TestStatusSchema:
    """Tests for the status schema's."""

    def test_creates_database_status_schema(self) -> None:
        """A DatabaseStatusSchema schema can be created."""
        assert DatabaseStatusSchema()

    def test_creates_loaded_tables_schema(self) -> None:
        """A LoadedTablesSchema schema can be created."""
        assert LoadedTablesSchema()

    def test_creates_loaded_workload_schema(self) -> None:
        """A LoadedWorkloadSchema schema can be created."""
        assert LoadedWorkloadSchema()

    def test_creates_workload_status_schema(self) -> None:
        """A WorkloadStatusSchema schema can be created."""
        assert WorkloadStatusSchema()

    def test_creates_failed_query_schema(self) -> None:
        """A FailedQuerySchema schema can be created."""
        assert FailedQuerySchema()

    def test_creates_failed_task_schema(self) -> None:
        """A FailedTaskSchema schema can be created."""
        assert FailedTaskSchema()

    def test_serializes_database_status_schema(self) -> None:
        """A DatabaseStatusSchema schema can be serialized."""
        interface = {
            "id": "SomeID",
            "database_blocked_status": False,
            "worker_pool_status": "running",
            "hyrise_active": False,
        }
        database_status = DatabaseStatus(**interface)  # type: ignore
        serialized = DatabaseStatusSchema().dump(database_status)
        assert serialized == interface == vars(database_status)

    def test_serializes_loaded_table_schema(self) -> None:
        """A LoadedWorkloadSchema schema can be serialized."""
        interface = {
            "workload_type": "tpch",
            "scale_factor": 1.0,
            "loaded_tables": ["a", "b"],
        }
        loaded_workload = LoadedTables(**interface)  # type: ignore
        serialized = LoadedTablesSchema().dump(loaded_workload)
        assert serialized == interface

    def test_serializes_loaded_workload_schema(self) -> None:
        """A LoadedWorkloadSchema schema can be serialized."""
        interface = {"workload_type": "tpch", "scale_factor": 1.0}
        loaded_workload = LoadedWorkload(**interface)  # type: ignore
        serialized = LoadedWorkloadSchema().dump(loaded_workload)
        assert serialized == interface

    def test_serializes_workload_status_schema(self) -> None:
        """A BenchmarkStatusSchema schema can be serialized."""
        interface = {
            "id": "SomeID",
            "loaded_workloads": [
                LoadedWorkload(workload_type="tpch", scale_factor=1.0),
                LoadedWorkload(workload_type="tpcds", scale_factor=0.1),
            ],
            "loaded_tables": [
                LoadedTables(
                    workload_type="tpch", scale_factor=1.0, loaded_tables=["a", "b"]
                ),
                LoadedTables(
                    workload_type="tpcds", scale_factor=0.1, loaded_tables=["c", "d"]
                ),
            ],
        }
        expected = {
            "id": "SomeID",
            "loaded_workloads": [
                {"workload_type": "tpch", "scale_factor": 1.0},
                {"workload_type": "tpcds", "scale_factor": 0.1},
            ],
            "loaded_tables": [
                {
                    "workload_type": "tpch",
                    "scale_factor": 1.0,
                    "loaded_tables": ["a", "b"],
                },
                {
                    "workload_type": "tpcds",
                    "scale_factor": 0.1,
                    "loaded_tables": ["c", "d"],
                },
            ],
        }
        workload_status = WorkloadStatus(**interface)  # type: ignore
        serialized = WorkloadStatusSchema().dump(workload_status)
        assert serialized == expected

    def test_serializes_failed_query_schema(self) -> None:
        """A FailedQuerySchema schema can be serialized."""
        interface = {
            "time": "42",
            "worker_id": "Im a worker",
            "task": "drink beer",
            "error": "to drunk",
        }
        failed_query = FailedQuery(**interface)
        serialized = FailedQuerySchema().dump(failed_query)
        assert serialized == interface == vars(failed_query)

    def test_serializes_failed_task_schema(self) -> None:
        """A FailedTaskSchema schema can be serialized."""
        failed_query_interface = {
            "time": "42",
            "worker_id": "Im a worker",
            "task": "drink more beer",
            "error": "even more drunk",
        }
        interface = {"id": "SomeID", "failed_queries": [failed_query_interface]}
        failed_tesk = FailedTask(**interface)  # type: ignore
        serialized = FailedTaskSchema().dump(failed_tesk)
        assert serialized == interface == vars(failed_tesk)

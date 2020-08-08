"""Tests for the status schema's."""

from hyrisecockpit.api.app.status.model import (
    DatabaseStatus,
    FailedQuery,
    FailedTask,
    TablesStatus,
    WorkloadTablesStatus,
)
from hyrisecockpit.api.app.status.schema import (
    DatabaseStatusSchema,
    FailedQuerySchema,
    FailedTaskSchema,
    TablesStatusSchema,
    WorkloadTablesStatusSchema,
)


class TestStatusSchema:
    """Tests for the status schema's."""

    def test_creates_database_status_schema(self) -> None:
        """A DatabaseStatusSchema can be created."""
        assert DatabaseStatusSchema()

    def test_creates_workload_tables_status_schema(self) -> None:
        """A WorkloadTablesStatusSchema can be created."""
        assert WorkloadTablesStatusSchema()

    def test_creates_tables_status_schema(self) -> None:
        """A TablesStatusSchema can be created."""
        assert TablesStatusSchema()

    def test_creates_failed_query_schema(self) -> None:
        """A FailedQuerySchema can be created."""
        assert FailedQuerySchema()

    def test_creates_failed_task_schema(self) -> None:
        """A FailedTaskSchema can be created."""
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

    def test_serializes_tables_status_schema(self) -> None:
        """A TablesStatusSchema can be serialized."""
        interface = {
            "workload_type": "tpch",
            "scale_factor": 1.0,
            "loaded_tables": ["a", "b"],
            "missing_tables": ["c", "d"],
            "completely_loaded": False,
            "database_representation": {"a": "a_1", "b": "b_1", "c": "c_1", "d": "d_1"},
        }
        loaded_workload = TablesStatus(**interface)  # type: ignore
        serialized = TablesStatusSchema().dump(loaded_workload)
        assert serialized == interface

    def test_serializes_workload_table_status_schema(self) -> None:
        """A WorkloadTablesSchema can be serialized."""
        workload_tables_status_interface = {
            "workload_type": "tpch",
            "scale_factor": 1.0,
            "loaded_tables": ["a", "b"],
            "missing_tables": ["c", "d"],
            "completely_loaded": False,
            "database_representation": {"a": "a_1", "b": "b_1", "c": "c_1", "d": "d_1"},
        }
        interface = {
            "id": "SomeID",
            "workload_tables_status": [
                TablesStatus(**workload_tables_status_interface)  # type: ignore
            ],
        }
        expected = {
            "id": "SomeID",
            "workload_tables_status": [workload_tables_status_interface],
        }
        workload_status = WorkloadTablesStatus(**interface)  # type: ignore
        serialized = WorkloadTablesStatusSchema().dump(workload_status)
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

"""Tests for the status schema's."""

from hyrisecockpit.api.app.status.model import (
    BenchmarkStatus,
    DatabaseStatus,
    FailedQuery,
    FailedTask,
)
from hyrisecockpit.api.app.status.schema import (
    BenchmarkStatusSchema,
    DatabaseStatusSchema,
    FailedQuerySchema,
    FailedTaskSchema,
)


class TestStatusSchema:
    """Tests for the status schema's."""

    def test_creates_database_status_schema(self) -> None:
        """A DatabaseStatusSchema schema can be created."""
        assert DatabaseStatusSchema()

    def test_creates_benchmark_status_schema(self) -> None:
        """A BenchmarkStatusSchema schema can be created."""
        assert BenchmarkStatusSchema()

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

    def test_serializes_benchmark_status_schema(self) -> None:
        """A BenchmarkStatusSchema schema can be serialized."""
        interface = {
            "id": "SomeID",
            "loaded_benchmarks": ["tpch", "hcpt"],
            "loaded_tables": ["tpch_0_1"],
        }
        benchmark_status = BenchmarkStatus(**interface)  # type: ignore
        serialized = BenchmarkStatusSchema().dump(benchmark_status)
        assert serialized == interface == vars(benchmark_status)

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

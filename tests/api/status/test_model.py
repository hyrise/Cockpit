"""Tests for the status models."""

from hyrisecockpit.api.app.status.model import (
    BenchmarkStatus,
    DatabaseStatus,
    FailedQuery,
    FailedTask,
    HyriseStatus,
)


class TestStatusModel:
    """Tests for status models."""

    def test_creates_hyris_status(self) -> None:
        """A HyriseStatus model can be created."""
        assert HyriseStatus(id="db", hyrise_active=True)

    def test_creates_database_status(self) -> None:
        """A DatabaseStatus model can be created."""
        assert DatabaseStatus(
            id="db", database_blocked_status=True, worker_pool_status="running"
        )

    def test_creates_benchmark_status(self) -> None:
        """A BenchmarkStatus model can be created."""
        assert BenchmarkStatus(
            id="db", loaded_benchmarks=["tpch"], loaded_tables=["tpch_1"]
        )

    def test_creates_failed_query(self) -> None:
        """A FailedQuery model can be created."""
        assert FailedQuery(
            time="42", worker_id="1", task="drink wine", error="more wine"
        )

    def test_creates_failed_task(self) -> None:
        """A FailedTask model can be created."""
        assert FailedTask(
            id="42",
            failed_queries=[
                FailedQuery(
                    time="42", worker_id="1", task="drink wine", error="more wine"
                )
            ],
        )

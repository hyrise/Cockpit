"""Tests for the status models."""

from hyrisecockpit.api.app.status.model import (
    DatabaseStatus,
    FailedQuery,
    FailedTask,
    LoadedTables,
    LoadedWorkload,
    WorkloadStatus,
)


class TestStatusModel:
    """Tests for status models."""

    def test_creates_database_status(self) -> None:
        """A DatabaseStatus model can be created."""
        assert DatabaseStatus(
            id="db",
            database_blocked_status=True,
            worker_pool_status="running",
            hyrise_active=True,
        )

    def test_creates_loaded_workload(self) -> None:
        """A LoadedWorkload model can be created."""
        assert LoadedWorkload(workload_type="tpch", scale_factor=1.0)

    def test_creates_loaded_tables(self) -> None:
        """A LoadedTables model can be created."""
        assert LoadedTables(
            workload_type="tpch", scale_factor=1.0, loaded_tables=["a", "b"]
        )

    def test_creates_workload_status(self) -> None:
        """A WorkloadStatus model can be created."""
        assert WorkloadStatus(
            id="db",
            loaded_workloads=[LoadedWorkload(workload_type="tpch", scale_factor=1.0)],
            loaded_tables=[
                LoadedTables(
                    workload_type="tpch", scale_factor=1.0, loaded_tables=["a", "b"]
                )
            ],
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

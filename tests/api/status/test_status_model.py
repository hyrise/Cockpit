"""Tests for the status models."""

from hyrisecockpit.api.app.status.model import (
    DatabaseStatus,
    FailedQuery,
    FailedTask,
    TablesStatus,
    WorkloadTablesStatus,
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

    def test_creates_tables_status(self) -> None:
        """A TablesStatus model can be created."""
        assert TablesStatus(
            workload_type="tpch",
            scale_factor=1.0,
            loaded_tables=["a", "b"],
            missing_tables=["c", "d"],
            completely_loaded=False,
            database_representation={"a": "a_1", "b": "b_1", "c": "c_1", "d": "d_1"},
        )

    def test_creates_worklaod_tables_status(self) -> None:
        """A WorkloadTablesStatus model can be created."""
        assert WorkloadTablesStatus(
            id="db",
            workload_tables_status=[
                TablesStatus(
                    workload_type="tpch",
                    scale_factor=1.0,
                    loaded_tables=["a", "b"],
                    missing_tables=["c", "d"],
                    completely_loaded=False,
                    database_representation={
                        "a": "a_1",
                        "b": "b_1",
                        "c": "c_1",
                        "d": "d_1",
                    },
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

"""Tests for the database models."""
from pytest import fixture

from hyrisecockpit.api.app.database.model import (
    AvailableWorkloadTables,
    Database,
    DetailedDatabase,
    WorkloadTables,
)

database_one_parms = {
    "id": "Bibi",
    "host": "Tina",
    "port": "1991",
    "number_workers": 2,
    "dbname": "Amadeus",
    "user": "Falko von Falkenstein",
    "password": "Bibi und Tina",
}

database_two_parms = {
    "id": "Ricky",
    "host": "Julian",
    "port": "1999",
    "number_workers": 10,
    "dbname": "Bubbles",
    "user": "Ray",
    "password": "Trailer Park Boys",
}


@fixture(params=["Tina", "Bibi"])
def database(request) -> Database:
    """Return a Database model."""
    return Database(id=request.param)


@fixture(params=[database_one_parms, database_two_parms])
def detailed_database(request) -> DetailedDatabase:
    """Return a detailed Database model."""
    return DetailedDatabase(**request.param)


@fixture(
    params=[
        {
            "workload_tables": [
                {"workload_type": "tpcz", "scale_factor": 1.0},
                {"workload_type": "tpcds", "scale_factor": 0.1},
            ]
        }
    ]
)
def available_workload_tables(request) -> AvailableWorkloadTables:
    """Return a available workload tables model."""
    return AvailableWorkloadTables(**request.param)


@fixture(params=[{"workload_type": "tpcz", "scale_factor": 1.0}])
def workload_tables(request) -> WorkloadTables:
    """Return a workload tables model."""
    return WorkloadTables(**request.param)


class TestDatabaseModel:
    """Tests for database models."""

    def test_creates_database(self, database: Database) -> None:
        """A database model can be created."""
        assert database

    def test_creates_detailed_database(
        self, detailed_database: DetailedDatabase
    ) -> None:
        """A detailed database model can be created."""
        assert detailed_database

    def test_creates_available_workload_tables(
        self, available_workload_tables: AvailableWorkloadTables
    ) -> None:
        """A available benchmark tables model can be created."""
        assert available_workload_tables

    def test_creates_workload_tables(self, workload_tables: WorkloadTables) -> None:
        """A benchmark table model can be created."""
        assert workload_tables

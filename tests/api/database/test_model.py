"""Tests for the database models."""
from copy import deepcopy

from pytest import fixture

from hyrisecockpit.api.app.database.interface import (
    AvailableBenchmarkTablesInterface,
    BenchmarkTablesInterface,
    DatabaseInterface,
    DetailedDatabaseInterface,
)
from hyrisecockpit.api.app.database.model import (
    AvailableBenchmarkTables,
    BenchmarkTables,
    Database,
    DetailedDatabase,
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
    """Return a real Database model."""
    return Database(id=request.param)


@fixture(params=[database_one_parms, database_two_parms])
def detailed_database(request) -> DetailedDatabase:
    """Return a real detailed Database model."""
    return DetailedDatabase(**request.param)


@fixture(
    params=[
        ["A database professional walks into a bar", "And joins two tables"],
        ["Albert", "Craftsteine"],
    ]
)
def available_benchmark_tables(request) -> AvailableBenchmarkTables:
    """Return a real available benchmark tables model."""
    return AvailableBenchmarkTables(folder_names=request.param)


@fixture(params=[["where are the tables"], ["Are you there?"]])
def benchmark_tables(request) -> BenchmarkTables:
    """Return a real benchmark tables model."""
    return BenchmarkTables(folder_name=request.param)


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

    def test_creates_available_benchmark_tables(
        self, available_benchmark_tables: AvailableBenchmarkTables
    ) -> None:
        """A available benchmark tables model can be created."""
        assert available_benchmark_tables

    def test_creates_benchmark_tables(self, benchmark_tables: BenchmarkTables) -> None:
        """A benchmark table model can be created."""
        assert benchmark_tables

    def test_updates_database(self, database: Database) -> None:
        """A Database model can be updated."""
        new_id = "some_creativ_new_id"
        database.update(DatabaseInterface(id=new_id))
        assert new_id == database.id

    def test_updates_detailed_database(
        self, detailed_database: DetailedDatabase
    ) -> None:
        """A detailed Database model can be updated."""
        old_detailed_database_attributes = deepcopy(vars(detailed_database))
        detailed_database.update(
            DetailedDatabaseInterface(
                id="lowrise",
                host="linux",
                port="666",
                number_workers=42,
                dbname="post",
                user="Alex",
                password="1234",
            )
        )
        new_detailed_database_attributes = vars(detailed_database)
        assert old_detailed_database_attributes != new_detailed_database_attributes
        assert "lowrise" == detailed_database.id

    def test_updates_available_benchmark_tables(
        self, available_benchmark_tables: AvailableBenchmarkTables
    ) -> None:
        """A available benchmark table model can be updated."""
        new_folder_names = ["some_creativ_new_folder_name"]
        available_benchmark_tables.update(
            AvailableBenchmarkTablesInterface(folder_names=new_folder_names)
        )
        assert new_folder_names == available_benchmark_tables.folder_names

    def test_updates_benchmark_tables(self, benchmark_tables: BenchmarkTables) -> None:
        """A benchmark table model can be updated."""
        new_folder = "some_creativ_new_folder_name"
        benchmark_tables.update(BenchmarkTablesInterface(folder_name=new_folder))
        assert new_folder == benchmark_tables.folder_name

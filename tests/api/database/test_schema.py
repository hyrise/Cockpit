"""Tests for the database schema's."""

from pytest import fixture, mark

from hyrisecockpit.api.app.database.interface import (
    AvailableBenchmarkTablesInterface,
    DatabaseInterface,
    DetailedDatabaseInterface,
)
from hyrisecockpit.api.app.database.model import (
    AvailableBenchmarkTables,
    Database,
    DetailedDatabase,
)
from hyrisecockpit.api.app.database.schema import (
    AvailableBenchmarkTablesSchema,
    BenchmarkTablesSchema,
    DatabaseSchmea,
    DetailedDatabaseSchema,
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


@fixture
def database_schema() -> DatabaseSchmea:
    """Return a real database schema."""
    return DatabaseSchmea()


@fixture
def detailed_database_schema() -> DetailedDatabaseSchema:
    """Return a real detailed database schema."""
    return DetailedDatabaseSchema()


@fixture
def available_benchmark_tables_schema() -> AvailableBenchmarkTablesSchema:
    """Return a real available benchmark tables schema."""
    return AvailableBenchmarkTablesSchema()


@fixture
def benchmark_tables_schema() -> BenchmarkTablesSchema:
    """Return a real benchmark tables schema."""
    return BenchmarkTablesSchema()


class TestDatabaseSchema:
    """Tests for the database schema's."""

    def test_creates_database_schema(self, database_schema: DatabaseSchmea) -> None:
        """A database schema can be created."""
        assert database_schema

    def test_creates_detailed_database_schema(
        self, detailed_database_schema: DetailedDatabaseSchema
    ) -> None:
        """A detailed database schema can be created."""
        assert detailed_database_schema

    def test_creates_available_benchmark_tables_schema(
        self, available_benchmark_tables_schema: AvailableBenchmarkTablesSchema
    ) -> None:
        """A available benchmark tables schema can be created."""
        assert AvailableBenchmarkTablesSchema

    def test_creates_benchmark_tables_schema(
        self, benchmark_tables_schema: BenchmarkTablesSchema
    ) -> None:
        """A benchmark tables schema can be created."""
        assert benchmark_tables_schema

    @mark.parametrize("database_id", ["Tina", "Bibi"])
    def test_deserializes_database_schema(
        self, database_schema: DatabaseSchmea, database_id: str
    ) -> None:
        """A database schema can create a database model."""
        interface: DatabaseInterface = {"id": database_id}
        database: Database = database_schema.load(interface)
        assert isinstance(database, Database)
        assert database.id == database_id

    @mark.parametrize(
        "detailed_database_interface", [database_one_parms, database_two_parms]
    )
    def test_deserializes_detailed_database_schema(
        self,
        detailed_database_schema: DetailedDatabaseSchema,
        detailed_database_interface: DetailedDatabaseInterface,
    ) -> None:
        """A detailed database schema can create a database model."""
        detailed_database: DetailedDatabase = detailed_database_schema.load(
            detailed_database_interface
        )
        assert isinstance(detailed_database, DetailedDatabase)
        assert vars(detailed_database) == detailed_database_interface

    @mark.parametrize(
        "available_benchmark_tables_interface",
        [{"folder_names": ["hallo", "world"]}, {"folder_names": ["ping", "pong"]}],
    )
    def test_deserializes_available_benchmark_tables_schema(
        self,
        available_benchmark_tables_schema: AvailableBenchmarkTablesSchema,
        available_benchmark_tables_interface: AvailableBenchmarkTablesInterface,
    ) -> None:
        """A available benchmark tables schema can create a database model."""
        available_benchmark_tables: AvailableBenchmarkTables = available_benchmark_tables_schema.load(
            available_benchmark_tables_interface
        )
        assert isinstance(available_benchmark_tables, AvailableBenchmarkTables)
        assert vars(available_benchmark_tables) == available_benchmark_tables_interface

"""Tests for the database schema's."""

from pytest import fixture, mark

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
from hyrisecockpit.api.app.database.schema import (
    AvailableBenchmarkTablesSchema,
    BenchmarkTablesSchema,
    DatabaseSchema,
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
def database_schema() -> DatabaseSchema:
    """Return a real database schema."""
    return DatabaseSchema()


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

    def test_creates_database_schema(self, database_schema: DatabaseSchema) -> None:
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
        assert available_benchmark_tables_schema

    def test_creates_benchmark_tables_schema(
        self, benchmark_tables_schema: BenchmarkTablesSchema
    ) -> None:
        """A benchmark tables schema can be created."""
        assert benchmark_tables_schema

    @mark.parametrize("database_id", ["Tina", "Bibi"])
    def test_deserializes_database_schema(
        self, database_schema: DatabaseSchema, database_id: str
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

    @mark.parametrize(
        "benchmark_tables_interface", [{"folder_name": "Tina"}, {"folder_name": "Bibi"}]
    )
    def test_deserializes_benchmark_tables_schema(
        self,
        benchmark_tables_schema: BenchmarkTablesSchema,
        benchmark_tables_interface: BenchmarkTablesInterface,
    ) -> None:
        """A benchmark tables schema can create a database model."""
        benchmark_tables = benchmark_tables_schema.load(benchmark_tables_interface)
        assert isinstance(benchmark_tables, BenchmarkTables)
        assert vars(benchmark_tables) == benchmark_tables_interface

    @mark.parametrize("database_interface", [{"id": "Tina"}, {"id": "Bibi"}])
    def test_serializes_database(
        self, database_schema: DatabaseSchema, database_interface: DatabaseInterface
    ) -> None:
        """A database model can be serialized with a database schema."""
        database: Database = Database(**database_interface)
        serialized = database_schema.dump(database)
        assert vars(database) == serialized == database_interface

    @mark.parametrize(
        "detailed_database_interface", [database_one_parms, database_two_parms]
    )
    def test_serializes_detailed_database(
        self,
        detailed_database_schema: DetailedDatabaseSchema,
        detailed_database_interface: DetailedDatabaseInterface,
    ) -> None:
        """A detailed database model can be serialized with a detailed database schema."""
        detailed_database: DetailedDatabase = DetailedDatabase(
            **detailed_database_interface
        )
        serialized = detailed_database_schema.dump(detailed_database)
        assert vars(detailed_database) == serialized == detailed_database_interface

    @mark.parametrize(
        "available_benchmark_tables_interface",
        [{"folder_names": ["hallo", "world"]}, {"folder_names": ["ping", "pong"]}],
    )
    def test_serializes_available_benchmark_tables(
        self,
        available_benchmark_tables_schema: AvailableBenchmarkTablesSchema,
        available_benchmark_tables_interface: AvailableBenchmarkTablesInterface,
    ) -> None:
        """A available benchmark tables model can be serialized with a available benchmark tables schema."""
        available_benchmark_tables: AvailableBenchmarkTables = AvailableBenchmarkTables(
            **available_benchmark_tables_interface
        )
        serialized = available_benchmark_tables_schema.dump(available_benchmark_tables)
        assert (
            vars(available_benchmark_tables)
            == serialized
            == available_benchmark_tables_interface
        )

    @mark.parametrize(
        "benchmark_tables_interface", [{"folder_name": "Tina"}, {"folder_name": "Bibi"}]
    )
    def test_serializes_benchmark_tables(
        self,
        benchmark_tables_schema: BenchmarkTablesSchema,
        benchmark_tables_interface: BenchmarkTablesInterface,
    ) -> None:
        """A benchmark_tables dictionary can be serialized with a benchmark tables schema."""
        benchmark_tables: BenchmarkTables = BenchmarkTables(
            **benchmark_tables_interface
        )
        serialized = benchmark_tables_schema.dump(benchmark_tables_interface)
        assert vars(benchmark_tables) == serialized == benchmark_tables_interface

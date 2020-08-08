"""Tests for the database schema's."""

from pytest import fixture, mark

from hyrisecockpit.api.app.database.interface import (
    DatabaseInterface,
    DetailedDatabaseInterface,
)
from hyrisecockpit.api.app.database.model import (
    AvailableWorkloadTables,
    Database,
    DetailedDatabase,
    WorkloadTables,
)
from hyrisecockpit.api.app.database.schema import (
    AvailableWorkloadTablesSchema,
    DatabaseSchema,
    DetailedDatabaseSchema,
    WorkloadTablesSchema,
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
    """Return a database schema."""
    return DatabaseSchema()


@fixture
def detailed_database_schema() -> DetailedDatabaseSchema:
    """Return a detailed database schema."""
    return DetailedDatabaseSchema()


@fixture
def available_workload_tables_schema() -> AvailableWorkloadTablesSchema:
    """Return a available benchmark tables schema."""
    return AvailableWorkloadTablesSchema()


@fixture
def workload_tables_schema() -> WorkloadTablesSchema:
    """Return a benchmark tables schema."""
    return WorkloadTablesSchema()


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

    def test_creates_available_workload_tables_schema(
        self, available_workload_tables_schema: AvailableWorkloadTablesSchema
    ) -> None:
        """A available benchmark tables schema can be created."""
        assert available_workload_tables_schema

    def test_creates_workload_tables_schema(
        self, workload_tables_schema: WorkloadTablesSchema
    ) -> None:
        """A benchmark tables schema can be created."""
        assert workload_tables_schema

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

    def test_deserializes_available_workload_tables_schema(
        self, available_workload_tables_schema: AvailableWorkloadTablesSchema,
    ) -> None:
        """A available benchmark tables schema can create a database model."""
        available_workload_tables_interface = {
            "workload_tables": [
                {"workload_type": "tpch", "scale_factor": 1.0},
                {"workload_type": "tpcc", "scale_factor": 5.0},
            ]
        }
        available_benchmark_tables: AvailableWorkloadTables = available_workload_tables_schema.load(
            available_workload_tables_interface
        )
        assert isinstance(available_benchmark_tables, AvailableWorkloadTables)
        assert (
            vars(available_benchmark_tables.workload_tables[0])
            == available_workload_tables_interface["workload_tables"][0]
        )
        assert (
            vars(available_benchmark_tables.workload_tables[1])
            == available_workload_tables_interface["workload_tables"][1]
        )

    def test_deserializes_workload_tables_schema(
        self, workload_tables_schema: WorkloadTablesSchema,
    ) -> None:
        """A benchmark tables schema can create a database model."""
        workload_tables_interface = {"workload_type": "tpch", "scale_factor": 1.0}
        workload_tables = workload_tables_schema.load(workload_tables_interface)
        assert isinstance(workload_tables, WorkloadTables)
        assert vars(workload_tables) == workload_tables_interface

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

    def test_serializes_available_workload_tables(
        self, available_workload_tables_schema: AvailableWorkloadTablesSchema,
    ) -> None:
        """A available benchmark tables model can be serialized with a available benchmark tables schema."""
        available_workload_tables_interface = {
            "workload_tables": [
                {"workload_type": "tpch", "scale_factor": 1.0},
                {"workload_type": "tpcc", "scale_factor": 5.0},
            ]
        }
        available_workload_tables: AvailableWorkloadTables = AvailableWorkloadTables(
            **available_workload_tables_interface  # type: ignore
        )
        serialized = available_workload_tables_schema.dump(available_workload_tables)
        assert serialized == available_workload_tables_interface

    def test_serializes_workload_tables(
        self, workload_tables_schema: WorkloadTablesSchema,
    ) -> None:
        """A benchmark_tables dictionary can be serialized with a benchmark tables schema."""
        workload_tables_interface = {"workload_type": "tpch", "scale_factor": 1.0}
        serialized = workload_tables_schema.dump(workload_tables_interface)
        assert serialized == workload_tables_interface

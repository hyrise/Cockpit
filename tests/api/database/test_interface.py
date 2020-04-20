"""Tests for the database interface."""
from typing import List

from pytest import mark

from hyrisecockpit.api.app.database.interface import (
    AvailableBenchmarkTablesInterface,
    BenchmarkTablesInterface,
    DatabaseInterface,
    DetailedDatabaseInterface,
)
from hyrisecockpit.api.app.database.model import (
    AvailableBenchmarkTables,
    Database,
    DetailedDatabase,
)


class TestDatabaseInterface:
    """Tests for the database namespace interfaces."""

    @mark.parametrize("attribute", ["I am a database", "Whats Up"])
    def test_creates_database_interface(self, attribute: str) -> None:
        """A database model can be created."""
        assert DatabaseInterface(id=attribute)

    @mark.parametrize("attribute", ["I am a database", "Whats Up"])
    def test_creates_database_interface_works(self, attribute: str) -> None:
        """A database model can be created."""
        interface = DatabaseInterface(id=attribute)
        assert Database(**interface)

    def test_creates_detailed_database_interface(self) -> None:
        """A detailed database model can be created."""
        assert DetailedDatabaseInterface(
            id="hycrash",
            host="linux",
            port="666",
            number_workers=42,
            dbname="post",
            user="Alex",
            password="1234",
        )

    def test_creates_detailed_database_interface_works(self) -> None:
        """A database model can be created."""
        interface = DetailedDatabaseInterface(
            id="hycrash",
            host="linux",
            port="666",
            number_workers=42,
            dbname="post",
            user="Alex",
            password="1234",
        )
        assert DetailedDatabase(**interface)

    @mark.parametrize("attribute", ["folder", "big_folder"])
    def test_creates_benchmark_tables_interface(self, attribute: str) -> None:
        """A benchmark tables interface can be created."""
        assert BenchmarkTablesInterface(folder_name=attribute)

    @mark.parametrize("tables", [["nations", "product"], ["just one table"]])
    def test_creates_available_benchmark_tables_interface(
        self, tables: List[str]
    ) -> None:
        """A available benchmark tables interface can be created."""
        assert AvailableBenchmarkTablesInterface(folder_names=tables)

    @mark.parametrize("tables", [["nations", "product"], ["just one table"]])
    def test_creates_available_benchmark_tables_interface_works(
        self, tables: List[str]
    ) -> None:
        """A available benchmark tables interface work."""
        interface = AvailableBenchmarkTablesInterface(folder_names=tables)
        assert AvailableBenchmarkTables(**interface)
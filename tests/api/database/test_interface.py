"""Tests for the database interface."""


from pytest import mark

from hyrisecockpit.api.app.database.interface import (
    BenchmarkTablesInterface,
    DatabaseInterface,
    DetailedDatabaseInterface,
)
from hyrisecockpit.api.app.database.model import Database, DetailedDatabase


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

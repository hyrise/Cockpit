"""Tests for the database interface."""
from typing import List

from pytest import mark

from hyrisecockpit.api.app.database.interface import (
    AvailableWorkloadTablesInterface,
    DatabaseInterface,
    DetailedDatabaseInterface,
    WorkloadTablesInterface,
)
from hyrisecockpit.api.app.database.model import (
    AvailableWorkloadTables,
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

    def test_creates_workload_tables_interface(self) -> None:
        """A benchmark tables interface can be created."""
        assert WorkloadTablesInterface(workload_type="tpch", scale_factor=0.1)

    def test_creates_available_workload_tables_interface(self) -> None:
        """A available benchmark tables interface can be created."""
        assert AvailableWorkloadTablesInterface(
            workload_tables=[
                WorkloadTablesInterface(workload_type="tpch", scale_factor=0.1),
                WorkloadTablesInterface(workload_type="tpcds", scale_factor=0.1),
            ]
        )

    @mark.parametrize("tables", [["nations", "product"], ["just one table"]])
    def test_creates_available_workload_tables_interface_works(
        self, tables: List[str]
    ) -> None:
        """A available benchmark tables interface work."""
        interface = AvailableWorkloadTablesInterface(
            workload_tables=[
                WorkloadTablesInterface(workload_type="tpch", scale_factor=0.1),
                WorkloadTablesInterface(workload_type="tpcds", scale_factor=0.1),
            ]
        )
        assert AvailableWorkloadTables(**interface)

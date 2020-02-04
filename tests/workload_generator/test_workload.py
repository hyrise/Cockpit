"""Tests for the workload_generator module's workload."""

from typing import Any
from unittest.mock import MagicMock, patch

from pytest import fixture, raises

from hyrisecockpit.exception import QueryTypeNotFoundException
from hyrisecockpit.workload_generator.workloads.workload import Workload

workload_type: str = "TPCH"
queries_location: str = "/foo"
delimiter: str = ";"
file_type: str = "sql"


def get_fake_workload_reader() -> Any:
    """Get fake workload."""
    workload_reader = MagicMock()
    workload_reader.read_workload.return_value = ["dummy_query"]
    return workload_reader


class TestWorkload:
    """Test for workload class."""

    def idle_function(self) -> None:
        """Idle function."""
        return

    @fixture
    @patch(
        "hyrisecockpit.workload_generator.workloads.workload.Workload._initialize",
        idle_function,
    )
    @patch(
        "hyrisecockpit.workload_generator.workloads.workload.WorkloadReader",
        get_fake_workload_reader,
    )
    def fake_workload(self) -> Any:
        """Instance of WorkloadGenerator without Workloadreader."""
        return Workload(workload_type, queries_location, delimiter, file_type)

    def test_checks_initialization_of_workload_attributes(self, fake_workload):
        """Test if initial attributes are correct."""
        assert fake_workload.workload_type == workload_type
        assert fake_workload._queries_location == f"{queries_location}/TPCH"
        assert fake_workload._delimiter == delimiter
        assert fake_workload._file_type == file_type
        assert fake_workload._queries == {}

    def test_initializes_queries(self, fake_workload):
        """Test initially read queries."""
        fake_workload._initialize()
        expected_queries = ["dummy_query"]

        assert fake_workload._queries[:] == expected_queries[:]

    def test_generates_workload(self, fake_workload):
        """Test cration of workload."""
        dummy_queries = {"Type1": ["foo"], "Type2": ["foo2"]}
        expected_workload = [("foo", None)]
        fake_workload._queries = dummy_queries
        received_queries = fake_workload.generate_workload(1)
        assert received_queries[:] == expected_workload[:]

    def test_generates_workload_with_factor(self, fake_workload):
        """Test cration of workload."""
        dummy_queries = {"Type1": ["foo"], "Type2": ["foo2"]}
        expected_workload = [
            ("foo", None),
            ("foo2", None),
            ("foo", None),
            ("foo2", None),
        ]
        fake_workload._queries = dummy_queries
        received_queries = fake_workload.generate_workload(4)
        assert received_queries[:] == expected_workload[:]

    def test_generates_specific_query(self, fake_workload):
        """Test generating of a single query."""
        dummy_queries = {"Type1": ["foo"], "Type2": ["foo2"]}
        expected_workload = [("foo", None), ("foo", None)]
        fake_workload._queries = dummy_queries
        received_queries = fake_workload.generate_specific("Type1", 2)

        assert received_queries[:] == expected_workload[:]

    def test_generates_not_existing_specific_query(self, fake_workload):
        """Test generating of a single query."""
        dummy_queries = {"Type1": ["foo"], "Type2": ["foo2"]}
        fake_workload._queries = dummy_queries
        expected_error_meassage = "Query file Type3 was not found"

        with raises(QueryTypeNotFoundException) as e:
            fake_workload.generate_specific("Type3", 2)
        assert str(e.value) == expected_error_meassage

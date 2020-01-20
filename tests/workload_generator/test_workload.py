"""Tests for the workload_generator module's workload."""

from typing import Any
from unittest import mock

from pytest import fixture

from hyrisecockpit.workload_generator.workloads.workload import Workload

workload_type: str = "TPCH"
queries_location: str = "/foo"
delimiter: str = ";"
file_type: str = "sql"


def get_fake_workload_reader() -> Any:
    """Get fake workload."""
    workload_reader = mock.MagicMock()
    workload_reader.read_workload.return_value = ["dummy_query"]
    return workload_reader


class TestWorkload:
    """Test for workload class."""

    def idle_function(self) -> None:
        """Idle function."""
        return None

    @fixture
    @mock.patch(
        "hyrisecockpit.workload_generator.workloads.workload.Workload._initialize",
        idle_function,
    )
    @mock.patch(
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
        expected_workload = [("foo", None), ("foo2", None)]
        fake_workload._queries = dummy_queries
        received_queries = fake_workload.generate_workload(1, False)

        assert received_queries[:] == expected_workload[:]

"""Module for WorkloadGenerator testing."""

from typing import Any
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.response import get_response
from hyrisecockpit.workload_generator.generator import WorkloadGenerator

generator_listening = "generator_listening"
generator_port = "10000"
workload_listening = "workload_listening"
workload_pub_port = "20000"
default_workload_location = "default_workload_location"


fake_workload = [("dummy_query", None, "benchmark", "query_no")]


def idle_function(self, *args) -> None:
    """Idle function."""
    return


def get_fake_workload(*args) -> Any:
    """Get fake workload."""
    workload = MagicMock()
    workload.generate_workload.return_value = fake_workload
    return workload


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    @fixture
    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._init_server",
        idle_function,
    )
    @patch(
        "hyrisecockpit.workload_generator.generator.Server", idle_function,
    )
    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._init_scheduler",
        idle_function,
    )
    def isolated_generator(self) -> Any:
        """Instance of WorkloadGenerator without binding of sockets."""
        return WorkloadGenerator(
            generator_listening,
            generator_port,
            workload_listening,
            workload_pub_port,
            default_workload_location,
        )

    def test_initializes_socket_attributes(self, isolated_generator: WorkloadGenerator):
        """Test initialization of socket hosts and ports."""
        assert isolated_generator._workload_listening == workload_listening
        assert isolated_generator._workload_pub_port == workload_pub_port

    def test_initializes_workload_attributes(
        self, isolated_generator: WorkloadGenerator
    ):
        """Test initialization of workload attributes."""
        assert isolated_generator._frequency == 0
        assert not isolated_generator._generate_workload_flag

    @patch("hyrisecockpit.workload_generator.generator.Workload", get_fake_workload)
    def test_starts_a_workload(self, isolated_generator: WorkloadGenerator):
        """Test starting of the workload generation."""
        body = {"folder_name": "benchmark_name", "frequency": 100}

        response = isolated_generator._call_start_workload(body)

        assert isolated_generator._frequency == 100
        assert isolated_generator._workload_type == "benchmark_name"
        assert isolated_generator._generate_workload_flag
        assert list(isolated_generator._workloads.keys()) == ["benchmark_name"]
        assert response == get_response(200)

    def test_stops_a_workload(self, isolated_generator: WorkloadGenerator):
        """Test stopping of the workload generation."""
        response = isolated_generator._call_stop_workload({})

        assert not isolated_generator._generate_workload_flag
        assert response == get_response(200)

    @patch("hyrisecockpit.workload_generator.generator.Workload", get_fake_workload)
    @patch("hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data")
    def test_generates_a_workload(
        self, mocked_publish_data, isolated_generator: WorkloadGenerator
    ):
        """Test workload generation."""
        isolated_generator._generate_workload_flag = True
        isolated_generator._workload_type = "benchmark_name"
        isolated_generator._frequency = 1

        mocked_publish_data.return_value = None

        isolated_generator._generate_workload()

        expected_response = get_response(200)
        expected_response["body"] = {"querylist": fake_workload}

        mocked_publish_data.assert_any_call(expected_response)

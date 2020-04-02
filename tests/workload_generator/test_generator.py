"""Module for WorkloadGenerator testing."""

from typing import Any, Dict
from unittest.mock import MagicMock, patch

from pytest import fixture, mark

from hyrisecockpit.response import get_response
from hyrisecockpit.workload_generator.generator import Workload, WorkloadGenerator

generator_listening = "generator_listening"
generator_port = "10000"
workload_listening = "workload_listening"
workload_pub_port = "20000"
default_workload_location = "default_workload_location"


folder_name = "myFolder123"
frequency = 123
fake_workload = [("dummy_query", None, folder_name, "query_no")]


def get_fake_workload(*args) -> MagicMock:
    """Get fake workload."""
    workload = MagicMock()
    workload.generate_workload.return_value = fake_workload
    workload.folder_name = folder_name
    workload.frequency = frequency
    return workload


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    @fixture
    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._init_server",
        lambda *args: None,
    )
    @patch(
        "hyrisecockpit.workload_generator.generator.Server", lambda *args: None,
    )
    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._init_scheduler",
        lambda *args: None,
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
        assert (
            isolated_generator._default_workload_location == default_workload_location
        )

    @patch("hyrisecockpit.workload_generator.generator.Workload", get_fake_workload)
    def test_starts_a_workload(self, isolated_generator: WorkloadGenerator):
        """Test starting of the workload generation."""
        workload_id = "myID"
        body = {
            "workload_id": workload_id,
            "folder_name": "benchmark_name",
            "frequency": 100,
        }
        assert isolated_generator._workloads == {}
        response = isolated_generator._call_start_workload(body)

        assert list(isolated_generator._workloads.keys()) == [workload_id]
        assert response["header"] == get_response(200)["header"]
        assert "workload" in response["body"]

    @patch("hyrisecockpit.workload_generator.generator.Workload", get_fake_workload)
    def test_stops_a_workload(self, isolated_generator: WorkloadGenerator):
        """Test stopping of the workload generation."""
        workload_id = "myID2"
        assert isolated_generator._workloads == {}
        isolated_generator._workloads[workload_id] = MagicMock()
        response = isolated_generator._call_stop_workload({"workload_id": workload_id})
        assert isolated_generator._workloads == {}

        expected_response = get_response(200)
        expected_response["body"]["workload_id"] = workload_id
        assert response == expected_response

    @patch("hyrisecockpit.workload_generator.generator.Workload", get_fake_workload)
    def test_generates_a_workload(self, isolated_generator: WorkloadGenerator):
        """Test workload generation."""
        isolated_generator._pub_socket = MagicMock()

        assert isolated_generator._workloads == {}
        isolated_generator._generate_workload()
        isolated_generator._pub_socket.send_json.assert_not_called()

        workload_id = "myID3"
        expected_response = get_response(200)
        expected_response["body"] = {"querylist": fake_workload}
        isolated_generator._workloads[workload_id] = MagicMock()
        isolated_generator._workloads[workload_id].generate_workload.return_value = fake_workload  # type: ignore
        isolated_generator._generate_workload()
        isolated_generator._workloads[workload_id].generate_workload.assert_called_once()  # type: ignore
        isolated_generator._pub_socket.send_json.assert_called_once_with(
            expected_response
        )

    @mark.parametrize("workloads", [{}, {"1": get_fake_workload()}])
    def test_gets_all_workloads(
        self, isolated_generator: WorkloadGenerator, workloads: Dict[str, Workload],
    ):
        """Test get_all_workloads."""
        assert isolated_generator._workloads == {}
        isolated_generator._workloads = workloads
        response = isolated_generator._call_get_all_workloads({})
        expected_response = get_response(200)
        expected_response["body"]["workloads"] = [
            {
                "workload_id": workload_id,
                "folder_name": workload.folder_name,
                "frequency": workload.frequency,
            }
            for workload_id, workload in workloads.items()
        ]
        assert response == expected_response

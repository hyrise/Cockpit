"""Tests for the workload_generator module's generator."""
from typing import Any
from unittest.mock import MagicMock, patch

from pytest import fixture, mark

from hyrisecockpit.workload_generator.generator import WorkloadGenerator

generator_listening = "generator_listening"
generator_port = "10000"
workload_listening = "workload_listening"
workload_pub_port = "20000"


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    def idle_function(self, *argv) -> None:
        """Idle function."""
        return

    def get_fake_workload(self, *argv) -> Any:
        """Get fake workload."""
        workload = MagicMock()
        workload.generate_workload.return_value = [("dummy_query", None)]
        return workload

    @fixture
    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._init_server",
        idle_function,
    )
    def isolated_generator(self) -> Any:
        """Instance of WorkloadGenerator without binding of sockets."""
        return WorkloadGenerator(
            generator_listening,
            generator_port,
            workload_listening,
            workload_pub_port,
            "default_workload_location",
        )

    @patch("hyrisecockpit.workload_generator.generator.Workload", get_fake_workload)
    def test_initializes_socket_attributes(self, isolated_generator: WorkloadGenerator):
        """Test initialization of soscket hosts and ports."""
        assert isolated_generator._generator_port == generator_port
        assert isolated_generator._workload_listening == workload_listening
        assert isolated_generator._workload_pub_port == workload_pub_port

    @mark.parametrize("call", ["start workload", "stop workload"])
    @patch("hyrisecockpit.workload_generator.generator.Workload", get_fake_workload)
    def test_initializes_server_calls(
        self, isolated_generator: WorkloadGenerator, call: str
    ):
        """Ensure pre-defined calls are implemented."""
        assert call in isolated_generator._server_calls.keys()

    def test_asks_for_not_existing_call(self, isolated_generator: WorkloadGenerator):
        """Ensure not-existing call returns 400."""
        request = {"header": {"message": "Ich fuehle mich DISCO!"}}
        response = isolated_generator._handle_request(request)
        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"

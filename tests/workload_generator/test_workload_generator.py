"""Tests for the workload_generator module's generator."""
from typing import Any
from unittest.mock import MagicMock, patch

from pytest import fixture, mark

from hyrisecockpit.exception import (
    EmptyWorkloadFolderException,
    NotExistingWorkloadFolderException,
)
from hyrisecockpit.workload_generator.generator import WorkloadGenerator

generator_host = "generator_host"
generator_port = "10000"
workload_pub_host = "workload_pub_host"
workload_pub_port = "20000"
db_manager_host = "db_manager_host"
db_manager_port = "123512"


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    def idle_function(self, *argv) -> None:
        """Idle function."""
        return None

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
            generator_host,
            generator_port,
            workload_pub_host,
            workload_pub_port,
            "default_workload_location",
            db_manager_host,
            db_manager_port,
        )

    @patch("hyrisecockpit.workload_generator.generator.Workload", get_fake_workload)
    def test_initializes_socket_attributes(self, isolated_generator: WorkloadGenerator):
        """Test initialization of soscket hosts and ports."""
        assert isolated_generator._generator_host == generator_host
        assert isolated_generator._generator_port == generator_port
        assert isolated_generator._workload_pub_host == workload_pub_host
        assert isolated_generator._workload_pub_port == workload_pub_port

    @mark.parametrize("call", ["workload"])
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

    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._load_data",
        lambda self, query: True,
    )
    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data",
        idle_function,
    )
    @patch("hyrisecockpit.workload_generator.generator.Workload", get_fake_workload)
    @mark.parametrize("workload", ["no-ops", "mixed", "TPCH_0.1", "TPCH_1.0", "JOB"])
    def test_asks_for_existing_workload(
        self, isolated_generator: WorkloadGenerator, workload: str
    ):
        """Ensure existing workload calls return 200."""
        body = {"type": workload}
        response = isolated_generator._call_workload(body)

        assert response["header"]["status"] == 200
        assert response["header"]["message"] == "OK"

    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._load_data",
        lambda self, query: True,
    )
    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data",
        idle_function,
    )
    def test_catches_not_existing_workload_folder_exception(
        self, isolated_generator: WorkloadGenerator
    ):
        """Ensure not existing workload calls return 400."""
        workload = MagicMock()
        workload.generate_workload.side_effect = NotExistingWorkloadFolderException(
            "Error message"
        )
        isolated_generator._workloads["dummy workload"] = workload
        body = {"type": "dummy workload"}

        response = isolated_generator._call_workload(body)

        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"
        assert response["body"]["error"] == "Error message"

    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._load_data",
        lambda self, query: True,
    )
    @patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data",
        idle_function,
    )
    def test_catches_empty_workload_folder_exception(
        self, isolated_generator: WorkloadGenerator
    ):
        """Ensure not existing workload calls return 400."""
        workload = MagicMock()
        workload.generate_workload.side_effect = EmptyWorkloadFolderException(
            "Error message"
        )
        isolated_generator._workloads["dummy workload"] = workload
        body = {"type": "dummy workload"}

        response = isolated_generator._call_workload(body)

        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"
        assert response["body"]["error"] == "Error message"

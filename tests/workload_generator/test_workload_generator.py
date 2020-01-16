"""Tests for the workload_generator module's generator."""
from typing import Any
from unittest import mock

from pytest import fixture, mark

from hyrisecockpit.workload_generator.generator import WorkloadGenerator

generator_host = "generator_host"
generator_port = "10000"
workload_pub_host = "workload_pub_host"
workload_pub_port = "20000"


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    def idle_function(self) -> None:
        """Idle function."""
        return None

    def idle_publish(self, *argv) -> None:
        """Idle publishing."""
        return None

    def publish_raises_exception(self, *argv):
        """Publish with exception."""
        raise Exception("Error message")

    def get_fake_workload(self, *argv) -> Any:
        """Get fake workload."""
        workload = mock.MagicMock()
        workload.generate_workload.return_value = [("dummy_query", None)]
        return workload

    def get_workload_with_exception(self, *argv) -> Any:
        """Get fake workload."""
        workload = mock.MagicMock()
        workload.generate_workload.side_effect = Exception("Error message")
        return workload

    @fixture
    @mock.patch(
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
        )

    @mock.patch(
        "hyrisecockpit.workload_generator.generator.Workload", get_fake_workload
    )
    def test_initialization_of_socket_attributes(
        self, isolated_generator: WorkloadGenerator
    ):
        """Test initialization of soscket hosts and ports."""
        # mock_workload.return_value = self.get_fake_workload()
        # import pdb;pdb.set_trace()
        assert isolated_generator._generator_host == generator_host
        assert isolated_generator._generator_port == generator_port
        assert isolated_generator._workload_pub_host == workload_pub_host
        assert isolated_generator._workload_pub_port == workload_pub_port
        # assert isolated_generator._get_workload('tpch').generate_workload()[0] == ('dummy_query', None)
        # mock_workload.assert_called_with("tpch",  "workloads/workload_queries/")

    @mark.parametrize("call", ["workload"])
    @mock.patch(
        "hyrisecockpit.workload_generator.generator.Workload", get_fake_workload
    )
    def test_initialization_of_server_calls(
        self, isolated_generator: WorkloadGenerator, call: str
    ):
        """Ensure pre-defined calls are implemented."""
        assert call in isolated_generator._server_calls.keys()

    def test_call_not_found(self, isolated_generator: WorkloadGenerator):
        """Ensure not-existing call returns 400."""
        request = {"header": {"message": "Ich fuehle mich DISCO!"}}
        response = isolated_generator._handle_request(request)
        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"

    def test_bad_request(self, isolated_generator: WorkloadGenerator):
        """Ensure bad request returns 400."""
        m = mock.Mock()
        m.side_effect = Exception("Error message")

        request = {"header": {"message": "DISCO!"}, "body": {"DISCO!"}}
        isolated_generator._server_calls["DISCO!"] = m

        response = isolated_generator._handle_request(request)
        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"
        assert response["body"]["error"] == "Error message"

    @mark.parametrize("workload", ["no-ops", "mixed"])
    def test_initialization_pre_defined_workloads(
        self, isolated_generator: WorkloadGenerator, workload: str
    ):
        """Ensure pre-defined workload calls are implemented."""
        assert workload in isolated_generator._workloads.keys()

    @mock.patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data",
        idle_publish,
    )
    @mock.patch(
        "hyrisecockpit.workload_generator.generator.Workload", get_fake_workload
    )
    @mark.parametrize("workload", ["no-ops", "mixed", "TPCH_0.1", "TPCH_1.0", "JOB"])
    def test_response_existing_workloads(
        self, isolated_generator: WorkloadGenerator, workload: str
    ):
        """Ensure existing workload calls return 200."""
        body = {"type": workload}
        response = isolated_generator._call_workload(body)

        assert response["header"]["status"] == 200
        assert response["header"]["message"] == "OK"

    @mock.patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data",
        idle_publish,
    )
    @mock.patch(
        "hyrisecockpit.workload_generator.generator.Workload",
        get_workload_with_exception,
    )
    def test_response_not_existing_workloads(
        self, isolated_generator: WorkloadGenerator
    ):
        """Ensure not existing workload calls return 400."""
        body = {
            "type": "Das U-Boot ist untergegangen. Es war Tag der offenen Tuer.",
        }
        response = isolated_generator._call_workload(body)

        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"
        assert response["body"]["error"] == "Error message"

    @mock.patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data",
        publish_raises_exception,
    )
    def test_response_publish_with_exception(
        self, isolated_generator: WorkloadGenerator
    ):
        """Ensure exception when publishing returns 400."""
        body = {"type": "no-ops"}
        response = isolated_generator._call_workload(body)

        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"
        assert response["body"]["error"] == "Error message"

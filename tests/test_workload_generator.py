"""Tests for the workload_generator module's generator."""
from unittest import mock

from pytest import fixture, mark

from hyrisecockpit.workload_generator.generator import WorkloadGenerator

generator_host = "generator_host"
generator_port = "10000"
workload_pub_host = "workload_pub_host"
workload_pub_port = "20000"


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    def idle_function(self):
        """Idle function."""
        return None

    def idle_publish(self, data):
        """Idle publishing."""
        return None

    def publish_raises_exception(self, data):
        """Publish with exception."""
        raise Exception("Error message")

    @fixture
    @mock.patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._init_server",
        idle_function,
    )
    def isolated_generator(self):
        """Instance of WOrkloadGenerator without binding of sockets."""
        return WorkloadGenerator(
            generator_host, generator_port, workload_pub_host, workload_pub_port
        )

    def test_initialization_of_socket_attributes(
        self, isolated_generator: WorkloadGenerator
    ):
        """Test initialization of soscket hosts and ports."""
        assert isolated_generator._generator_host == generator_host
        assert isolated_generator._generator_port == generator_port
        assert isolated_generator._workload_pub_host == workload_pub_host
        assert isolated_generator._workload_pub_port == workload_pub_port

    @mark.parametrize("call", ["workload"])
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
        request = {"Mein Wissen": {"Math": None, "Physics": None, "Python": None}}
        response = isolated_generator._handle_request(request)
        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"

    @mark.parametrize("workload", ["no-ops", "mixed", "tpch"])
    def test_initialization_of_workloads(
        self, isolated_generator: WorkloadGenerator, workload: str
    ):
        """Ensure pre-defined workload calls are implemented."""
        assert workload in isolated_generator._workload_generators.keys()

    @mock.patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data",
        idle_publish,
    )
    @mark.parametrize("workload", ["no-ops", "mixed", "tpch"])
    def test_response_existing_workloads(
        self, isolated_generator: WorkloadGenerator, workload: str
    ):
        """Ensure existing workload calls return 200."""
        body = {"type": workload, "factor": 5000}

        response = isolated_generator._call_workload(body)
        assert response["header"]["status"] == 200
        assert response["header"]["message"] == "OK"

    @mock.patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data",
        idle_publish,
    )
    def test_response_not_existing_workloads(
        self, isolated_generator: WorkloadGenerator
    ):
        """Ensure not existing workload calls return 400."""
        body = {
            "type": "Das U-Boot ist untergegangen. Es war Tag der offenen Tuer.",
            "factor": 5000,
        }

        response = isolated_generator._call_workload(body)
        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"
        assert response["body"]["error"] == "Workload type not found"

    @mock.patch(
        "hyrisecockpit.workload_generator.generator.WorkloadGenerator._publish_data",
        publish_raises_exception,
    )
    def test_response_publish_with_exception(
        self, isolated_generator: WorkloadGenerator
    ):
        """Ensure exception when publishing returns 400."""
        body = {"type": "no-ops", "factor": 5000}

        response = isolated_generator._call_workload(body)
        assert response["header"]["status"] == 400
        assert response["header"]["message"] == "BAD REQUEST"
        assert response["body"]["error"] == "Error message"

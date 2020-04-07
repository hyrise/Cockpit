"""Module for WorkloadGenerator testing."""

from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.response import get_response
from hyrisecockpit.workload_generator.generator import WorkloadGenerator


@fixture
def generator_listening() -> str:
    """Get the host address where the generator is listening."""
    return "generator_listening"


@fixture
def generator_port() -> str:
    """Get the host port where the generator is listening."""
    return "10000"


@fixture
def workload_listening() -> str:
    """Get the host address where the workload is publishing."""
    return "workload_listening"


@fixture
def workload_pub_port() -> str:
    """Get the host port where the workload is publishing."""
    return "20000"


@fixture
@patch.object(
    WorkloadGenerator, "_init_server", lambda *args: None,
)
@patch.object(
    WorkloadGenerator, "_init_scheduler", lambda *args: None,
)
@patch(
    "hyrisecockpit.workload_generator.generator.Server", lambda *args: None,
)
def generator(
    generator_listening, generator_port, workload_listening, workload_pub_port
) -> WorkloadGenerator:
    """Instance of WorkloadGenerator without binding of sockets."""
    return WorkloadGenerator(
        generator_listening, generator_port, workload_listening, workload_pub_port,
    )


class TestWorkloadGenerator:
    """Tests for the WorkloadGenerator class."""

    def test_creates(self, generator: WorkloadGenerator):
        """A WorkloadGenerator can be created."""
        assert generator

    def test_initializes(
        self,
        generator: WorkloadGenerator,
        generator_listening: str,
        generator_port: str,
        workload_listening: str,
        workload_pub_port: str,
    ):
        """A WorkloadGenerator initializes all attributes."""
        assert generator._workload_listening == workload_listening
        assert generator._workload_pub_port == workload_pub_port

    def test_starts_a_workload(self, generator: WorkloadGenerator):
        """Test starting of the workload generation."""
        folder_name = "myFolder"
        assert generator._workloads == {}
        with patch(
            "hyrisecockpit.workload_generator.reader.WorkloadReader.get"
        ) as mock_get:
            mock_get.return_value = {"Query1": ["SELECT 1;"]}
            response = generator._call_start_workload(
                {"folder_name": folder_name, "frequency": 100}
            )
            mock_get.assert_called_once_with(folder_name)
        assert response["header"] == get_response(200)["header"]
        assert "workload" in response["body"]
        assert list(generator._workloads.keys()) == [folder_name]

    def test_does_not_start_a_workload_if_it_cannot_be_found(
        self, generator: WorkloadGenerator
    ):
        """Test starting of the workload generation."""
        folder_name = "myFolder"
        assert generator._workloads == {}
        with patch(
            "hyrisecockpit.workload_generator.reader.WorkloadReader.get"
        ) as mock_get:
            mock_get.return_value = None
            response = generator._call_start_workload(
                {"folder_name": folder_name, "frequency": 100}
            )
            mock_get.assert_called_once_with(folder_name)
        assert response == get_response(404)
        assert list(generator._workloads.keys()) == []

    def test_does_not_start_a_workload_if_it_is_already_started(
        self, generator: WorkloadGenerator
    ):
        """Test starting of the workload generation."""
        folder_name = "myFolder"
        assert generator._workloads == {}
        generator._workloads[folder_name] = MagicMock()
        with patch(
            "hyrisecockpit.workload_generator.reader.WorkloadReader.get"
        ) as mock_get:
            response = generator._call_start_workload(
                {"folder_name": folder_name, "frequency": 100}
            )
            mock_get.assert_not_called()
        assert response == get_response(409)
        assert list(generator._workloads.keys()) == [folder_name]

    def test_stops_a_workload(self, generator: WorkloadGenerator):
        """Test stopping of the workload generation."""
        folder_name = "myFolder"
        assert generator._workloads == {}
        generator._workloads[folder_name] = MagicMock()
        response = generator._call_stop_workload({"folder_name": folder_name})
        expected_response = get_response(200)
        expected_response["body"]["folder_name"] = folder_name
        assert response == expected_response
        assert generator._workloads == {}

    def test_does_not_stop_a_workload_if_there_is_none(
        self, generator: WorkloadGenerator
    ):
        """Test stopping of the workload generation."""
        assert generator._workloads == {}
        response = generator._call_stop_workload({"folder_name": "myFolder"})
        assert response == get_response(404)
        assert generator._workloads == {}

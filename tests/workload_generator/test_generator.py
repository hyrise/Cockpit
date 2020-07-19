"""Module for WorkloadGenerator testing."""

from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.response import get_response
from hyrisecockpit.workload_generator.generator import WorkloadGenerator
from hyrisecockpit.workload_generator.workload import Workload


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

    def test_get_all_workloads(self, generator: WorkloadGenerator):
        """Test get all running workloads."""
        fake_driver = MagicMock()
        fake_running_workoad = Workload(fake_driver)  # type: ignore
        fake_running_workoad.running = True
        fake_running_workoad.frequency = 42
        fake_running_workoad.scale_factor = 2.0
        fake_stopped_workoad = Workload(fake_driver)  # type: ignore
        fake_stopped_workoad.running = False
        generator._workloads = {
            "running_workload": fake_running_workoad,
            "fake_stopped_workoad": fake_stopped_workoad,
        }

        response = generator._call_get_all_workloads({})

        expected_response = [
            {"workload_type": "running_workload", "frequency": 42, "scale_factor": 2.0}
        ]
        assert response["header"] == get_response(200)["header"]
        assert response["body"]["workloads"] == expected_response

    def test_starts_a_workload(self, generator: WorkloadGenerator):
        """Test starting of the workload generation."""
        fake_body = {
            "workload_type": "fake_workload",
            "frequency": 42,
            "scale_factor": 1.0,
        }
        fake_driver = MagicMock()
        fake_driver.scale_factors = [1.0]
        fake_workoad = Workload(fake_driver)  # type: ignore
        generator._workloads = {"fake_workload": fake_workoad}

        expected_response = {
            "workload_type": "fake_workload",
            "frequency": 42,
            "scale_factor": 1.0,
        }

        response = generator._call_start_workload(fake_body)

        assert (
            generator._workloads["fake_workload"].scale_factor
            == fake_body["scale_factor"]
        )
        assert generator._workloads["fake_workload"].frequency == fake_body["frequency"]
        assert generator._workloads["fake_workload"].running

        assert response["header"] == get_response(200)["header"]
        assert response["body"]["workload"] == expected_response

    def test_starts_a_workload_with_wrong_scale_factor(
        self, generator: WorkloadGenerator
    ):
        """Test starting of the workload generation with wrong scale factor."""
        fake_body = {
            "workload_type": "fake_workload",
            "frequency": 42,
            "scale_factor": 100.0,
        }
        fake_driver = MagicMock()
        fake_driver.scale_factors = [1.0]
        fake_workoad = Workload(fake_driver)  # type: ignore
        generator._workloads = {"fake_workload": fake_workoad}

        response = generator._call_start_workload(fake_body)

        assert response["header"] == get_response(400)["header"]

    def test_starts_a_not_existing_workload(self, generator: WorkloadGenerator):
        """Test starting of the workload generation of not existing workload."""
        fake_body = {
            "workload_type": "not_existing_workload",
            "frequency": 42,
            "scale_factor": 100.0,
        }
        generator._workloads = {}
        response = generator._call_start_workload(fake_body)

        assert response["header"] == get_response(404)["header"]

    def test_get_workload_information(self, generator: WorkloadGenerator):
        """Test get workload information."""
        fake_body = {"workload_type": "fake_workoad"}

        fake_driver = MagicMock()
        fake_workoad = Workload(fake_driver)  # type: ignore
        fake_workoad.running = True
        fake_workoad.frequency = 42
        fake_workoad.scale_factor = 2.0
        fake_workoad.weights = {"01": 2, "02": 5}
        generator._workloads = {"fake_workoad": fake_workoad}

        expected_response = {
            "workload_type": "fake_workoad",
            "frequency": 42,
            "scale_factor": 2.0,
            "weights": {"01": 2, "02": 5},
            "running": True,
        }

        response = generator._call_get_workload(fake_body)

        assert response["header"] == get_response(200)["header"]
        assert response["body"]["workload"] == expected_response

    def test_get_information_for_not_existing_workload(
        self, generator: WorkloadGenerator
    ):
        """Test get workload information for not existing workload."""
        fake_body = {"workload_type": "fake_workoad"}
        generator._workloads = {}

        response = generator._call_get_workload(fake_body)

        assert response["header"] == get_response(404)["header"]

    def test_stop_workload(self, generator: WorkloadGenerator):
        """Test stop workload."""
        fake_body = {"workload_type": "fake_workoad"}
        fake_driver = MagicMock()
        fake_workoad = Workload(fake_driver)  # type: ignore
        fake_workoad.running = True
        generator._workloads = {"fake_workoad": fake_workoad}

        response = generator._call_stop_workload(fake_body)

        assert response["header"] == get_response(200)["header"]
        assert not generator._workloads["fake_workoad"].running

    def test_stop_not_existing_workload(self, generator: WorkloadGenerator):
        """Test stop of not existing workload."""
        fake_body = {"workload_type": "fake_workoad"}
        generator._workloads = {}

        response = generator._call_stop_workload(fake_body)

        assert response["header"] == get_response(404)["header"]

    def test_update_workload(self, generator: WorkloadGenerator):
        """Test update workload."""
        fake_body = {
            "workload_type": "fake_workoad",
            "frequency": 42,
            "scale_factor": 2.0,
            "weights": {"01": 10000, "02": 99},
        }
        fake_driver = MagicMock()
        fake_driver.get_default_weights.return_value = {"01": 2, "02": 5}
        fake_workoad = Workload(fake_driver)  # type: ignore
        fake_workoad.running = True
        generator._workloads = {"fake_workoad": fake_workoad}

        response = generator._call_update_workload(fake_body)

        assert response["header"] == get_response(200)["header"]
        assert generator._workloads["fake_workoad"].running
        assert generator._workloads["fake_workoad"].scale_factor == 2.0
        assert generator._workloads["fake_workoad"].frequency == 42
        assert generator._workloads["fake_workoad"].weights == {"01": 10000, "02": 99}

    def test_update_not_existing_workload(self, generator: WorkloadGenerator):
        """Test update of not existing workload."""
        fake_body = {
            "workload_type": "fake_workoad",
            "frequency": 42,
            "scale_factor": 2.0,
            "weights": {"01": 10000, "02": 99},
        }
        generator._workloads = {}

        response = generator._call_update_workload(fake_body)

        assert response["header"] == get_response(404)["header"]

    @patch(
        "hyrisecockpit.workload_generator.generator.shuffle", lambda x: x,
    )
    def test_get_workload_queries(self, generator: WorkloadGenerator):
        """Test get workload queries."""
        fake_driver_a = MagicMock()
        fake_driver_a.generate.return_value = ["Select a", "Select a again"]
        fake_workoad_a = Workload(fake_driver_a)  # type: ignore
        fake_workoad_a.running = True
        fake_driver_b = MagicMock()
        fake_driver_b.generate.return_value = ["Select b", "Select b again"]
        fake_workoad_b = Workload(fake_driver_b)  # type: ignore
        fake_workoad_b.running = True
        fake_driver_not_running = MagicMock()
        fake_driver_not_running.generate.return_value = ["not running"]
        fake_workoad_not_running = Workload(fake_driver_not_running)  # type: ignore
        fake_workoad_not_running.running = False
        generator._workloads = {
            "fake_workoad_a": fake_workoad_a,
            "fake_workoad_b": fake_workoad_b,
            "fake_workoad_not_running": fake_workoad_not_running,
        }
        expected_queries = ["Select a", "Select a again", "Select b", "Select b again"]

        response = generator._get_workload_queries()  # type: ignore

        assert set(expected_queries) == set(response)

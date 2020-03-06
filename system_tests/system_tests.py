"""Module for system tests."""

from time import sleep

from influxdb import InfluxDBClient

from cockpit_backend import CockpitBackend
from cockpit_generator import CockpitGenerator
from cockpit_manager import CockpitManager
from hyrisecockpit.response import get_response
from settings import (  # DATABASE2_HOST,
    DATABASE1_HOST,
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)

influx_client = InfluxDBClient(
    STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
)
SETUP_TIMEOUT = 3.0


class TestSystem:
    """Tests for the whole cockpit system."""

    def setup_method(self, test_method):
        """Run before every test."""
        self.clean_influx()
        self.backend = CockpitBackend()
        self.backend.start()
        self.manager = CockpitManager()
        self.manager.start()
        self.generator = CockpitGenerator()
        self.generator.start()
        sleep(SETUP_TIMEOUT)

    def teardown_method(self, test_method):
        """Run after every test."""
        self.manager.shutdown()
        self.backend.shutdown()
        self.generator.shutdown()
        self.clean_influx()

    def clean_influx(self):
        """Delete Influx databases which were created while executing of the tests."""
        influx_client.drop_database("test_database1")
        influx_client.drop_database("test_database2")

    def check_stderr(self):
        """Check standard error output of the components."""
        assert self.manager.get_stderr() == ""  # nosec
        assert self.generator.get_stderr() == ""  # nosec
        assert self.backend.get_stderr() == ""  # nosec

    def test_database_manager_initialization(self):
        """Ensure initialized database manager has no monitor metrics."""
        metrics = [
            "throughput",
            "latency",
            "queue_length",
            "chunks",
            "storage",
            "system",
        ]
        metrics_attributes = [
            "throughput",
            "latency",
            "queue_length",
            "chunks_data",
            "storage",
            "system_data",
        ]

        for i in range(len(metrics)):
            response = self.backend.get_monitor_property(metrics[i])
            assert response["body"][metrics_attributes[i]] == {}  # nosec

        available_datasets = self.backend.get_control_property("data")
        available_databases = self.backend.get_control_property("database")

        assert available_datasets == [  # nosec
            "tpch_0.1",
            "tpch_1",
            "tpcds_1",
            "job",
        ]  # nosec
        assert available_databases == []  # nosec

        self.check_stderr()

    def test_database_handling(self):
        """Add and remove database."""
        response = self.backend.add_database("test_database1", DATABASE1_HOST)
        assert response == get_response(200)  # nosec

        available_databases = self.backend.get_control_property("database")
        assert available_databases == [  # nosec
            {
                "id": "test_database1",
                "host": DATABASE1_HOST,
                "port": "5432",
                "number_workers": 8,
                "dbname": "postgres",
            }
        ]
        response = self.backend.remove_database("test_database1")
        assert response == get_response(200)  # nosec

        self.check_stderr()

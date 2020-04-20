"""Module for system tests."""

from time import sleep, time_ns

from influxdb import InfluxDBClient

from hyrisecockpit.response import get_response
from system_tests.cockpit_backend import CockpitBackend
from system_tests.cockpit_generator import CockpitGenerator
from system_tests.cockpit_manager import CockpitManager
from system_tests.settings import (
    DATABASE_HOST,
    DATABASE_PORT,
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

    def check_stderr(self):
        """Check standard error output of the components."""
        assert self.generator.get_stderr() == ""  # nosec
        assert self.backend.get_stderr() == ""  # nosec
        assert self.manager.get_stderr() == ""  # nosec

    def check_loading_default_tables(self, database_id: str) -> None:
        """Check if database has successfully load default tables."""
        expected_status = {
            "id": database_id,
            "hyrise_active": True,
            "database_blocked_status": False,
            "worker_pool_status": "closed",
            "loaded_benchmarks": ["tpch_0.1"],
            "loaded_tables": [
                {"table_name": "customer", "benchmark": "tpch_0.1"},
                {"table_name": "lineitem", "benchmark": "tpch_0.1"},
                {"table_name": "nation", "benchmark": "tpch_0.1"},
                {"table_name": "orders", "benchmark": "tpch_0.1"},
                {"table_name": "part", "benchmark": "tpch_0.1"},
                {"table_name": "partsupp", "benchmark": "tpch_0.1"},
                {"table_name": "region", "benchmark": "tpch_0.1"},
                {"table_name": "supplier", "benchmark": "tpch_0.1"},
            ],
        }

        status = self.backend.get_monitor_property("status")
        assert expected_status in status  # nosec

    def test_database_manager_initialization(self):
        """Ensure initialized database manager has no monitor metrics."""
        metrics = [
            "chunks",
            "storage",
        ]
        metrics_attributes = [
            "chunks_data",
            "storage",
        ]

        for i in range(len(metrics)):
            response = self.backend.get_monitor_property(metrics[i])
            assert response["body"][metrics_attributes[i]] == {}  # nosec

        available_datasets = self.backend.get_control_property("data")
        available_databases = self.backend.get_control_property("database")

        historical_metrics = ["throughput", "latency", "queue_length", "system"]
        for metric in historical_metrics:
            timestamp: int = time_ns()
            offset: int = 3_000_000_000
            startts: int = timestamp - offset - 1_000_000_000
            endts: int = timestamp - offset
            response = self.backend.get_historical_monitor_property(
                metric, startts, endts
            )
            assert response == []  # nosec

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
        response = self.backend.add_database(
            "test_database1", DATABASE_HOST, DATABASE_PORT
        )
        assert response == get_response(200)  # nosec

        available_databases = self.backend.get_control_property("database")
        assert available_databases == [  # nosec
            {
                "id": "test_database1",
                "host": DATABASE_HOST,
                "port": DATABASE_PORT,
                "number_workers": 8,
                "dbname": "postgres",
            }
        ]

        sleep(5.0)  # wait until default tables are loaded

        self.check_loading_default_tables("test_database1")

        influx_databases = influx_client.get_list_database()
        assert {"name": "test_database1"} in influx_databases  # nosec

        response = self.backend.remove_database("test_database1")
        assert response == get_response(200)  # nosec

        self.check_stderr()

    def test_execute_workload(self):
        """Execute workload."""
        response = self.backend.add_database(
            "test_database1", DATABASE_HOST, DATABASE_PORT
        )
        assert response == get_response(200)  # nosec

        sleep(5.0)  # wait until default tables are loaded

        self.check_loading_default_tables("test_database1")

        response = self.backend.start_workload("tpch_0.1", 300)
        assert response == get_response(200)  # nosec

        sleep(5.0)  # wait for query executions

        metrics = ["throughput", "latency", "queue_length"]
        for metric in metrics:
            timestamp: int = time_ns()
            offset: int = 3_000_000_000
            startts: int = timestamp - offset - 1_000_000_000
            endts: int = timestamp - offset
            response = self.backend.get_historical_monitor_property(
                metric, startts, endts
            )
            assert response[0][metric][0][metric] > 0  # nosec

        response = self.backend.stop_workload()
        assert response == get_response(200)  # nosec

        self.check_stderr()

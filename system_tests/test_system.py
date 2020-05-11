"""Module for system tests."""
from time import sleep, time_ns

from influxdb import InfluxDBClient

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

SETUP_TIMEOUT = 3.0


class TestSystem:
    """Tests for the whole cockpit system."""

    @classmethod
    def setup_class(cls):
        """Run before every test."""
        cls.influx_client = InfluxDBClient(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
        )
        cls.clean_influx()
        cls.backend = CockpitBackend()
        cls.backend.start()
        cls.manager = CockpitManager()
        cls.manager.start()
        cls.generator = CockpitGenerator()
        cls.generator.start()
        sleep(SETUP_TIMEOUT)

    @classmethod
    def teardown_class(cls):
        """Run after every test."""
        cls.manager.shutdown()
        cls.backend.shutdown()
        cls.generator.shutdown()
        cls.clean_influx()
        cls.influx_client.close()

    @classmethod
    def check_stderr(cls):
        """Check standard error output of the components."""
        assert cls.generator.get_stderr() == ""  # nosec
        assert cls.backend.get_stderr() == ""  # nosec
        assert cls.manager.get_stderr() == ""  # nosec

    @classmethod
    def clean_influx(cls):
        """Delete Influx databases which were created while executing of the tests."""
        cls.influx_client.drop_database("test_database1")

    @classmethod
    def check_loading_default_tables(cls, database_id: str) -> None:
        """Check if database has successfully load default tables."""
        expected_status = {
            "id": database_id,
            "hyrise_active": True,
            "database_blocked_status": False,
            "worker_pool_status": "closed",
            "loaded_benchmarks": ["tpch_0_1", "no-ops_0_1", "no-ops_1"],
            "loaded_tables": [
                "customer_tpch_0_1",
                "lineitem_tpch_0_1",
                "nation_tpch_0_1",
                "orders_tpch_0_1",
                "part_tpch_0_1",
                "partsupp_tpch_0_1",
                "region_tpch_0_1",
                "supplier_tpch_0_1",
            ],
        }

        status = cls.backend.get_monitor_property("status")  # type: ignore
        assert expected_status in status  # nosec

    def test_backend_initializes_without_errors(self):
        """Test backend initializes without errors."""
        self.check_stderr()

    def test_check_static_metric_endpoints(self):
        """Test static metric endpoints return correct values."""
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

    def test_check_historical_metric_endpoints(self):
        """Test historical metric endpoints return correct values."""
        historical_metrics = ["throughput", "latency", "queue_length", "system"]
        for metric in historical_metrics:
            timestamp: int = time_ns()
            offset: int = 3_000_000_000
            startts: int = timestamp - offset - 1_000_000_000
            endts: int = timestamp - offset
            response = self.backend.get_historical_monitor_property(
                metric, startts, endts, 1_000_000_000
            )
            assert response == []  # nosec

    def test_check_available_databases(self):
        """Ensure a new backend has no databases."""
        available_databases = self.backend.get_control_property("database")
        assert available_databases == []  # nosec

    def test_check_available_datasets(self):
        """Test available datasets."""
        available_datasets = self.backend.get_control_property(
            "database/benchmark_tables"
        )
        assert available_datasets == {  # nosec
            "folder_names": ["tpch_0.1", "tpch_1", "tpcds_1", "job"]
        }

    def test_initialization_calls_had_no_errors(self):
        """Test initialization calls had no errors."""
        self.check_stderr()

    def test_adding_database(self):
        """Test adding a database."""
        response = self.backend.add_database(
            "test_database1", DATABASE_HOST, DATABASE_PORT
        )
        assert response.status_code == 200  # nosec

    def test_added_database_is_in_available_databases(self):
        """Test added database is in available databases."""
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

    def test_loading_default_tables(self):
        """Test loading default tables."""
        sleep(5.0)  # wait until default tables are loaded

        self.check_loading_default_tables("test_database1")

    def test_check_influx_database_creation(self):
        """Test the corresponding influx database is created."""
        influx_databases = self.influx_client.get_list_database()
        assert {"name": "test_database1"} in influx_databases  # nosec

    def test_database_handling_had_no_errors(self):
        """Test database handling had no errors."""
        self.check_stderr()

    def test_starting_workload_generator(self):
        """Test starting of the workload generator."""
        response = self.backend.start_workload("tpch_0_1", 300)
        assert response.status_code == 200  # nosec

    def test_starting_worker_pool(self):
        """Test starting of the worker pool."""
        response = self.backend.start_workers()
        assert response.status_code == 200  # nosec

    def test_historical_metric_responses(self):
        """Test responses of the historical metrics."""
        sleep(4.0)  # wait for query executions

        metrics = ["throughput", "latency", "queue_length"]
        for metric in metrics:
            timestamp: int = time_ns()
            offset: int = 1_000_000_000
            startts: int = timestamp - offset - 1_000_000_000
            endts: int = timestamp - offset
            response = self.backend.get_historical_monitor_property(
                metric, startts, endts, 1_000_000_000
            )
            assert response[0][metric][0][metric] > 0  # nosec

    def test_stopping_workload_generator(self):
        """Test stopping of the workload generator."""
        response = self.backend.stop_workload("tpch_0_1")
        assert response.status_code == 200  # nosec

    def test_stopping_worker_pool(self):
        """Test stopping of the worker pool."""
        response = self.backend.stop_workers()
        assert response.status_code == 200  # nosec

    def test_removing_database(self):
        """Test removing of the database."""
        response = self.backend.remove_database("test_database1")
        assert response.status_code == 200  # nosec

    def test_workload_execution_had_no_errors(self):
        """Test workload execution had no errors."""
        self.check_stderr()

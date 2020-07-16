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
            "loaded_benchmarks": ["tpch_0_1", "no-ops_0_1", "no-ops_1"],
            "loaded_tables": [
                "orders_tpch_0_1",
                "partsupp_tpch_0_1",
                "lineitem_tpch_0_1",
                "part_tpch_0_1",
                "nation_tpch_0_1",
                "supplier_tpch_0_1",
                "customer_tpch_0_1",
                "region_tpch_0_1",
            ],
        }

        response = cls.backend.get_property("status/benchmark")  # type: ignore
        status = response.json()[0]
        assert response.status_code == 200  # nosec

        for prop in ["loaded_benchmarks", "loaded_tables"]:
            assert set(expected_status[prop]) == set(status[prop])  # nosec

    def test_initializes_backend(self):
        """Test backend initializes without errors."""
        self.check_stderr()

    def test_returns_metric_values(self):
        """Test static metric endpoints return correct values."""
        metrics = [
            "monitor/chunks",
            "monitor/storage",
        ]
        metrics_attributes = [
            "chunks_data",
            "storage",
        ]

        for i in range(len(metrics)):
            response = self.backend.get_property(metrics[i])

            assert response.status_code == 200  # nosec
            assert response.json()["body"][metrics_attributes[i]] == {}  # nosec

    def test_returns_historical_metric_values_with_no_database_registered(self):
        """Test historical metric endpoints return correct values."""
        historical_metrics = [
            "monitor/throughput",
            "monitor/latency",
            "monitor/queue_length",
            "monitor/system",
        ]
        for metric in historical_metrics:
            timestamp: int = time_ns()
            offset: int = 3_000_000_000
            startts: int = timestamp - offset - 1_000_000_000
            endts: int = timestamp - offset
            response = self.backend.get_historical_property(
                metric, startts, endts, 1_000_000_000
            )
            assert response.status_code == 200  # nosec
            assert response.json() == []  # nosec

    def test_returns_available_databases(self):
        """Ensure a new backend has no databases."""
        response = self.backend.get_control_property("database")

        assert response.status_code == 200  # nosec
        assert response.json() == []  # nosec

    def test_returns_available_datasets(self):
        """Test available datasets."""
        response = self.backend.get_control_property("database/benchmark_tables")

        assert response.status_code == 200  # nosec
        assert response.json() == {  # nosec
            "folder_names": ["tpch_0.1", "tpch_1", "tpcds_1", "job"]
        }

    def test_initialization_calls(self):
        """Test initialization calls had no errors."""
        self.check_stderr()

    def test_adds_database(self):
        """Test adding a database."""
        response = self.backend.add_database(
            "test_database1", DATABASE_HOST, DATABASE_PORT
        )
        assert response.status_code == 200  # nosec

    def test_added_database_is_in_available_databases(self):
        """Test added database is in available databases."""
        response = self.backend.get_control_property("database")

        assert response.status_code == 200  # nosec
        assert response.json() == [  # nosec
            {
                "id": "test_database1",
                "host": DATABASE_HOST,
                "port": DATABASE_PORT,
                "number_workers": 8,
                "dbname": "postgres",
            }
        ]

    def test_loads_default_tables(self):
        """Test loading default tables."""
        sleep(5.0)  # wait until default tables are loaded

        self.check_loading_default_tables("test_database1")

    def test_creates_influx_database(self):
        """Test the corresponding influx database is created."""
        influx_databases = self.influx_client.get_list_database()
        assert {"name": "test_database1"} in influx_databases  # nosec

    def test_handles_database_without_errors(self):
        """Test database handling had no errors."""
        self.check_stderr()

    def test_starts_workload_generator(self):
        """Test starting of the workload generator."""
        response = self.backend.start_workload("tpch_0_1", 300)
        assert response.status_code == 200  # nosec

    def test_starts_worker_pool(self):
        """Test starting of the worker pool."""
        response = self.backend.start_workers()
        assert response.status_code == 200  # nosec

    def test_returns_historical_metric_values_during_workload_execution(self):
        """Test responses of the historical metrics."""
        sleep(4.0)  # wait for query executions

        metrics = ["monitor/throughput", "monitor/latency", "monitor/queue_length"]
        attributes = ["throughput", "latency", "queue_length"]
        for metric, attribute in zip(metrics, attributes):
            timestamp: int = time_ns()
            offset: int = 1_000_000_000
            startts: int = timestamp - offset - 1_000_000_000
            endts: int = timestamp - offset
            response = self.backend.get_historical_property(
                metric, startts, endts, 1_000_000_000
            )

            assert response.status_code == 200  # nosec
            assert response.json()[0][attribute][0][attribute] > 0  # nosec

    def test_activates_plugin(self):
        """Test activation of the plugin."""
        response = self.backend.activate_plugin("test_database1", "Compression")

        assert response.status_code == 200  # nosec

    def test_do_not_activates_already_activated_plugin(self):
        """Test activation of the already activated plugin."""
        sleep(1.0)
        response = self.backend.activate_plugin("test_database1", "Compression")

        assert response.status_code == 423  # nosec

    def test_returns_activated_plugins(self):
        """Test activation of the plugin."""
        response = self.backend.get_activated_plugins()
        assert response.status_code == 200  # nosec
        assert response.json() == [  # nosec
            {
                "id": "test_database1",
                "plugins": [
                    {
                        "name": "Compression",
                        "settings": [
                            {
                                "name": "MemoryBudget",
                                "description": "The memory budget to target for the CompressionPlugin.",
                                "value": "9999999999",
                            }
                        ],
                    }
                ],
            }
        ]

    def test_sets_plugin_settings(self):
        """Test set plugin settings."""
        response = self.backend.set_plugin_settings(
            "test_database1", "Compression", "MemoryBudget", "50000"
        )
        assert response.status_code == 200  # nosec

    def test_returns_new_plugin_settings(self):
        """Test new plugin settings."""
        sleep(1.0)
        response = self.backend.get_activated_plugins()
        assert response.status_code == 200  # nosec
        assert response.json() == [  # nosec
            {
                "id": "test_database1",
                "plugins": [
                    {
                        "name": "Compression",
                        "settings": [
                            {
                                "name": "MemoryBudget",
                                "description": "The memory budget to target for the CompressionPlugin.",
                                "value": "50000",
                            }
                        ],
                    }
                ],
            }
        ]

    def test_returns_plugin_log(self):
        """Test plugin log."""
        sleep(1.0)
        response = self.backend.get_plugin_log()

        assert response.json()[0]["id"] == "test_database1"  # nosec
        assert response.json()[0]["plugin_log"] != []  # nosec
        assert (  # nosec
            response.json()[0]["plugin_log"][0]["reporter"] == "CompressionPlugin"
        )
        assert response.json()[0]["plugin_log"][0]["message"] == "Initialized!"  # nosec

    def test_deactivates_plugin(self):
        """Test deactivation of the plugin."""
        response = self.backend.deactivate_plugin("test_database1", "Compression")

        assert response.status_code == 200  # nosec

    def test_deactivated_plugin_is_not_in_active_plugins(self):
        """Test deactivated plugin is not in the active plugins."""
        sleep(1.0)
        response = self.backend.get_activated_plugins()
        assert response.status_code == 200  # nosec
        assert response.json() == [{"id": "test_database1", "plugins": []}]  # nosec

    def test_gets_workload_statement_information(self):
        """Test getting of the workload statement information."""
        response = self.backend.get_property("monitor/workload_statement_information")
        assert response.status_code == 200  # nosec
        assert len(response.json()) > 0  # nosec
        assert len(response.json()[0]["workload_statement_information"]) > 0  # nosec
        assert (  # nosec
            response.json()[0]["workload_statement_information"][0]["total_frequency"]
            > 0
        )
        assert (  # nosec
            response.json()[0]["workload_statement_information"][0]["total_latency"] > 0
        )

    def test_gets_workload_operator_information(self):
        """Test getting of the workload operator information."""
        response = self.backend.get_property("monitor/workload_operator_information")
        assert response.status_code == 200  # nosec
        assert len(response.json()) > 0  # nosec
        assert len(response.json()[0]["workload_operator_information"]) > 0  # nosec

    def test_stops_workload_generator(self):
        """Test stopping of the workload generator."""
        response = self.backend.stop_workload("tpch_0_1")
        assert response.status_code == 200  # nosec

    def test_stops_worker_pool(self):
        """Test stopping of the worker pool."""
        response = self.backend.stop_workers()
        assert response.status_code == 200  # nosec

    def test_removes_database(self):
        """Test removing of the database."""
        response = self.backend.remove_database("test_database1")
        assert response.status_code == 200  # nosec

    def test_executes_workload(self):
        """Test workload execution had no errors."""
        self.check_stderr()

    def test_keeps_influx_database(self):
        """Test the corresponding influx database is kept after database removing."""
        influx_databases = self.influx_client.get_list_database()
        assert {"name": "test_database1"} in influx_databases  # nosec

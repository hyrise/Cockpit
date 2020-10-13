"""Module for backend system tests.

The system test is defined through the following user scenario:
1. Add a database
2. Load TPC-H sf 0.1 tables
3. Start workload generation for TPC-H (SF 0.1)
4. Start workers
5. Activate compression plug-in
6. Change compression plug-in settings
7. Get plug-in log
8. deactivate plug-in
9. Stop workload generation
10. Stop workers
11. Remove database
"""

from time import sleep, time_ns

from system_tests.settings import DATABASE_HOST, DATABASE_PORT, DEFAULT_TIME_OUT


class TestSystem:
    """TestSystem class tests every step of the user scenario."""

    @classmethod
    def check_tables_loaded(
        cls, database_id: str, workload_type: str, scalefactor: float
    ) -> None:
        """Check if database has successfully load tables."""
        response = cls.backend.get_property("status/workload_tables")  # type: ignore
        assert response.status_code == 200  # nosec

        status = None
        for entry in response.json():
            if entry["id"] == database_id:
                status = entry["workload_tables_status"]
                break
        assert status  # nosec

        benchmark_status = None
        for benchmark_entry in status:
            if (
                benchmark_entry["workload_type"] == workload_type
                and benchmark_entry["scale_factor"] == scalefactor
            ):
                benchmark_status = benchmark_entry
                break
        assert benchmark_status  # nosec

        assert benchmark_status["missing_tables"] == []  # nosec
        assert benchmark_status["completely_loaded"]  # nosec

    def test_returns_metric_values_with_no_database_registered(self):
        """Test static metric endpoints return correct values."""
        metrics = [
            "monitor/chunks",
            "monitor/storage",
        ]
        for i in range(len(metrics)):
            response = self.backend.get_property(metrics[i])
            assert response.status_code == 200  # nosec
            assert response.json() == []  # nosec

    def test_returns_historical_metric_values_with_no_database_registered(self):
        """Test historical metric endpoints return correct values."""
        historical_metrics = [
            "metric/throughput",
            "metric/latency",
            "metric/queue_length",
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
        """Ensure a new started backend has no databases."""
        response = self.backend.get_property("control/database")

        assert response.status_code == 200  # nosec
        assert response.json() == []  # nosec

    def test_returns_available_datasets(self):
        """Test available datasets."""
        response = self.backend.get_property("control/database/workload_tables")

        assert response.status_code == 200  # nosec
        assert response.json() == {  # nosec
            "workload_tables": [
                {"workload_type": "tpch", "scale_factor": 0.1},
                {"workload_type": "tpch", "scale_factor": 1},
                {"workload_type": "tpcc", "scale_factor": 5},
                {"workload_type": "tpcds", "scale_factor": 1},
                {"workload_type": "job", "scale_factor": 1},
            ]
        }

    def test_adds_database(self):
        """Test adding a database.

        This test is adding a database with the id test_database1.
        """
        response = self.backend.add_database(
            "test_database1", DATABASE_HOST, DATABASE_PORT
        )
        assert response.status_code == 200  # nosec

    def test_creates_influx_database(self):
        """Test the corresponding influx database is created.

        For every added Hyrise database a corresponding database inside the influx
        is created. So for example if we add a Hyrise with the id test_database1 we expect
        that inside the influx is a corresponding database with the same name.
        """
        influx_databases = self.influx_client.get_list_database()
        assert {"name": "test_database1"} in influx_databases  # nosec

    def test_added_database_is_in_available_databases(self):
        """Test added database is in available databases.

        Here we test that the database we added before is returned
        from the control/database endpoint.
        """
        response = self.backend.get_property("control/database")

        assert response.status_code == 200  # nosec
        assert response.json() == [  # nosec
            {
                "id": "test_database1",
                "host": DATABASE_HOST,
                "port": DATABASE_PORT,
                "number_workers": 2,
                "dbname": "postgres",
            }
        ]

    def test_loads_tpch_sf_0_1_tables(self):
        """Test loading TPC-H tables with scale factor 0.1."""
        response = self.backend.load_tables("tpch", 0.1)
        assert response.status_code == 200  # nosec

    def test_loading_tpch_sf_0_1_tables_completed(self):
        """Test complete loading of the default tables.

        After a wait we check if the tables are completely loaded in the back-end.
        """
        sleep(DEFAULT_TIME_OUT)
        self.check_tables_loaded("test_database1", "tpch", 0.1)

    def test_starts_workload_generator(self):
        """Test starting of the workload generator.

        We start the workload generator. It will generate a TPC-H
        workload with the scale factor 0.1. It will publish 10 tasks
        per second.
        """
        response = self.backend.start_workload("tpch", 0.1, 10)
        assert response.status_code == 200  # nosec

    def test_starts_worker_pool(self):
        """Test starting of the worker pool.

        This tests starts the worker. As a result the Hyrise instance is
        now under load.
        """
        response = self.backend.start_workers()
        assert response.status_code == 200  # nosec

    def test_returns_historical_metric_values_during_workload_execution(self):
        """Test responses of the historical metrics.

        After a while we check the metric data for throughput, latency
        and queue_length. With only 10 task per second it is possible that
        the queue_length value is 0.
        """
        sleep(DEFAULT_TIME_OUT)  # wait for query executions
        metrics = ["metric/throughput", "metric/latency", "metric/queue_length"]
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
            if attribute == "queue_length":
                assert response.json()[0][attribute][0][attribute] >= 0.0  # nosec
            else:
                assert response.json()[0][attribute][0][attribute] > 0.0  # nosec

    def test_activates_plugin(self):
        """Test activation of the plug-in.

        This tests activates the Compression plug-in.
        """
        response = self.backend.activate_plugin("test_database1", "Compression")

        assert response.status_code == 200  # nosec

    def test_do_not_activates_already_activated_plugin(self):
        """Test activation of the already activated plug-in.

        If we activated a plug-in in the Hyrise we need to check that if
        we try to activate it again the back-end denies the activation.
        This test checks that behavior by trying to activate the Compression plug-in
        again.
        """
        sleep(DEFAULT_TIME_OUT)
        response = self.backend.activate_plugin("test_database1", "Compression")

        assert response.status_code == 423  # nosec

    def test_returns_activated_plugins(self):
        """Test activation of the plug-in.

        THis tests checks if the Compression plug-in is returned correctly
        inside all activated plug-ins.
        """
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
                                "description": "The memory budget (MB) to target for the CompressionPlugin.",
                                "value": "10000",
                                "display_name": "Memory Budget (MB)",
                            }
                        ],
                    }
                ],
            }
        ]

    def test_sets_plugin_settings(self):
        """Test set plug-in settings.

        This test sets the plug-in settings for the Compression plug-in.
        """
        response = self.backend.set_plugin_settings(
            "test_database1", "Compression", "MemoryBudget", "50000"
        )
        assert response.status_code == 200  # nosec

    def test_returns_new_plugin_settings(self):
        """Test new plug-in settings.

        This test checks if the settings from the Compression plug-in
        were set correctly.
        """
        sleep(DEFAULT_TIME_OUT)
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
                                "description": "The memory budget (MB) to target for the CompressionPlugin.",
                                "value": "50000",
                                "display_name": "Memory Budget (MB)",
                            }
                        ],
                    }
                ],
            }
        ]

    def test_returns_plugin_log(self):
        """Test plugin log.

        This test checks if there is a plug-in log for the Compression plug-in
        that is activated on test_database1.
        """
        sleep(DEFAULT_TIME_OUT)
        response = self.backend.get_plugin_log()

        assert response.json()[0]["id"] == "test_database1"  # nosec
        assert response.json()[0]["log"] != []  # nosec
        assert response.json()[0]["log"][0]["reporter"] == "CompressionPlugin"  # nosec
        assert response.json()[0]["log"][0]["message"] == "Initialized!"  # nosec

    def test_deactivates_plugin(self):
        """Test deactivation of the plugin.

        This test deactivates the Compression plug-in.
        """
        response = self.backend.deactivate_plugin("test_database1", "Compression")
        assert response.status_code == 200  # nosec

    def test_deactivated_plugin_is_not_in_active_plugins(self):
        """Test deactivated plugin is not in the active plugins."""
        sleep(DEFAULT_TIME_OUT)
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
        response = self.backend.stop_workload("tpch")
        assert response.status_code == 200  # nosec

    def test_stops_worker_pool(self):
        """Test stopping of the worker pool."""
        response = self.backend.stop_workers()
        assert response.status_code == 200  # nosec

    def test_removes_database(self):
        """Test removing of the database."""
        response = self.backend.remove_database("test_database1")
        assert response.status_code == 200  # nosec

    def test_keeps_influx_database(self):
        """Test the corresponding influx database is kept after database removing."""
        influx_databases = self.influx_client.get_list_database()
        assert {"name": "test_database1"} in influx_databases  # nosec

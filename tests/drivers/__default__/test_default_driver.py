"""Tests for default driver."""
from unittest.mock import MagicMock, patch

from psycopg2.extensions import AsIs
from pytest import fixture

from hyrisecockpit.drivers.__default__.driver import DefaultDriver


@fixture
def default_driver() -> DefaultDriver:
    """Get default driver."""
    query_path = "query_path"
    scale_factor_query_path = {0.1: "workload_0_1", 1.0: "workload_1"}
    benchmark_type = "benchmark"
    table_names = ["table1", "table2"]

    return DefaultDriver(
        query_path, scale_factor_query_path, benchmark_type, table_names
    )


class TestDefaultDriver:
    """Test for default driver."""

    def test_inintializes_default_driver(self, default_driver) -> None:
        """Test initialization of driver attributes."""
        assert default_driver._query_path == "query_path"
        assert default_driver._scale_factor_query_path == {
            0.1: "workload_0_1",
            1.0: "workload_1",
        }
        assert default_driver._benchmark_type == "benchmark"
        assert default_driver._table_names == ["table1", "table2"]
        assert default_driver._workloads == {}

    def test_get_workload_for_scale_factor_if_workload_is_present(
        self, default_driver
    ) -> None:
        """Test getting of the workload."""
        mock_workload = MagicMock()
        default_driver._workloads = {1.0: mock_workload}
        workload = default_driver._get_workload_for_scale_factor(1.0)

        assert workload == mock_workload

    @patch("hyrisecockpit.drivers.__default__.driver.DefaultWorkload")
    def test_get_workload_for_scale_factor_if_workload_is_not_present(
        self, mock_default_workload, default_driver
    ) -> None:
        """Test getting of the workload."""
        mock_workload = MagicMock()
        mock_default_workload.return_value = mock_workload

        workload = default_driver._get_workload_for_scale_factor(1.0)

        assert workload == mock_workload

    @patch(
        "hyrisecockpit.drivers.__default__.driver.DefaultDriver._get_workload_for_scale_factor"
    )
    def test_generates_workload(
        self, mock_get_workload_for_scale_factor, default_driver
    ) -> None:
        """Test getting of the workload."""
        mock_workload = MagicMock()
        mock_workload.get.return_value = ["task 1", "task 2"]
        mock_get_workload_for_scale_factor.return_value = mock_workload

        scalefactor = 1.0
        frequency = 2
        weights = {"1": 1.0}

        generated_workload = default_driver.generate(scalefactor, frequency, weights)

        assert generated_workload == ["task 1", "task 2"]

    def test_gets_formatted_scalefactor(self, default_driver) -> None:
        """Test get formatted scalefactor."""
        assert "0_5" == default_driver._get_formatted_scalefactor(0.5)
        assert "1" == default_driver._get_formatted_scalefactor(1.0)
        assert "1_5" == default_driver._get_formatted_scalefactor(1.5)

    def test_gets_table_names(self, default_driver) -> None:
        """Test get table names."""
        table_names = default_driver.get_table_names(0.5)

        assert table_names == {
            "table1": "table1_benchmark_0_5",
            "table2": "table2_benchmark_0_5",
        }

    def test_gets_load_queries(self, default_driver) -> None:
        """Test get load table queries."""
        load_table_queies = default_driver.get_load_queries(0.5)

        assert load_table_queies == {
            "table1_benchmark_0_5": (
                "COPY %s_%s_%s FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';",
                (
                    ("table1", "as_is"),
                    ("benchmark", "as_is"),
                    ("0_5", "as_is"),
                    ("benchmark", "as_is"),
                    ("0_5", "as_is"),
                    ("table1", "as_is"),
                ),
            ),
            "table2_benchmark_0_5": (
                "COPY %s_%s_%s FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';",
                (
                    ("table2", "as_is"),
                    ("benchmark", "as_is"),
                    ("0_5", "as_is"),
                    ("benchmark", "as_is"),
                    ("0_5", "as_is"),
                    ("table2", "as_is"),
                ),
            ),
        }

    def test_gets_delete_queries(self, default_driver) -> None:
        """Test get delete tables queries."""
        load_table_queies = default_driver.get_delete_queries(0.5)

        assert load_table_queies == {
            "table1_benchmark_0_5": (
                "DROP TABLE %s_%s_%s;",
                (("table1", "as_is"), ("benchmark", "as_is"), ("0_5", "as_is"),),
            ),
            "table2_benchmark_0_5": (
                "DROP TABLE %s_%s_%s;",
                (("table2", "as_is"), ("benchmark", "as_is"), ("0_5", "as_is"),),
            ),
        }

    def test_gets_formatted_parameters(self, default_driver) -> None:
        """Test get formatted parameters."""
        not_formatted_parameters = ((12, None), ("info", "as_is"))
        formatted_parameters = default_driver._get_formatted_parameters(
            not_formatted_parameters
        )
        empty_parameters = default_driver._get_formatted_parameters([])

        assert empty_parameters is None
        assert len(formatted_parameters) == 2
        assert formatted_parameters[0] == 12
        assert formatted_parameters[1].getquoted() == AsIs("info").getquoted()

    @patch("hyrisecockpit.drivers.__default__.driver.time_ns")
    def test_executes_query(self, mock_time_ns, default_driver) -> None:
        """Test executes query."""
        mock_time_ns.return_value = 10
        mock_cursor = MagicMock()
        mock_query = "SQL query;"
        mock_formatted_parameters = ["param1", "param2"]

        endts, latency = default_driver._execute_query(
            mock_cursor, mock_query, mock_formatted_parameters
        )

        assert endts == 10
        assert latency == 0
        assert mock_cursor.execute.called_once_with(
            mock_query, mock_formatted_parameters
        )
        mock_cursor.connection.commit.assert_called_once()

    @patch("hyrisecockpit.drivers.__default__.driver.time_ns")
    def test_executes_task(self, mock_time_ns, default_driver) -> None:
        """Test executes task."""
        mock_time_ns.return_value = 10
        mock_cursor = MagicMock()
        mock_worker_id = 10
        mock_task = {
            "query": "SQL query with worker [STREAM_ID];",
            "args": [("param1", None), ("param2", None)],
            "query_type": "query_type",
            "scalefactor": 1.0,
        }
        expected_query = "SQL query with worker 10;"
        expected_parameters = ["param1", "param2"]

        endts, latency, scalefactor, query_type, commited = default_driver.execute_task(
            mock_task, mock_cursor, mock_worker_id
        )

        assert endts == 10
        assert latency == 0
        assert scalefactor == 1.0
        assert query_type == "query_type"
        assert commited
        assert mock_cursor.execute.called_once_with(expected_query, expected_parameters)

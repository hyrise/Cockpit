"""Tests for default driver."""
from unittest.mock import MagicMock, patch

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

    def test_gets_table_names(self, default_driver) -> None:
        """Test get table names."""
        table_names = default_driver.get_table_names(0.5)

        assert table_names == {
            "table1": "table1_benchmark_0_5",
            "table2": "table2_benchmark_0_5",
        }

        table_names = default_driver.get_table_names(1.0)

        assert table_names == {
            "table1": "table1_benchmark_1",
            "table2": "table2_benchmark_1",
        }

        table_names = default_driver.get_table_names(1.5)

        assert table_names == {
            "table1": "table1_benchmark_1_5",
            "table2": "table2_benchmark_1_5",
        }

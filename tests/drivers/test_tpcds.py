"""Tests for tpcds driver."""
from collections import OrderedDict
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.drivers.tpcds.tpcds_driver import TpcdsDriver
from hyrisecockpit.drivers.tpcds.tpcds_meta_information import default_weights, tables


class TestTpcdsDriver:
    """Tests for tpcds driver class."""

    @fixture
    @patch("hyrisecockpit.drivers.tpcds.tpcds_driver.DefaultDriver", MagicMock())
    @patch("hyrisecockpit.drivers.tpcds.tpcds_driver.abspath", MagicMock())
    @patch("hyrisecockpit.drivers.tpcds.tpcds_driver.getcwd", MagicMock())
    def tpcds_driver(self) -> TpcdsDriver:
        """Get a new tpcds driver."""
        return TpcdsDriver()

    @patch("hyrisecockpit.drivers.tpcds.tpcds_driver.DefaultDriver")
    @patch("hyrisecockpit.drivers.tpcds.tpcds_driver.abspath")
    @patch("hyrisecockpit.drivers.tpcds.tpcds_driver.getcwd")
    def test_inintializes_tpcds_driver(
        self,
        mock_getcwd: MagicMock,
        mock_abspath: MagicMock,
        mock_default_driver: MagicMock,
    ) -> None:
        """Test initialization of tpcds driver attributes."""
        mock_default_driver_obj = MagicMock()
        mock_default_driver.return_value = mock_default_driver_obj
        mock_abspath.return_value = "/abspath"
        tpcds_driver = TpcdsDriver()
        assert (
            tpcds_driver._query_path
            == "/abspath/hyrisecockpit/workload_generator/workloads"
        )
        assert tpcds_driver._benchmark_type == "tpcds"
        assert tpcds_driver._table_names == tables
        assert tpcds_driver.scale_factors == [1.0]
        assert tpcds_driver._scale_factor_query_path == {1.0: "tpcds_1"}
        assert tpcds_driver._default_driver == mock_default_driver_obj
        mock_default_driver.assert_called_once_with(
            tpcds_driver._query_path,
            tpcds_driver._scale_factor_query_path,
            tpcds_driver._benchmark_type,
            tpcds_driver._table_names,
        )

    def test_get_scalefactors(self, tpcds_driver) -> None:
        """Test gets scalefactors."""
        assert tpcds_driver.get_scalefactors() == [1.0]

    def test_get_default_weights(self, tpcds_driver) -> None:
        """Test get default weights for workload."""
        expected = OrderedDict(default_weights)
        response = tpcds_driver.get_default_weights()
        assert expected == response

    def test_generate(self, tpcds_driver) -> None:
        """Test get generated workload tasks."""
        mock_default_driver = MagicMock()
        mock_default_driver.generate.return_value = ["task one", "task_two"]
        tpcds_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        frequency = 200
        weights = {"01": 1.0, "02": 4.0}
        response = tpcds_driver.generate(scalefactor, frequency, weights)
        assert ["task one", "task_two"] == response
        mock_default_driver.generate.assert_called_once_with(
            scalefactor, frequency, weights
        )

    def test_get_table_names(self, tpcds_driver) -> None:
        """Test get table names for workload."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_table_names.return_value = {
            "customer": "customer_tpcds_1"
        }
        tpcds_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = tpcds_driver.get_table_names(scalefactor)
        assert {"customer": "customer_tpcds_1"} == response
        mock_default_driver.get_table_names.assert_called_once_with(scalefactor)

    def test_get_load_queries(self, tpcds_driver) -> None:
        """Test get loading queries for workload tables."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_load_queries.return_value = {
            "customer_tpcds_1": "load customer"
        }
        tpcds_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = tpcds_driver.get_load_queries(scalefactor)
        assert {"customer_tpcds_1": "load customer"} == response
        mock_default_driver.get_load_queries.assert_called_once_with(scalefactor)

    def test_get_delete_queries(self, tpcds_driver) -> None:
        """Test get delete queries for workload tables."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_delete_queries.return_value = {
            "customer_tpcds_1": "delete customer"
        }
        tpcds_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = tpcds_driver.get_delete_queries(scalefactor)
        assert {"customer_tpcds_1": "delete customer"} == response
        mock_default_driver.get_delete_queries.assert_called_once_with(scalefactor)

    def test_execute_task(self, tpcds_driver) -> None:
        """Test call execute task from driver."""
        mock_default_driver = MagicMock()
        mock_default_driver.execute_task.return_value = (
            10,
            20,
            1.0,
            "query_type",
            True,
        )
        tpcds_driver._default_driver = mock_default_driver
        task = "task"
        cursor = MagicMock()
        worker_id = "worker_01"
        response = tpcds_driver.execute_task(task, cursor, worker_id)
        assert (10, 20, 1.0, "query_type", True) == response
        mock_default_driver.execute_task.assert_called_once_with(
            task, cursor, worker_id
        )

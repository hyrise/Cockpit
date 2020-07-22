"""Tests for tpch driver."""
from collections import OrderedDict
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.drivers.tpch.tpch_driver import TpchDriver


class TestTpchDriver:
    """Tests for tpch driver class."""

    @fixture
    @patch("hyrisecockpit.drivers.tpch.tpch_driver.DefaultDriver", MagicMock())
    @patch("hyrisecockpit.drivers.tpch.tpch_driver.abspath", MagicMock())
    @patch("hyrisecockpit.drivers.tpch.tpch_driver.getcwd", MagicMock())
    def tpch_driver(self) -> TpchDriver:
        """Get a new tpch driver."""
        return TpchDriver()

    @patch("hyrisecockpit.drivers.tpch.tpch_driver.DefaultDriver")
    @patch("hyrisecockpit.drivers.tpch.tpch_driver.abspath")
    @patch("hyrisecockpit.drivers.tpch.tpch_driver.getcwd")
    def test_inintializes_tpch_driver(
        self,
        mock_getcwd: MagicMock,
        mock_abspath: MagicMock,
        mock_default_driver: MagicMock,
    ) -> None:
        """Test initialization of tpch driver attributes."""
        mock_default_driver_obj = MagicMock()
        mock_default_driver.return_value = mock_default_driver_obj
        mock_abspath.return_value = "/abspath"
        tpch_driver = TpchDriver()
        assert tpch_driver._query_path == "/abspath/workload_generator/workloads"
        assert tpch_driver._benchmark_type == "tpch"
        assert tpch_driver._table_names == [
            "customer",
            "lineitem",
            "nation",
            "orders",
            "part",
            "partsupp",
            "region",
            "supplier",
        ]
        assert tpch_driver.scale_factors == [0.1, 1.0]
        assert tpch_driver._scale_factor_query_path == {0.1: "tpch_0_1", 1.0: "tpch_1"}
        assert tpch_driver._default_driver == mock_default_driver_obj
        mock_default_driver.assert_called_once_with(
            tpch_driver._query_path,
            tpch_driver._scale_factor_query_path,
            tpch_driver._benchmark_type,
            tpch_driver._table_names,
        )

    def test_get_scalefactors(self, tpch_driver) -> None:
        """Test gets scalefactors."""
        assert tpch_driver.get_scalefactors() == [0.1, 1.0]

    def test_get_default_weights(self, tpch_driver) -> None:
        """Test get default weights for workload."""
        expected = OrderedDict(("{:02d}".format(i), 1.0) for i in range(1, 23))
        response = tpch_driver.get_default_weights()
        assert expected == response

    def test_generate(self, tpch_driver) -> None:
        """Test get generated workload tasks."""
        mock_default_driver = MagicMock()
        mock_default_driver.generate.return_value = ["task one", "task_two"]
        tpch_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        frequency = 200
        weights = {"01": 1.0, "02": 4.0}
        response = tpch_driver.generate(scalefactor, frequency, weights)
        assert ["task one", "task_two"] == response
        mock_default_driver.generate.assert_called_once_with(
            scalefactor, frequency, weights
        )

    def test_get_table_names(self, tpch_driver) -> None:
        """Test get table names for workload."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_table_names.return_value = {
            "customer": "customer_tpch_1"
        }
        tpch_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = tpch_driver.get_table_names(scalefactor)
        assert {"customer": "customer_tpch_1"} == response
        mock_default_driver.get_table_names.assert_called_once_with(scalefactor)

    def test_get_load_queries(self, tpch_driver) -> None:
        """Test get loading queries for workload tables."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_load_queries.return_value = {
            "customer_tpch_1": "load customer"
        }
        tpch_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = tpch_driver.get_load_queries(scalefactor)
        assert {"customer_tpch_1": "load customer"} == response
        mock_default_driver.get_load_queries.assert_called_once_with(scalefactor)

    def test_get_delete_queries(self, tpch_driver) -> None:
        """Test get delete queries for workload tables."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_delete_queries.return_value = {
            "customer_tpch_1": "delete customer"
        }
        tpch_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = tpch_driver.get_delete_queries(scalefactor)
        assert {"customer_tpch_1": "delete customer"} == response
        mock_default_driver.get_delete_queries.assert_called_once_with(scalefactor)

    def test_execute_task(self, tpch_driver) -> None:
        """Test call execute task from driver."""
        mock_default_driver = MagicMock()
        mock_default_driver.execute_task.return_value = (
            10,
            20,
            1.0,
            "query_type",
            True,
        )
        tpch_driver._default_driver = mock_default_driver
        task = "task"
        cursor = MagicMock()
        worker_id = "worker_01"
        response = tpch_driver.execute_task(task, cursor, worker_id)
        assert (10, 20, 1.0, "query_type", True) == response
        mock_default_driver.execute_task.assert_called_once_with(
            task, cursor, worker_id
        )

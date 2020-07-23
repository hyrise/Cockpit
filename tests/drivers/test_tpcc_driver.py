"""Tests for tpcc driver."""
from collections import OrderedDict
from unittest.mock import MagicMock, patch

from psycopg2.errors import SerializationFailure
from pytest import fixture

from hyrisecockpit.drivers.tpcc.tpcc_driver import TpccDriver


class TestTpccDriver:
    """Tests for tpch driver class."""

    @fixture
    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.TPCCParameterGenerator", MagicMock())
    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.TPCCTransactionHandler", MagicMock())
    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.abspath", MagicMock())
    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.getcwd", MagicMock())
    def tpcc_driver(self) -> TpccDriver:
        """Get a new tpcc driver."""
        return TpccDriver()

    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.TPCCParameterGenerator")
    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.TPCCTransactionHandler")
    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.abspath")
    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.getcwd")
    def test_inintializes_tpcc_driver(
        self,
        mock_getcwd: MagicMock,
        mock_abspath: MagicMock,
        mock_tpcc_transaction_handler: MagicMock,
        mock_tpcc_parameter_generator: MagicMock,
    ) -> None:
        """Test initialization of tpcc driver attributes."""
        mock_tpcc_transaction_handler_obj = MagicMock()
        mock_tpcc_transaction_handler.return_value = mock_tpcc_transaction_handler_obj
        mock_tpcc_parameter_generator_obj = MagicMock()
        mock_tpcc_parameter_generator.return_value = mock_tpcc_parameter_generator_obj
        mock_abspath.return_value = "/abspath"
        tpcc_driver = TpccDriver()
        assert tpcc_driver._query_path == "/abspath/workload_generator/workloads"
        assert tpcc_driver._benchmark_type == "tpcc"
        assert tpcc_driver._table_names == [
            "warehouse",
            "district",
            "customer",
            "history",
            "new_order",
            "order",
            "order_line",
            "item",
            "stock",
        ]
        assert tpcc_driver.scale_factors == [5.0]
        assert tpcc_driver._transaction_handler == mock_tpcc_transaction_handler_obj
        assert tpcc_driver._parameter_generator == mock_tpcc_parameter_generator_obj

    def test_get_scalefactors(self, tpcc_driver) -> None:
        """Test gets scalefactors."""
        assert tpcc_driver.get_scalefactors() == [5.0]

    def test_get_default_weights(self, tpcc_driver) -> None:
        """Test get default weights for workload."""
        expected = OrderedDict(
            {
                "stock_level": 0.04,
                "delivery": 0.04,
                "order_status": 0.04,
                "payment": 0.43,
                "new_order": 0.45,
            }
        )
        response = tpcc_driver.get_default_weights()
        assert expected == response

    def test_generate(self, tpcc_driver) -> None:
        """Test get generated workload tasks."""
        mock_parameter_generator = MagicMock()
        mock_parameter_generator.generate_transactions.return_value = [
            "task1 ",
            "task 2",
        ]
        tpcc_driver._parameter_generator = mock_parameter_generator
        tpcc_driver._parameter_generator = mock_parameter_generator
        scalefactor = 1.0
        frequency = 200
        weights = {"01": 1.0, "02": 4.0}

        response = tpcc_driver.generate(scalefactor, frequency, weights)

        assert ["task1 ", "task 2"] == response
        mock_parameter_generator.generate_transactions.assert_called_once_with(
            frequency, weights
        )
        mock_parameter_generator.apply_scalefactor.assert_called_once_with(scalefactor)

    def test_get_table_names(self, tpcc_driver) -> None:
        """Test get table names for workload."""
        scalefactor = 1.0
        expected = {
            "warehouse": "warehouse_tpcc_1",
            "district": "district_tpcc_1",
            "customer": "customer_tpcc_1",
            "history": "history_tpcc_1",
            "new_order": "new_order_tpcc_1",
            "order": "order_tpcc_1",
            "order_line": "order_line_tpcc_1",
            "item": "item_tpcc_1",
            "stock": "stock_tpcc_1",
        }
        response = tpcc_driver.get_table_names(scalefactor)
        assert expected == response

    def test_get_load_queries(self, tpcc_driver) -> None:
        """Test get loading queries for workload tables."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_load_queries.return_value = {
            "customer_tpcc_1": "load customer"
        }
        tpcc_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = tpcc_driver.get_load_queries(scalefactor)
        assert {"customer_tpcc_1": "load customer"} == response
        mock_default_driver.get_load_queries.assert_called_once_with(scalefactor)

    def test_get_delete_queries(self, tpcc_driver) -> None:
        """Test get delete queries for workload tables."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_delete_queries.return_value = {
            "customer_tpcc_1": "delete customer"
        }
        tpcc_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = tpcc_driver.get_delete_queries(scalefactor)
        assert {"customer_tpcc_1": "delete customer"} == response
        mock_default_driver.get_delete_queries.assert_called_once_with(scalefactor)

    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.time_ns", lambda: 1)
    def test_execute_task(self, tpcc_driver) -> None:
        """Test call execute task from driver."""
        mock_cursor = MagicMock()
        mock_transaction_handler = MagicMock()
        tpcc_driver._transaction_handler = mock_transaction_handler
        task = {"transaction_type": "tpcc", "scalefactor": 1.0, "args": ["parameters"]}
        expected = (1, 0, 1.0, "tpcc", True)

        response = tpcc_driver.execute_task(task, mock_cursor, "worker_id")

        assert expected == response

    @patch("hyrisecockpit.drivers.tpcc.tpcc_driver.time_ns", lambda: 1)
    def test_execute_task_witch_serialization_failure(self, tpcc_driver) -> None:
        """Test call execute task from driver with serialization failure in task execution."""
        mock_cursor = MagicMock()
        mock_transaction_handler = MagicMock()
        mock_transaction_handler.execute_transaction.side_effect = MagicMock(
            side_effect=SerializationFailure
        )
        tpcc_driver._transaction_handler = mock_transaction_handler
        task = {"transaction_type": "tpcc", "scalefactor": 1.0, "args": ["parameters"]}
        expected = (1, 0, 1.0, "tpcc", False)

        response = tpcc_driver.execute_task(task, mock_cursor, "worker_id")

        assert expected == response

"""Tests for job driver."""
from collections import OrderedDict
from unittest.mock import MagicMock, patch

from pytest import fixture

from hyrisecockpit.drivers.job.job_driver import JobDriver
from hyrisecockpit.drivers.job.job_meta_information import default_weights, tables


class TestJobDriver:
    """Tests for job driver class."""

    @fixture
    @patch("hyrisecockpit.drivers.job.job_driver.DefaultDriver", MagicMock())
    @patch("hyrisecockpit.drivers.job.job_driver.abspath", MagicMock())
    @patch("hyrisecockpit.drivers.job.job_driver.getcwd", MagicMock())
    def job_driver(self) -> JobDriver:
        """Get a new job driver."""
        return JobDriver()

    @patch("hyrisecockpit.drivers.job.job_driver.DefaultDriver")
    @patch("hyrisecockpit.drivers.job.job_driver.abspath")
    @patch("hyrisecockpit.drivers.job.job_driver.getcwd")
    def test_inintializes_job_driver(
        self,
        mock_getcwd: MagicMock,
        mock_abspath: MagicMock,
        mock_default_driver: MagicMock,
    ) -> None:
        """Test initialization of job driver attributes."""
        mock_default_driver_obj = MagicMock()
        mock_default_driver.return_value = mock_default_driver_obj
        mock_abspath.return_value = "/abspath"
        job_driver = JobDriver()
        assert job_driver._query_path == "/abspath/workload_generator/workloads"
        assert job_driver._benchmark_type == "job"
        assert job_driver._table_names == tables
        assert job_driver.scale_factors == [1.0]
        assert job_driver._scale_factor_query_path == {1.0: "job_1"}
        assert job_driver._default_driver == mock_default_driver_obj
        mock_default_driver.assert_called_once_with(
            job_driver._query_path,
            job_driver._scale_factor_query_path,
            job_driver._benchmark_type,
            job_driver._table_names,
        )

    def test_get_default_weights(self, job_driver) -> None:
        """Test get default weights for workload."""
        expected = OrderedDict(default_weights)
        response = job_driver.get_default_weights()
        assert expected == response

    def test_generate(self, job_driver) -> None:
        """Test get generated workload tasks."""
        mock_default_driver = MagicMock()
        mock_default_driver.generate.return_value = ["task one", "task_two"]
        job_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        frequency = 200
        weights = {"01": 1.0, "02": 4.0}
        response = job_driver.generate(scalefactor, frequency, weights)
        assert ["task one", "task_two"] == response
        mock_default_driver.generate.assert_called_once_with(
            scalefactor, frequency, weights
        )

    def test_get_table_names(self, job_driver) -> None:
        """Test get table names for workload."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_table_names.return_value = {
            "customer": "customer_job_1"
        }
        job_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = job_driver.get_table_names(scalefactor)
        assert {"customer": "customer_job_1"} == response
        mock_default_driver.get_table_names.assert_called_once_with(scalefactor)

    def test_get_load_queries(self, job_driver) -> None:
        """Test get loading queries for workload tables."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_load_queries.return_value = {
            "customer_job_1": "load customer"
        }
        job_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = job_driver.get_load_queries(scalefactor)
        assert {"customer_job_1": "load customer"} == response
        mock_default_driver.get_load_queries.assert_called_once_with(scalefactor)

    def test_get_delete_queries(self, job_driver) -> None:
        """Test get delete queries for workload tables."""
        mock_default_driver = MagicMock()
        mock_default_driver.get_delete_queries.return_value = {
            "customer_job_1": "delete customer"
        }
        job_driver._default_driver = mock_default_driver
        scalefactor = 1.0
        response = job_driver.get_delete_queries(scalefactor)
        assert {"customer_job_1": "delete customer"} == response
        mock_default_driver.get_delete_queries.assert_called_once_with(scalefactor)

    def test_execute_task(self, job_driver) -> None:
        """Test call execute task from driver."""
        mock_default_driver = MagicMock()
        mock_default_driver.execute_task.return_value = (
            10,
            20,
            1.0,
            "query_type",
            True,
        )
        job_driver._default_driver = mock_default_driver
        task = "task"
        cursor = MagicMock()
        worker_id = "worker_01"
        response = job_driver.execute_task(task, cursor, worker_id)
        assert (10, 20, 1.0, "query_type", True) == response
        mock_default_driver.execute_task.assert_called_once_with(
            task, cursor, worker_id
        )

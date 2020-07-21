"""Tests for the connector module."""
from unittest.mock import MagicMock

from hyrisecockpit.drivers.connector import Workload


class TestWorkload:
    """Test for workload class."""

    def test_inintializes_workload(self) -> None:
        """Test initialization of workload attributes."""
        mock_driver = MagicMock()
        mock_driver.get_default_weights.return_value = {"01": 2, "02": 1}
        worklaod = Workload(mock_driver)

        assert not worklaod.running
        assert worklaod.scale_factor == 0
        assert worklaod.weights == {"01": 2, "02": 1}
        assert worklaod.frequency == 0
        assert worklaod.driver == mock_driver

    def test_get_default_weights(self) -> None:
        """Test get default weights workload."""
        mock_driver = MagicMock()
        mock_driver.get_default_weights.return_value = {"01": 2, "02": 1}
        worklaod = Workload(mock_driver)
        results = worklaod.get_default_weights()
        assert results == {"01": 2, "02": 1}

    def test_update_workload_with_weights(self) -> None:
        """Test update workload with weights."""
        mock_driver = MagicMock()
        mock_driver.get_default_weights.return_value = {"01": 2, "02": 1}
        worklaod = Workload(mock_driver)
        scale_factor = 1.0
        frequency = 200
        weights = {"01": 99, "02": 99}

        worklaod.update(scale_factor, frequency, weights)

        assert worklaod.weights == weights
        assert worklaod.frequency == frequency
        assert worklaod.scale_factor == scale_factor

    def test_update_workload_with_no_weights(self) -> None:
        """Test update workload with weights."""
        mock_driver = MagicMock()
        mock_driver.get_default_weights.return_value = {"01": 2, "02": 1}
        worklaod = Workload(mock_driver)
        scale_factor = 1.0
        frequency = 200
        weights = {}  # type: ignore

        worklaod.update(scale_factor, frequency, weights)

        assert worklaod.weights == {"01": 2, "02": 1}
        assert worklaod.frequency == frequency
        assert worklaod.scale_factor == scale_factor

    def test_reset_workload(self) -> None:
        """Test reset workload."""
        mock_driver = MagicMock()
        mock_driver.get_default_weights.return_value = {"01": 2, "02": 1}
        worklaod = Workload(mock_driver)
        worklaod.scale_factor = 1.0
        worklaod.frequency = 200
        worklaod.weights = {"01": 99, "02": 99}

        worklaod.resert()

        assert worklaod.weights == {"01": 2, "02": 1}
        assert worklaod.frequency == 0
        assert worklaod.scale_factor == 0

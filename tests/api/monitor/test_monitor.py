"""Tests for monitor namespace."""

from hyrisecockpit.api.app.monitor.app import get_interval_limits


class TestMonitor:
    """Tests for monitor namespace."""

    def test_gets_interval_limits(self) -> None:
        """Test handling of the interval boundaries."""
        precise_startts: int = 1587997267749563875
        precise_endts: int = 1587997268583067489
        precision_ns: int = 1000000000

        (startts, endts) = get_interval_limits(
            precise_startts, precise_endts, precision_ns
        )

        assert startts == 1587997267000000000
        assert endts == 1587997268000000000

"""Tests for monitor namespace."""

from typing import Dict, List

from hyrisecockpit.api.app.monitor.app import fill_missing_points, get_interval_limits


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

    def test_fills_missing_points(self) -> None:
        """Test filling of the missing points."""
        startts: int = 1587997260000000000
        endts: int = 1587997265000000000
        precision_ns: int = 1000000000

        table_name: str = "table_name"
        metrics: List[str] = ["metric1", "metric2"]
        points: List[Dict] = [
            {"time": 1587997260000000000, "metric1": 1.0, "metric2": 2.0},
            {"time": 1587997261000000000, "metric1": 3.0, "metric2": 4.0},
        ]
        present_timestamps: List[int] = [point["time"] for point in points]
        expected_points = [
            {
                "timestamp": point["time"],
                "metric1": point["metric1"],
                "metric2": point["metric2"],
            }
            for point in points
        ]

        filled_points: List[Dict] = fill_missing_points(
            startts, endts, precision_ns, table_name, metrics, points
        )

        for timestamp in range(startts, endts, precision_ns):
            if timestamp not in present_timestamps:
                assert {
                    "timestamp": timestamp,
                    "metric1": 0.0,
                    "metric2": 0.0,
                } in filled_points

        for point in expected_points:
            assert point in filled_points

"""Tests for monitor namespace."""

from typing import Dict, List
from unittest.mock import MagicMock, patch

from hyrisecockpit.api.app.historical_data_handling import (
    _fill_missing_points,
    _get_historical_data,
    get_historical_metric,
    get_interval_limits,
)


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

        filled_points: List[Dict] = _fill_missing_points(
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

    @patch("hyrisecockpit.api.app.historical_data_handling._get_active_databases")
    @patch("hyrisecockpit.api.app.historical_data_handling._get_historical_data")
    def test_gets_historical_metric(
        self, mock_get_historical_data: MagicMock, mock_get_active_databases: MagicMock
    ):
        """Test retrieving of the historical metric data for each database."""
        startts: int = 1587997260000000000
        endts: int = 1587997265000000000
        precision_ns: int = 1000000000
        table_name: str = "table_name"
        databases: List = ["database1", "database2"]
        metrics: List[str] = ["metric1", "metric2"]
        historical_data: List = [
            {"time": 1587997260000000000, "metric1": 1.0, "metric2": 2.0},
            {"time": 1587997261000000000, "metric1": 3.0, "metric2": 4.0},
        ]
        mock_get_active_databases.return_value = databases
        mock_get_historical_data.return_value = historical_data
        mock_storage_clinet: MagicMock = MagicMock()

        expected_points: List = [
            {"timestamp": 1587997260000000000, "metric1": 1.0, "metric2": 2.0},
            {"timestamp": 1587997261000000000, "metric1": 3.0, "metric2": 4.0},
            {"timestamp": 1587997262000000000, "metric1": 0.0, "metric2": 0.0},
            {"timestamp": 1587997263000000000, "metric1": 0.0, "metric2": 0.0},
            {"timestamp": 1587997264000000000, "metric1": 0.0, "metric2": 0.0},
        ]

        result: List = get_historical_metric(
            startts, endts, precision_ns, table_name, metrics, mock_storage_clinet
        )

        for database in databases:
            assert {"id": database, table_name: expected_points} in result

    def test_gets_historical_data(self):
        """Test retrieving of the historical data."""
        startts: int = 1587997260000000000
        endts: int = 1587997265000000000
        precision_ns: int = 1000000000
        table_name = "table_name"
        metrics: List[str] = ["metric1", "metric2"]
        database: str = "database"
        mock_storage_connection: MagicMock = MagicMock()
        mock_storage_connection.query.return_value = {
            (table_name, None): ["point1", "point2"]
        }

        select_clause = ",".join(f" mean({metric}) as {metric}" for metric in metrics)

        subquery = f"""SELECT {select_clause}
        FROM {table_name}
        WHERE time >=  $startts AND
        time < $endts
        GROUP BY TIME(1s)
        FILL(0.0)"""

        expected_query: str = f"""SELECT {select_clause}
        FROM ({subquery})
        WHERE time >= $startts AND time < $endts
        GROUP BY TIME({precision_ns}ns)
        FILL(0.0);"""

        result = _get_historical_data(
            startts,
            endts,
            precision_ns,
            table_name,
            metrics,
            database,
            mock_storage_connection,
        )

        assert result == ["point1", "point2"]
        mock_storage_connection.query.assert_any_call(
            expected_query,
            database=database,
            bind_params={"startts": startts, "endts": endts},
            epoch=True,
        )

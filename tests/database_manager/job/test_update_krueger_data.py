"""Tests for the update krueger data job."""

from json import dumps
from unittest.mock import patch

from pandas import DataFrame

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.update_krueger_data import update_krueger_data


class TestUpdateKruegerData:
    """Tests for the update krueger data job."""

    @patch("hyrisecockpit.database_manager.job.update_krueger_data.time_ns", lambda: 42)
    @patch("hyrisecockpit.database_manager.job.update_krueger_data.sql_to_data_frame")
    def test_logs_updated_krueger_data(self, mock_sql_to_data_frame: MagicMock) -> None:
        """Test logs updated krueger data."""
        data = {
            "sql_string": [
                "SELECT happiness;",
                "DROP problems;",
                "CREATE mood;",
                "COPY copyshop;",
                "SOME weird stuff;",
            ],
            "latency": [10, 20, 30, 40, 50],
            "frequency": [10, 20, 30, 40, 50],
        }

        mock_sql_to_data_frame.return_value = DataFrame(data)

        mock_cursor = MagicMock()
        mock_storage_connection_factory = MagicMock()
        mock_storage_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        mock_database_blocked = False
        mock_connection_factory = MagicMock()

        expected_sql = """WITH query_latency AS (SELECT SUM(walltime_ns) AS latency, statement_hash as query_hash
        FROM meta_cached_operators
        GROUP BY statement_hash)
        SELECT statement_hash, latency, frequency, sql_string FROM query_latency JOIN meta_cached_queries
        ON query_latency.query_hash = meta_cached_queries.statement_hash;"""

        expected_krueger_data = [
            {"query_type": "SELECT", "total_latency": 10, "total_frequency": 10},
            {"query_type": "CREATE", "total_latency": 30, "total_frequency": 30},
            {"query_type": "UPDATE", "total_latency": 0, "total_frequency": 0},
            {"query_type": "INSERT", "total_latency": 0, "total_frequency": 0},
            {"query_type": "DELETE", "total_latency": 0, "total_frequency": 0},
            {"query_type": "DROP", "total_latency": 20, "total_frequency": 20},
            {"query_type": "COPY", "total_latency": 40, "total_frequency": 40},
            {"query_type": "OTHER", "total_latency": 50, "total_frequency": 50},
        ]

        update_krueger_data(
            mock_database_blocked,
            mock_connection_factory,
            mock_storage_connection_factory,
        )

        mock_sql_to_data_frame.assert_called_once_with(
            mock_database_blocked, mock_connection_factory, expected_sql, None
        )
        mock_cursor.log_meta_information.assert_called_once_with(
            "krueger_data", {"krueger_data": dumps(expected_krueger_data)}, 42
        )

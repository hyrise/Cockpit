"""Tests for the load tables job."""
from multiprocessing import Value
from typing import List, Tuple
from unittest.mock import patch

from hyrisecockpit.cross_platform_support.testing_support import MagicMock
from hyrisecockpit.database_manager.job.load_tables import (
    _generate_table_loading_queries,
    load_tables,
)


class TestLoadTablesJob:
    """Tests for the load tables job."""

    def tests_successfully_generates_table_loading_queries(self) -> None:
        """Test successfully generates table loading queries."""
        fake_tables: List[str] = ["keep", "hyrise", "alive"]
        fake_benchmark = "benchmark"
        fake_scale_factor = "4_2"

        received_queries: List[Tuple] = _generate_table_loading_queries(
            fake_tables, fake_benchmark, fake_scale_factor
        )

        expected_queries = [
            (
                "COPY %s_%s_%s FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';",
                (
                    ("keep", "as_is"),
                    ("benchmark", "as_is"),
                    ("4_2", "as_is"),
                    ("benchmark", "as_is"),
                    ("4_2", "as_is"),
                    ("keep", "as_is"),
                ),
            ),
            (
                "COPY %s_%s_%s FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';",
                (
                    ("hyrise", "as_is"),
                    ("benchmark", "as_is"),
                    ("4_2", "as_is"),
                    ("benchmark", "as_is"),
                    ("4_2", "as_is"),
                    ("hyrise", "as_is"),
                ),
            ),
            (
                "COPY %s_%s_%s FROM '/usr/local/hyrise/cached_tables/%s_%s/%s.bin';",
                (
                    ("alive", "as_is"),
                    ("benchmark", "as_is"),
                    ("4_2", "as_is"),
                    ("benchmark", "as_is"),
                    ("4_2", "as_is"),
                    ("alive", "as_is"),
                ),
            ),
        ]

        assert received_queries == expected_queries

    @patch(
        "hyrisecockpit.database_manager.job.load_tables.get_loaded_tables_for_scale_factor"
    )
    @patch(
        "hyrisecockpit.database_manager.job.load_tables._generate_table_loading_queries"
    )
    @patch("hyrisecockpit.database_manager.job.load_tables.execute_queries_parallel")
    @patch(
        "hyrisecockpit.database_manager.job.load_tables._table_names",
        {"benchmark": ["kaleo", "Hanni_El_Khatib"]},
    )
    def test_load_tables(
        self,
        mock_execute_queries_parallel: MagicMock,
        mock_generate_table_loading_queries: MagicMock,
        mock_get_loaded_tables_for_scale_factor: MagicMock,
    ) -> None:
        """Test delete tables job."""
        fake_database_blocked = Value("b", 1)
        fake_folder_name = "benchmark_4_2"
        mock_cursor = MagicMock()
        mock_connection_factory = MagicMock()
        mock_connection_factory.create_cursor.return_value.__enter__.return_value = (
            mock_cursor
        )
        mock_get_loaded_tables_for_scale_factor.return_value = [
            "kaleo",
        ]
        mock_generate_table_loading_queries.return_value = [
            "Hanni_El_Khatib_benchmark_4_2",
        ]

        load_tables(fake_database_blocked, fake_folder_name, mock_connection_factory)

        mock_get_loaded_tables_for_scale_factor.assert_called_once_with(
            ["kaleo", "Hanni_El_Khatib"], "benchmark", "4_2", mock_connection_factory
        )
        mock_generate_table_loading_queries.assert_called_once_with(
            ["Hanni_El_Khatib"], "benchmark", "4_2"
        )
        mock_execute_queries_parallel.assert_called_once_with(
            ["Hanni_El_Khatib_benchmark_4_2"], mock_connection_factory,
        )

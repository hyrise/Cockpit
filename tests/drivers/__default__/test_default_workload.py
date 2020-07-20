"""Tests for default workload."""

from unittest.mock import patch

from hyrisecockpit.drivers.__default__.default_workload import DefaultWorkload


class TestDefaultWorkload:
    """Test for default workload class."""

    @patch("hyrisecockpit.drivers.__default__.default_workload.WorkloadReader")
    def test_inintializes_default_workload(self, mock_workload_reader) -> None:
        """Test initialization of workload attributes."""
        mock_queries = {"query_1": ["first query", "second query"]}
        mock_workload_reader.get.return_value = mock_queries
        benchmark = "benchmark"
        scalefactor = 1.0
        query_path = "query_path"

        default_workload = DefaultWorkload(benchmark, scalefactor, query_path)

        assert default_workload._benchmark == "benchmark"
        assert default_workload._scalefactor == 1.0
        assert default_workload._queries == mock_queries

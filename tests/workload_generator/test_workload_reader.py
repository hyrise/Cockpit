"""Tests for WorkloadReader."""
from typing import Any
from unittest.mock import MagicMock, patch

from pytest import raises

from hyrisecockpit.exception import (
    EmptyWorkloadFolderException,
    NotExistingWorkloadFolderException,
)
from hyrisecockpit.workload_generator.workload_reader import WorkloadReader


class TestWorkloadReader:
    """Tests for the WorkloadReader class."""

    def false_function(self, *argv) -> Any:
        """Return False."""
        return False

    @patch("hyrisecockpit.workload_generator.workload_reader.exists")
    def test_catches_not_existing_workload_folder_exception(self, mock_path_function):
        """Ensure not existing workload causes exception."""
        mock_path_function.return_value = False
        reader = WorkloadReader()
        with raises(NotExistingWorkloadFolderException) as e:
            reader._get_workload_folder("absolute_path", "tpch")
        assert str(e.value) == "Workload tpch not found: directory doesn't exist"

    @patch("hyrisecockpit.workload_generator.workload_reader.exists",)
    @patch("hyrisecockpit.workload_generator.workload_reader.listdir",)
    def test_catches_empty_workload_folder_exception(
        self, mock_list_function, mock_path_function
    ):
        """Ensure empty workload causes exception."""
        mock_path_function.return_value = True
        mock_list_function.return_value = []
        reader = WorkloadReader()
        with raises(EmptyWorkloadFolderException) as e:
            reader._get_workload_folder("absolute_path", "tpch")
        assert str(e.value) == "Workload tpch directory is empty"

    @patch("hyrisecockpit.workload_generator.workload_reader.exists",)
    @patch("hyrisecockpit.workload_generator.workload_reader.listdir",)
    def test_gets_workload_folder_from_existing_directory(
        self, mock_list_function, mock_path_function
    ):
        """Ensure reading of existing workload."""
        mock_path_function.return_value = True
        mock_list_function.return_value = ["file"]
        reader = WorkloadReader()
        assert reader._get_workload_folder("absolute_path", "tpch") == ["file"]

    @patch("hyrisecockpit.workload_generator.workload_reader.dirname",)
    def test_creates_absolute_workload_path(self, mock_dirname):
        """Create absolute workload path."""
        mock_dirname.return_value = "absolute_workload_reader_path"
        reader = WorkloadReader()
        assert (
            reader._create_absolute_workload_path("relative_workload_path")
            == "absolute_workload_reader_path/relative_workload_path"
        )

    @patch("hyrisecockpit.workload_generator.workload_reader.fsdecode",)
    @patch("hyrisecockpit.workload_generator.workload_reader.open",)
    def test_reads_content_of_workload_folder(self, mock_open, mock_fsdecode):
        """Read content of workload folder."""

        def fsdecode_side_effect(file_name):
            return file_name

        mock_fsdecode.side_effect = fsdecode_side_effect

        mocked_file = MagicMock()
        mocked_file.read.return_value = "Query1---Query2---"
        mock_open.return_value.__enter__.return_value = mocked_file

        workload_folder = ["file_1.sql", "file_2.sql"]
        absolute_workload_path = "absolute_workload_path"
        delimiter = "---"
        file_type = "sql"

        expected_queries = {
            "file_1": ["Query1", "Query2"],
            "file_2": ["Query1", "Query2"],
        }

        reader = WorkloadReader()
        queries = reader._read_content_of_workload_folder(
            workload_folder, absolute_workload_path, delimiter, file_type
        )
        assert queries == expected_queries

    @patch("hyrisecockpit.workload_generator.workload_reader.fsdecode",)
    @patch("hyrisecockpit.workload_generator.workload_reader.open",)
    def test_reads_workload(self, mock_open, mock_fsdecode):
        """Read workload."""

        def fsdecode_side_effect(file_name):
            return file_name

        mock_fsdecode.side_effect = fsdecode_side_effect

        mocked_file = MagicMock()
        mocked_file.read.return_value = "Query1---Query2---"
        mock_open.return_value.__enter__.return_value = mocked_file

        workload_folder = ["file_1.sql", "file_2.sql"]
        absolute_workload_path = "absolute_workload_path"
        delimiter = "---"
        file_type = "sql"

        expected_queries = {
            "file_1": ["Query1", "Query2"],
            "file_2": ["Query1", "Query2"],
        }

        reader = WorkloadReader()
        queries = reader._read_content_of_workload_folder(
            workload_folder, absolute_workload_path, delimiter, file_type
        )
        assert queries == expected_queries

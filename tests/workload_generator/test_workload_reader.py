"""Tests for WorkloadReader."""
from typing import Any
from unittest import mock

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

    @mock.patch("os.path.exists",)
    def test_catches_not_existing_workload_folder_exception(self, mock_path_function):
        """Ensure not existing workload causes exception."""
        mock_path_function.return_value = False
        reader = WorkloadReader()
        with raises(NotExistingWorkloadFolderException) as e:
            reader._get_workload_folder("absolute_path", "tpch")
        assert str(e.value) == """Workload tpch not found: directory doesn't exist"""

    @mock.patch("os.path.exists",)
    @mock.patch("os.listdir",)
    def test_catches_empty_workload_folder_exception(
        self, mock_list_function, mock_path_function
    ):
        """Ensure empty workload causes exception."""
        mock_path_function.return_value = True
        mock_list_function.return_value = []
        reader = WorkloadReader()
        with raises(EmptyWorkloadFolderException) as e:
            reader._get_workload_folder("absolute_path", "tpch")
        assert str(e.value) == """Workload tpch directory is empty"""

    @mock.patch("os.path.exists",)
    @mock.patch("os.listdir",)
    def test_gets_workload_folder_from_existing_directory(
        self, mock_list_function, mock_path_function
    ):
        """Ensure reading of existing workload."""
        mock_path_function.return_value = True
        mock_list_function.return_value = ["file"]
        reader = WorkloadReader()
        assert reader._get_workload_folder("absolute_path", "tpch") == ["file"]

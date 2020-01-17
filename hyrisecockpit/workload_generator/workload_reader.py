"""Module for reading queries."""
import os
from typing import Any, Dict, List

from hyrisecockpit.exception import (
    EmptyWorkloadFolderException,
    NotExistingWorkloadFolderException,
)


class WorkloadReader(object):
    """Generic workload reader."""

    def _append_delimiter(self, queries: List, delimiter: str) -> None:
        """Append delimiter to every element in querie."""
        for i in range(len(queries)):
            queries[i] = queries[i] + delimiter

    def _create_absolute_workload_path(self, relative_workload_path: str) -> str:
        """Create absolute path to the folder."""
        absolute_workload_reader_path: str = os.path.dirname(__file__)
        absolute_workload_path: str = (
            f"{absolute_workload_reader_path}/{relative_workload_path}"
        )
        return absolute_workload_path

    def _get_workload_folder(
        self, absolute_workload_path: str, workload_type: str
    ) -> Any:
        """Check if folder exists or is emty and returns it."""
        if not os.path.exists(absolute_workload_path):
            raise NotExistingWorkloadFolderException(
                f"Workload {workload_type} not found: directory doesn't exist"
            )
        directory = os.fsencode(absolute_workload_path)
        if len(os.listdir(directory)) == 0:
            raise EmptyWorkloadFolderException(
                f"Workload {workload_type} directory is empty"
            )
        return os.listdir(directory)

    def _read_content_of_workload_folder(
        self,
        workload_folder: Any,
        absolute_workload_path: str,
        delimiter: str,
        file_type: str,
    ) -> Dict[str, List[str]]:
        """Read every file in folder and returns content."""
        queries: Dict[str, List[str]] = {}
        for file in workload_folder:
            filename: str = os.fsdecode(file)
            if filename.endswith(f".{file_type}"):
                with open(f"{absolute_workload_path}/{filename}", "r") as f:
                    sub_queries: List = f.read().split(delimiter)
                    del sub_queries[-1]
                    self._append_delimiter(sub_queries, delimiter)
                    queries[os.path.splitext(filename)[0]] = sub_queries
        return queries

    def read_workload(
        self,
        relative_workload_path: str,
        delimiter: str,
        file_type: str,
        workload_type: str,
    ) -> Dict[str, List[str]]:
        """Read sql queries from files in folder."""
        absolute_workload_path: str = self._create_absolute_workload_path(
            relative_workload_path
        )
        workload_folder = self._get_workload_folder(
            absolute_workload_path, workload_type
        )
        workload: Dict[str, List[str]] = self._read_content_of_workload_folder(
            workload_folder, absolute_workload_path, delimiter, file_type
        )

        return workload

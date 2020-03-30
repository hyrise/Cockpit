"""Module for reading queries."""
from os import fsdecode, fsencode, listdir
from os.path import dirname, exists, splitext
from typing import Any, Dict, List

from hyrisecockpit.exception import (
    EmptyWorkloadFolderException,
    NotExistingWorkloadFolderException,
)


class WorkloadReader(object):
    """Generic workload reader."""

    def _create_absolute_workload_path(self, relative_workload_path: str) -> str:
        """Create absolute path to the folder."""
        absolute_workload_reader_path: str = dirname(__file__)
        return f"{absolute_workload_reader_path}/{relative_workload_path}"

    def _get_workload_folder(
        self, absolute_workload_path: str, workload_type: str
    ) -> Any:
        """Check if folder exists or is emty and returns it."""
        if not exists(absolute_workload_path):
            raise NotExistingWorkloadFolderException(
                f"Workload {workload_type} not found: directory doesn't exist"
            )
        directory = fsencode(absolute_workload_path)
        if len(listdir(directory)) == 0:
            raise EmptyWorkloadFolderException(
                f"Workload {workload_type} directory is empty"
            )
        return listdir(directory)

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
            filename: str = fsdecode(file)
            if filename.endswith(f".{file_type}"):
                with open(f"{absolute_workload_path}/{filename}", "r") as f:
                    raw_queries: str = f.read()
                transactions = [
                    transaction
                    for transaction in raw_queries.split(delimiter)
                    if transaction != ""
                ]
                queries[splitext(filename)[0]] = transactions
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

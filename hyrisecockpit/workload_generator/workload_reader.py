"""Module for reading queries."""
from json import load
from os import fsdecode, fsencode, listdir
from os.path import exists, splitext
from typing import Any, Dict, List

from hyrisecockpit.exception import (
    EmptyWorkloadFolderException,
    NotExistingConfigFileException,
    NotExistingWorkloadFolderException,
)


class WorkloadReader(object):
    """Generic workload reader."""

    def _append_delimiter(self, queries: List, delimiter: str) -> None:
        """Append delimiter to every element in querie."""
        for i in range(len(queries)):
            queries[i] = queries[i] + delimiter

    def _get_workload_folder(self, queries_location: str, workload_type: str) -> Any:
        """Check if folder exists or is emty and returns it."""
        if not exists(queries_location):
            raise NotExistingWorkloadFolderException(
                f"Workload {workload_type} not found: directory doesn't exist"
            )
        directory = fsencode(queries_location)
        if len(listdir(directory)) == 0:
            raise EmptyWorkloadFolderException(
                f"Workload {workload_type} directory is empty"
            )
        return listdir(directory)

    def _read_content_of_workload_folder(
        self,
        workload_folder: Any,
        queries_location: str,
        delimiter: str,
        file_type: str,
    ) -> Dict[str, List[str]]:
        """Read every file in folder and returns content."""
        queries: Dict[str, List[str]] = {}
        for file in workload_folder:
            filename: str = fsdecode(file)
            if filename.endswith(f".{file_type}"):
                with open(f"{queries_location}/{filename}", "r") as f:
                    sub_queries: List = f.read().split(delimiter)
                    del sub_queries[-1]
                    self._append_delimiter(sub_queries, delimiter)
                    queries[splitext(filename)[0]] = sub_queries
        return queries

    def read_workload(
        self, queries_location: str, delimiter: str, file_type: str, workload_type: str,
    ) -> Dict[str, List[str]]:
        """Read sql queries from files in folder."""
        workload_folder = self._get_workload_folder(queries_location, workload_type)
        workload: Dict[str, List[str]] = self._read_content_of_workload_folder(
            workload_folder, queries_location, delimiter, file_type
        )

        return workload

    def read_config_data(self, queries_location: str) -> Dict[str, Any]:
        """Read config file in the folder."""
        absolute_config_file_path: str = (f"{queries_location}/config.json")

        if not exists(queries_location):
            raise NotExistingWorkloadFolderException(
                f"Workload {queries_location} not found: directory doesn't exist"
            )

        if not exists(absolute_config_file_path):
            raise NotExistingConfigFileException(
                f"Config file in the directory {queries_location} not found"
            )

        config_data: Dict[str, Any] = {}
        with open(absolute_config_file_path) as config_file:
            config_data = load(config_file)
        return config_data

"""Module for reading queries."""
import os
from typing import Dict, List


class WorkloadReader(object):
    """Generic workload reader."""

    def _append_delimiter(self, queries, delimiter):
        for i in range(len(queries)):
            queries[i] = queries[i] + delimiter

    def _create_absolute_workload_path(self, relative_workload_path):
        absolute_workload_reader_path = os.path.dirname(__file__)
        absolute_workload_path = (
            f"{absolute_workload_reader_path}/{relative_workload_path}"
        )
        return absolute_workload_path

    def _get_workload_files(self, absolute_workload_path, workload_type):
        if not os.path.exists(absolute_workload_path):
            raise Exception(
                f"Workload {workload_type} not found: directory doesn't exist"
            )
        directory = os.fsencode(absolute_workload_path)
        if len(os.listdir(directory)) == 0:
            raise Exception(f"Workload {workload_type} directory is empty")
        return os.listdir(directory)

    def _read_workload_files(
        self, workload_files, absolute_workload_path, file_type, delimiter
    ):
        queries: Dict[str, List[str]] = {}
        for file in workload_files:
            filename = os.fsdecode(file)
            if filename.endswith(f".{file_type}"):
                with open(f"{absolute_workload_path}/{filename}", "r") as f:
                    sub_queries = f.read().split(delimiter)
                    del sub_queries[-1]
                    self._append_delimiter(sub_queries, delimiter)
                    queries[os.path.splitext(filename)[0]] = sub_queries
        return queries

    def read_from_folder(
        self, relative_workload_path, delimiter, file_type, workload_type
    ) -> Dict[str, List[str]]:
        """Read sql queries from files in folder."""
        absolute_workload_path = self._create_absolute_workload_path(
            relative_workload_path
        )
        workload_files = self._get_workload_files(absolute_workload_path, workload_type)
        workload = self._read_workload_files(
            workload_files, absolute_workload_path, file_type, delimiter
        )

        return workload

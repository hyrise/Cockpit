"""Module for reading queries."""
import os
from typing import Dict, List


class WorkloadReader(object):
    """Generic workload reader."""

    def append_delimiter(self, queries, delimiter):
        """Append delimiter back on query."""
        for i in range(len(queries)):
            queries[i] = queries[i] + delimiter

    def read_from_folder(self, location, delimiter, type) -> Dict[str, List[str]]:
        """Read sql queries from files in folder."""
        queries: Dict[str, List[str]] = {}
        directory = os.fsencode(location)
        for file in os.listdir(directory):
            filename = os.fsdecode(file)
            if filename.endswith(f".{type}"):
                with open(f"{location}/{filename}", "r") as f:
                    sub_queries = f.read().split(delimiter)
                    del sub_queries[-1]
                    self.append_delimiter(sub_queries, delimiter)
                    queries[os.path.splitext(filename)[0]] = sub_queries

        return queries

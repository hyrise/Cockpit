"""Module for reading workload queries."""
from os import listdir
from typing import Dict, List, Optional


class WorkloadReader:
    """Reads queries from workloads."""

    @classmethod
    def _read_query(cls, path_to_file: str) -> List[str]:
        with open(path_to_file, "r") as f:
            raw_queries: str = f.read()
        return [
            " ".join(transaction.split())
            for transaction in raw_queries.split("---")
            if transaction != ""
        ]

    @classmethod
    def get(cls, query_path: str) -> Optional[Dict[str, List[str]]]:
        """Get a workload from the workload folder. Returns the query names and a list of all queries."""
        queries = {}
        for file_name in listdir(query_path):
            query_type = file_name.split(".sql")[0]
            query_file_path = f"{query_path}/{file_name}"
            queries[query_type] = cls._read_query(query_file_path)

        return queries

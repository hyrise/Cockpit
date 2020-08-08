"""Module for workload reader."""

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
        return {
            file_name.split(".sql")[0]: cls._read_query(f"{query_path}/{file_name}")
            for file_name in listdir(query_path)
        }

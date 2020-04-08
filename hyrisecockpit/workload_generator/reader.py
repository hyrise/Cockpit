"""Module for reading workload queries."""
from os import listdir
from os.path import dirname, isdir, isfile, join, splitext
from typing import Dict, List, Optional


class WorkloadReader:
    """Reads queries from workloads."""

    location: str = join(dirname(__file__), "workloads")

    @classmethod
    def __read_query(cls, path_to_file: str) -> List[str]:
        with open(path_to_file, "r") as f:
            raw_queries: str = f.read()
        return [
            " ".join(transaction.split())
            for transaction in raw_queries.split("---")
            if transaction != ""
        ]

    @classmethod
    def available(cls) -> Dict[str, List[str]]:
        """Get all available workloads with their queries.

        Returns a dict mapping workload folder names to a list of all query file names.
        """
        return {
            workload: [
                queries
                for queries in listdir(join(cls.location, workload))
                if isfile(join(cls.location, workload, queries))
                and splitext(queries)[-1] == ".sql"
            ]
            for workload in listdir(cls.location)
            if isdir(join(cls.location, workload))
        }

    @classmethod
    def get(cls, workload: str) -> Optional[Dict[str, List[str]]]:
        """Get a workload from the workload folder.

        Returns the query names and a list of all queries.
        Returns `None` if the workload could not be found.
        """
        try:
            return {
                splitext(queries)[0]: cls.__read_query(
                    join(cls.location, workload, queries)
                )
                for queries in cls.available()[workload]
            }
        except KeyError:
            return None

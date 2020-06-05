"""Handler for tasks of the query type."""
from time import time_ns
from typing import Optional, Tuple, Union

from psycopg2.extensions import AsIs


class DefaultHandler:
    """Handler for processing of the query tasks."""

    def __init__(self, cursor, worker_id: str):
        """Initialize QueryHandler."""
        self._cursor = cursor
        self._worker_id = worker_id

    def execute_task(self, task) -> Tuple[int, int, str, str]:
        """Execute task of the query type."""
        query = task["query"]
        query = query.replace("[STREAM_ID]", str(self._worker_id))

        not_formatted_parameters = task["args"]
        formatted_parameters = self.get_formatted_parameters(not_formatted_parameters)

        endts, latency = self.execute_query(query, formatted_parameters)
        return endts, latency, task["benchmark"], task["query_type"]

    def execute_query(
        self, query: str, formatted_parameters: Optional[Tuple[str, ...]]
    ) -> Tuple[int, int]:
        """Execute given query."""
        startts = time_ns()
        self._cursor.execute(query, formatted_parameters)
        endts = time_ns()

        return endts, endts - startts

    def get_formatted_parameters(
        self,
        not_formatted_parameters: Tuple[Tuple[Union[str, int], Optional[str]], ...],
    ) -> Optional[Tuple[Union[AsIs, str], ...]]:
        """Create formatted parameters."""
        if not_formatted_parameters:
            return tuple(
                AsIs(parameter) if protocol == "as_is" else parameter
                for parameter, protocol in not_formatted_parameters
            )
        return None

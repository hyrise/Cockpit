"""Services for status information."""
from typing import List

from hyrisecockpit.api.app.connection_manager import StorageConnection
from hyrisecockpit.api.app.shared import _get_active_databases

from .model import FailedQuery, FailedTask


class MetaInformationService:
    """Services of the Meta information Controller."""

    @classmethod
    def get_failed_tasks(cls) -> List[FailedTask]:
        """Get failed task from databases."""
        results = []
        with StorageConnection() as client:
            for database in _get_active_databases():
                failed_queries = list(
                    client.query(
                        "SELECT * FROM failed_queries LIMIT 100;", database=database,
                    )["failed_queries", None]
                )
                serilized_failed_queries = [
                    FailedQuery(**query) for query in failed_queries
                ]
                results.append(
                    FailedTask(id=database, failed_queries=serilized_failed_queries)
                )
        return results

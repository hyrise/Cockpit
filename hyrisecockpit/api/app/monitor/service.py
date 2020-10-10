from hyrisecockpit.api.app.shared import _get_active_databases
from hyrisecockpit.api.app.connection_manager import StorageConnection
from .model import FailedTasks, FailedTaskEntry
from typing import List


class MonitorService:
    @classmethod
    def get_failed_tasks(cls) -> List[FailedTasks]:
        failed_tasks = []
        with StorageConnection() as client:
            for database in _get_active_databases():
                failed_task_entries = [
                    FailedTaskEntry(
                        timestamp=task["time"],
                        worker_id=task["worker_id"],
                        task=task["task"],
                        error=task["error"],
                    )
                    for task in list(
                        client.query(
                            "SELECT * FROM failed_queries LIMIT 100;",
                            database=database,
                        )["failed_queries", None]
                    )
                ]
            failed_tasks.append(
                FailedTasks(
                    database_id=database, failed_task_entries=failed_task_entries
                )
            )
        return failed_tasks

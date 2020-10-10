from typing import List, Dict, Union
from hyrisecockpit.api.app.connection_manager import StorageConnection
from hyrisecockpit.api.app.historical_data_handling import (
    get_historical_metric,
    get_interval_limits,
)
from hyrisecockpit.api.app.shared import _get_active_databases
from .model import FailedTasks, FailedTaskEntry, TimeInterval


class MonitorService:
    @staticmethod
    def get_data(
        time_interval: TimeInterval, table_name: str, column_names: List[str]
    ) -> List[Dict[str, Union[str, List]]]:
        """Return metric information in a given time range."""
        precise_startts: int = time_interval.startts
        precise_endts: int = time_interval.endts
        precision_ns: int = time_interval.precision

        (startts, endts) = get_interval_limits(
            precise_startts, precise_endts, precision_ns
        )

        with StorageConnection() as client:
            return get_historical_metric(
                startts, endts, precision_ns, table_name, column_names, client
            )

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

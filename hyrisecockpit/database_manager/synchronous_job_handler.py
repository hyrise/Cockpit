"""This module handles the synchronous jobs."""
from typing import Dict, List, Optional, TypedDict

from hyrisecockpit.database_manager.job.execute_sql_query import (
    execute_sql_query as execute_sql_query_job,
)
from hyrisecockpit.database_manager.job.get_detailed_plugins import (
    get_detailed_plugins as get_detailed_plugins_job,
)
from hyrisecockpit.database_manager.job.get_loaded_tables_in_database import (
    get_loaded_tables_in_database as get_loaded_tables_in_database_job,
)
from hyrisecockpit.database_manager.job.get_workload_tables_status import (
    get_workload_tables_status as get_workload_tables_status_job,
)
from hyrisecockpit.database_manager.job.set_plugin_setting import (
    set_plugin_setting as set_plugin_setting_job,
)

PluginSetting = TypedDict(
    "PluginSetting",
    {"name": str, "value": str, "description": str, "display_name": str},
)
Plugins = Optional[Dict[str, List[PluginSetting]]]


class SqlResultInterface(TypedDict):
    """Interface of a SQL result."""

    id: str
    successful: bool
    results: List[List[str]]
    col_names: List[str]
    error_message: str


class SynchronousJobHandler:
    """This class handles the synchronous jobs."""

    def __init__(
        self, connection_factory, database_blocked, database_id, workload_drivers
    ):
        """Initialize synchronous job handler."""
        self._connection_factory = connection_factory
        self._database_blocked = database_blocked
        self._database_id = database_id
        self._workload_drivers = workload_drivers

    def get_loaded_tables_in_database(self) -> List[Dict[str, str]]:
        """Execute get loaded tables in database job."""
        return get_loaded_tables_in_database_job(self._connection_factory)

    def get_workload_tables_status(self) -> List:
        """Execute get workload tables status job."""
        return get_workload_tables_status_job(
            self._connection_factory, self._workload_drivers
        )

    def get_detailed_plugins(self) -> Plugins:
        """Execute get detailed plug-ins job."""
        return get_detailed_plugins_job(self._connection_factory)

    def set_plugin_setting(
        self, plugin_name: str, setting_name: str, setting_value: str
    ) -> bool:
        """Execute set plug-in settings  job."""
        return set_plugin_setting_job(
            plugin_name,
            setting_name,
            setting_value,
            self._connection_factory,
            self._database_blocked,
        )

    def execute_sql_query(self, query) -> Optional[SqlResultInterface]:
        """Execute execute SQL query job."""
        return execute_sql_query_job(
            query, self._connection_factory, self._database_blocked, self._database_id
        )

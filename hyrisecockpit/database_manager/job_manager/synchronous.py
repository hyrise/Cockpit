"""Synchronous job manager."""

from multiprocessing import Value
from typing import Dict, List, Optional, Tuple, TypedDict

from psycopg2 import DatabaseError, InterfaceError

from hyrisecockpit.database_manager.cursor import ConnectionFactory
from hyrisecockpit.database_manager.interfaces import SqlResultInterface
from hyrisecockpit.database_manager.table_names import table_names as _table_names

from .job.plugin import get_detailed_plugins as get_detailed_plugins_job
from .job.plugin import get_plugin_setting as get_plugin_setting_job
from .job.plugin import get_plugins as get_plugins_job
from .job.plugin import set_plugin_setting as set_plugin_setting_job
from .job.sql_interface import execute_sql_query as execute_sql_query_job

PluginSetting = TypedDict(
    "PluginSetting", {"name": str, "value": str, "description": str}
)
Plugins = Optional[Dict[str, List[PluginSetting]]]


class SynchronousJobManager(object):
    """Manage synchronous jobs."""

    def __init__(
        self,
        database_id: str,
        database_blocked: Value,
        connection_factory: ConnectionFactory,
    ):
        """Initialize SynchronousJobManager object."""
        self._database_id = database_id
        self._database_blocked: Value = database_blocked
        self._connection_factory: ConnectionFactory = connection_factory

    def get_plugins(self) -> Optional[List[str]]:
        """Return all currently activated plugins."""
        return get_plugins_job(self._connection_factory)

    def get_plugin_setting(self) -> Plugins:
        """Return currently set plugin settings."""
        return get_plugin_setting_job(self._connection_factory)

    def get_detailed_plugins(self) -> Plugins:
        """Get all activated plugins with their settings."""
        return get_detailed_plugins_job(self._connection_factory)

    def set_plugin_setting(
        self, plugin_name: str, setting_name: str, setting_value: str
    ) -> bool:
        """Adjust setting for given plugin."""
        return set_plugin_setting_job(
            self._connection_factory,
            self._database_blocked,
            plugin_name,
            setting_name,
            setting_value,
        )

    def execute_sql_query(self, query) -> Optional[SqlResultInterface]:
        """Execute sql query on database."""
        return execute_sql_query_job(
            self._connection_factory, self._database_blocked, self._database_id, query
        )

    # TODO: Move to jobs
    def get_loaded_tables(self) -> List[Dict[str, str]]:
        """Return already loaded tables."""
        try:
            with self._connection_factory.create_cursor() as cur:
                cur.execute("select * from meta_tables;", None)
                rows = cur.fetchall()
        except (DatabaseError, InterfaceError):
            return []
        else:
            return [row[0] for row in rows] if rows else []

    def get_loaded_benchmarks(self, loaded_tables) -> List[str]:
        """Get list of all benchmarks which are completely loaded."""
        loaded_benchmarks: List = []
        benchmark_names = _table_names.keys()
        scale_factors = ["0_1", "1"]

        for benchmark_name in benchmark_names:
            for scale_factor in scale_factors:
                required_tables = _table_names[benchmark_name]
                loaded = True
                for table_name in required_tables:
                    loaded = loaded and (
                        f"{table_name}_{benchmark_name}_{scale_factor}" in loaded_tables
                    )

                if loaded:
                    loaded_benchmarks.append(f"{benchmark_name}_{scale_factor}")

        return loaded_benchmarks

    def get_loaded_benchmark_data(self) -> Tuple:
        """Get loaded benchmark data."""
        loaded_tables: List = self.get_loaded_tables()
        loaded_benchmarks: List = self.get_loaded_benchmarks(loaded_tables)
        return (
            loaded_tables,
            loaded_benchmarks,
        )

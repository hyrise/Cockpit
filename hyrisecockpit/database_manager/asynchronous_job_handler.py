"""Asynchronous job handler."""

from multiprocessing import Value
from threading import Thread
from typing import Dict

from hyrisecockpit.database_manager.cursor import ConnectionFactory

from .job.activate_plugin import activate_plugin as activate_plugin_job
from .job.deactivate_plugin import deactivate_plugin as deactivate_plugin_job
from .job.delete_tables import delete_tables as delete_tables_job
from .job.load_tables import load_tables as load_tables_job
from .job.get_detailed_plugins import get_plugins as get_plugins_job


class AsynchronousJobHandler:
    """Handles asynchronous jobs.

    All jobs in this class are executed with python threads in the background.
    If a method from this class is called it will only response if the job
    was started successfully or not. All jobs in this class do not need to return a
    result.
    """

    def __init__(
        self,
        database_blocked: Value,
        connection_factory: ConnectionFactory,
        workload_drivers: Dict,
    ):
        """Initialize asynchronous job handler object.

        Args:
            database_blocked: Flag stored in a shared memory map. This flag
                stores if the Hyrise instance is blocked or not.
            connection_factory: An object to create a connection to the Hyrise
                database. All connection relevant information (port, host) is
                saved in this object.
            workload_drivers: A dictionary containing all workload drivers (TPCC,...)
        """
        self._database_blocked: Value = database_blocked
        self._connection_factory: ConnectionFactory = connection_factory
        self._workload_drivers: Dict = workload_drivers

    def load_tables(self, workload_type: str, scalefactor: float) -> bool:
        """Start load tabled job.

        This function will check if the database is blocked, if not it will
        create a thread that is executing the job that will load the tables.

        Returns:
            bool: True if job was successful started, False if database was
                blocked and job couldn't be started.
        """
        if not self._database_blocked.value:
            self._database_blocked.value = True
            job_thread = Thread(
                target=load_tables_job,
                args=(
                    self._database_blocked,
                    workload_type,
                    scalefactor,
                    self._connection_factory,
                    self._workload_drivers,
                ),
            )
            job_thread.start()
            return True
        else:
            return False

    def delete_tables(self, workload_type: str, scalefactor: float) -> bool:
        """Start delete tabled job.

        This function will check if the database is blocked. If not it will
        create a thread that is executing the job that will delete the tables.

        Returns:
            bool: True if job was successful started, False if database was
                blocked and job couldn't be started.
        """
        if not self._database_blocked.value:
            self._database_blocked.value = True
            job_thread = Thread(
                target=delete_tables_job,
                args=(
                    self._database_blocked,
                    workload_type,
                    scalefactor,
                    self._connection_factory,
                    self._workload_drivers,
                ),
            )
            job_thread.start()
            return True
        else:
            return False

    def activate_plugin(self, plugin: str) -> bool:
        """Start activate plug-in job.

        This function will check if the database is blocked. If not it will
        create a thread that is executing the job that will activate the plug-in.

        Returns:
            bool: True if job was successful started, False if database was
                blocked or plug-in is already active and job couldn't be started.
        """
        active_plugins = get_plugins_job(self._connection_factory)
        if active_plugins is None or plugin in active_plugins:
            return False
        if not self._database_blocked.value:
            job_thread = Thread(
                target=activate_plugin_job,
                args=(
                    self._connection_factory,
                    plugin,
                ),
            )
            job_thread.start()
            return True
        else:
            return False

    def deactivate_plugin(self, plugin: str) -> bool:
        """Start deactivate plug-in job.

        This function will check if the database is blocked. If not it will
        create a thread that is executing the job that will deactivate the plug-in.

        Returns:
            bool: True if job was successful started, False if database was
                blocked or plug-in is not active and job couldn't be started.
        """
        active_plugins = get_plugins_job(self._connection_factory)
        if active_plugins is None or plugin not in active_plugins:
            return False
        if not self._database_blocked.value:
            job_thread = Thread(
                target=deactivate_plugin_job,
                args=(
                    self._connection_factory,
                    plugin,
                ),
            )
            job_thread.start()
            return True
        else:
            return False

"""Asynchronous job handler."""

from multiprocessing import Value
from threading import Thread
from typing import Dict

from hyrisecockpit.database_manager.cursor import ConnectionFactory

from .job.activate_plugin import activate_plugin as activate_plugin_job
from .job.deactivate_plugin import deactivate_plugin as deactivate_plugin_job
from .job.delete_tables import delete_tables as delete_tables_job
from .job.load_tables import load_tables as load_tables_job


class AsynchronousJobHandler:
    """Handles asynchronous jobs."""

    def __init__(
        self,
        database_blocked: Value,
        connection_factory: ConnectionFactory,
        workload_drivers: Dict,
    ):
        """Initialize asynchronous job manager object."""
        self._database_blocked: Value = database_blocked
        self._connection_factory: ConnectionFactory = connection_factory
        self._workload_drivers: Dict = workload_drivers

    def load_tables(self, workload_type: str, scalefactor: float) -> bool:
        """Load tables."""
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
        """Delete tables."""
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
        """Activate plugin."""
        if not self._database_blocked.value:
            job_thread = Thread(
                target=activate_plugin_job, args=(self._connection_factory, plugin,)
            )
            job_thread.start()
            return True
        else:
            return False

    def deactivate_plugin(self, plugin: str) -> bool:
        """Dectivate plugin."""
        if not self._database_blocked.value:
            job_thread = Thread(
                target=deactivate_plugin_job, args=(self._connection_factory, plugin,)
            )
            job_thread.start()
            return True
        else:
            return False

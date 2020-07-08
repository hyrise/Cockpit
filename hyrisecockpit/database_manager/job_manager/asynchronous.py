"""Asynchronous job manager."""

from multiprocessing import Value
from threading import Thread

from hyrisecockpit.database_manager.worker_pool import WorkerPool

from .background import BackgroundJobManager
from .cursor import ConnectionFactory, StorageConnectionFactory
from .job.delete_tables import delete_tables as delete_tables_job
from .job.load_tables import load_tables as load_tables_job
from .job.plugin import activate_plugin as activate_plugin_job
from .job.plugin import deactivate_plugin as deactivate_plugin_job


class AsynchronousJobManager(object):
    """Manage asynchronous jobs."""

    def __init__(
        self,
        background_job_manager: BackgroundJobManager,
        database_blocked: Value,
        connection_factory: ConnectionFactory,
        hyrise_active: Value,
        worker_pool: WorkerPool,
        storage_connection_factory: StorageConnectionFactory,
    ):
        """Initialize AsynchronousJobManager object."""
        self._background_job_manager: BackgroundJobManager = background_job_manager
        self._database_blocked: Value = database_blocked
        self._connection_factory: ConnectionFactory = connection_factory

    def load_tables(self, folder_name: str) -> bool:
        """Load tables."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            job_thread = Thread(
                target=load_tables_job,
                args=(
                    self._database_blocked,
                    folder_name,
                    self._connection_factory,
                    self._background_job_manager,
                ),
            )
            job_thread.start()
            return True
        else:
            return False

    def delete_tables(self, folder_name: str) -> bool:
        """Delete tables."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            job_thread = Thread(
                target=delete_tables_job,
                args=(
                    self._database_blocked,
                    folder_name,
                    self._connection_factory,
                    self._background_job_manager,
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

"""The BackgroundJobManager is managing the background jobs for the apscheduler."""

from multiprocessing import Value

from apscheduler.schedulers.background import BackgroundScheduler

from .continuous_job_handler import ContinuousJobHandler
from .cursor import ConnectionFactory, StorageConnectionFactory
from .job.activate_plugin import activate_plugin as activate_plugin_job
from .job.deactivate_plugin import deactivate_plugin as deactivate_plugin_job
from .job.delete_tables import delete_tables as delete_tables_job
from .job.load_tables import load_tables as load_tables_job
from .worker_pool import WorkerPool


class BackgroundJobManager(object):
    """Manage background scheduling jobs."""

    def __init__(
        self,
        database_id: str,
        database_blocked: Value,
        connection_factory: ConnectionFactory,
        hyrise_active: Value,
        worker_pool: WorkerPool,
        storage_connection_factory: StorageConnectionFactory,
        workload_drivers,
    ):
        """Initialize BackgroundJobManager object."""
        self._database_id: str = database_id
        self._database_blocked: Value = database_blocked
        self._connection_factory: ConnectionFactory = connection_factory
        self._storage_connection_factory: StorageConnectionFactory = storage_connection_factory
        self._worker_pool: WorkerPool = worker_pool
        self._workload_drivers = workload_drivers
        self._scheduler: BackgroundScheduler = BackgroundScheduler()
        self._hyrise_active: Value = hyrise_active
        self._continuous_job_handler = ContinuousJobHandler(
            self._connection_factory,
            self._hyrise_active,
            self._worker_pool,
            self._storage_connection_factory,
            self._database_blocked,
        )
        self._continuous_job_handler.start()

    def start(self) -> None:
        """Start background scheduler."""
        # Todo replace   self._scheduler with python threads
        self._scheduler.start()
        self._continuous_job_handler.start()

    def close(self) -> None:
        """Close background scheduler."""
        self._scheduler.shutdown()
        self._continuous_job_handler.close()

    def load_tables(self, workload_type: str, scalefactor: float) -> bool:
        """Load tables."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._scheduler.add_job(
                func=load_tables_job,
                args=(
                    self._database_blocked,
                    workload_type,
                    scalefactor,
                    self._connection_factory,
                    self._workload_drivers,
                ),
            )
            return True
        else:
            return False

    def delete_tables(self, workload_type: str, scalefactor: float) -> bool:
        """Delete tables."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._scheduler.add_job(
                func=delete_tables_job,
                args=(
                    self._database_blocked,
                    workload_type,
                    scalefactor,
                    self._connection_factory,
                    self._workload_drivers,
                ),
            )
            return True
        else:
            return False

    def activate_plugin(self, plugin: str) -> bool:
        """Activate plugin."""
        if not self._database_blocked.value:
            self._scheduler.add_job(
                func=activate_plugin_job, args=(self._connection_factory, plugin,)
            )
            return True
        else:
            return False

    def deactivate_plugin(self, plugin: str) -> bool:
        """Dectivate plugin."""
        if not self._database_blocked.value:
            self._scheduler.add_job(
                func=deactivate_plugin_job, args=(self._connection_factory, plugin,)
            )
            return True
        else:
            return False

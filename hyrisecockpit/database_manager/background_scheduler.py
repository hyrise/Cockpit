"""The BackgroundJobManager is managing the background jobs for the apscheduler."""

from multiprocessing import Value

from .asynchronous_job_handler import AsynchronousJobHandler
from .continuous_job_handler import ContinuousJobHandler
from .cursor import ConnectionFactory, StorageConnectionFactory
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
        self._hyrise_active: Value = hyrise_active
        self._continuous_job_handler = ContinuousJobHandler(
            self._connection_factory,
            self._hyrise_active,
            self._worker_pool,
            self._storage_connection_factory,
            self._database_blocked,
        )
        self._asynchronous_job_handler = AsynchronousJobHandler(
            self._database_blocked, self._connection_factory, self._workload_drivers,
        )
        self._continuous_job_handler.start()

    def start(self) -> None:
        """Start background scheduler."""
        self._continuous_job_handler.start()

    def close(self) -> None:
        """Close background scheduler."""
        self._continuous_job_handler.close()

    def load_tables(self, workload_type: str, scalefactor: float) -> bool:
        """Load tables."""
        return self._asynchronous_job_handler.load_tables(workload_type, scalefactor)

    def delete_tables(self, workload_type: str, scalefactor: float) -> bool:
        """Delete tables."""
        return self._asynchronous_job_handler.delete_tables(workload_type, scalefactor)

    def activate_plugin(self, plugin: str) -> bool:
        """Activate plugin."""
        return self._asynchronous_job_handler.activate_plugin(plugin)

    def deactivate_plugin(self, plugin: str) -> bool:
        """Dectivate plugin."""
        return self._asynchronous_job_handler.deactivate_plugin(plugin)

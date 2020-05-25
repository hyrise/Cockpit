"""The BackgroundJobManager is managing the background jobs for the apscheduler."""

from multiprocessing import Value

from apscheduler.schedulers.background import BackgroundScheduler

from .cursor import ConnectionFactory, StorageConnectionFactory
from .job.activate_plugin import activate_plugin as activate_plugin_job
from .job.deactivate_plugin import deactivate_plugin as deactivate_plugin_job
from .job.delete_tables import delete_tables as delete_tables_job
from .job.load_tables import load_tables as load_tables_job
from .job.ping_hyrise import ping_hyrise
from .job.update_chunks_data import update_chunks_data
from .job.update_krueger_data import update_krueger_data
from .job.update_operator_data import update_operator_data
from .job.update_plugin_log import update_plugin_log
from .job.update_queue_length import update_queue_length
from .job.update_storage_data import update_storage_data
from .job.update_system_data import update_system_data
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
    ):
        """Initialize BackgroundJobManager object."""
        self._database_id: str = database_id
        self._database_blocked: Value = database_blocked
        self._connection_factory: ConnectionFactory = connection_factory
        self._storage_connection_factory: StorageConnectionFactory = storage_connection_factory
        self._worker_pool: WorkerPool = worker_pool
        self._scheduler: BackgroundScheduler = BackgroundScheduler()
        self._hyrise_active: Value = hyrise_active
        self._init_jobs()

    def _init_jobs(self) -> None:
        """Initialize basic background jobs."""
        self._ping_hyrise_job = self._scheduler.add_job(
            func=ping_hyrise,
            trigger="interval",
            seconds=0.5,
            args=(self._connection_factory, self._hyrise_active),
        )
        self._update_queue_length_job = self._scheduler.add_job(
            func=update_queue_length,
            trigger="interval",
            seconds=1,
            args=(self._worker_pool, self._storage_connection_factory),
        )
        self._update_system_data_job = self._scheduler.add_job(
            func=update_system_data,
            trigger="interval",
            seconds=1,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_storage_data_job = self._scheduler.add_job(
            func=update_storage_data,
            trigger="interval",
            seconds=5,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_plugin_log_job = self._scheduler.add_job(
            func=update_plugin_log,
            trigger="interval",
            seconds=1,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_chunks_data_job = self._scheduler.add_job(
            func=update_chunks_data,
            trigger="interval",
            seconds=5,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_krueger_data_job = self._scheduler.add_job(
            func=update_krueger_data,
            trigger="interval",
            seconds=5,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_operator_data_job = self._scheduler.add_job(
            func=update_operator_data,
            trigger="interval",
            seconds=5,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )

    def start(self) -> None:
        """Start background scheduler."""
        self._scheduler.start()

    def close(self) -> None:
        """Close background scheduler."""
        self._update_krueger_data_job.remove()
        self._update_system_data_job.remove()
        self._update_chunks_data_job.remove()
        self._update_storage_data_job.remove()
        self._update_plugin_log_job.remove()
        self._update_queue_length_job.remove()
        self._update_operator_data_job.remove()
        self._ping_hyrise_job.remove()
        self._scheduler.shutdown()

    def load_tables(self, folder_name: str) -> bool:
        """Load tables."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._scheduler.add_job(
                func=load_tables_job,
                args=(self._database_blocked, folder_name, self._connection_factory),
            )
            return True
        else:
            return False

    def delete_tables(self, folder_name: str) -> bool:
        """Delete tables."""
        if not self._database_blocked.value:
            self._database_blocked.value = True
            self._scheduler.add_job(
                func=delete_tables_job,
                args=(self._database_blocked, folder_name, self._connection_factory),
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

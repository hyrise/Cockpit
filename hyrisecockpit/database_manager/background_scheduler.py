"""The BackgroundJobManager is managing the background jobs for the apscheduler."""

from multiprocessing import Value

from apscheduler.schedulers.background import BackgroundScheduler

from .asynchronous_job_handler import AsynchronousJobHandler
from .cursor import ConnectionFactory, StorageConnectionFactory
from .job.ping_hyrise import ping_hyrise
from .job.update_chunks_data import update_chunks_data
from .job.update_plugin_log import update_plugin_log
from .job.update_queue_length import update_queue_length
from .job.update_segment_configuration import update_segment_configuration
from .job.update_storage_data import update_storage_data
from .job.update_system_data import update_system_data
from .job.update_workload_operator_information import (
    update_workload_operator_information,
)
from .job.update_workload_statement_information import (
    update_workload_statement_information,
)
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
        self._previous_system_data = {
            "previous_system_usage": None,
            "previous_process_usage": None,
        }
        self._previous_chunk_data = {
            "value": None,
        }
        self._asynchronous_job_handler = AsynchronousJobHandler(
            self._database_blocked, self._connection_factory, self._workload_drivers,
        )

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
                self._previous_system_data,
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
                self._previous_chunk_data,
            ),
        )
        self._update_workload_statement_information_job = self._scheduler.add_job(
            func=update_workload_statement_information,
            trigger="interval",
            seconds=5,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_workload_operator_information_job = self._scheduler.add_job(
            func=update_workload_operator_information,
            trigger="interval",
            seconds=5,
            args=(
                self._database_blocked,
                self._connection_factory,
                self._storage_connection_factory,
            ),
        )
        self._update_segment_configuration_job = self._scheduler.add_job(
            func=update_segment_configuration,
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
        self._update_workload_statement_information_job.remove()
        self._update_system_data_job.remove()
        self._update_chunks_data_job.remove()
        self._update_storage_data_job.remove()
        self._update_plugin_log_job.remove()
        self._update_queue_length_job.remove()
        self._update_workload_operator_information_job.remove()
        self._ping_hyrise_job.remove()
        self._scheduler.shutdown()

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

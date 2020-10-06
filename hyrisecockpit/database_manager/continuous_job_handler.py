"""This module handles the continuous jobs."""

from multiprocessing import Value

from apscheduler.schedulers.background import BackgroundScheduler

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


class ContinuousJobHandler:
    """Continuous Job Handler.

    This class manage all jobs that are executed continuously in the background.
    The jobs are executed via a background scheduler
    (https://apscheduler.readthedocs.io/en/stable/).
    """

    def __init__(
        self,
        connection_factory: ConnectionFactory,
        hyrise_active: Value,
        worker_pool: WorkerPool,
        storage_connection_factory: StorageConnectionFactory,
        database_blocked: Value,
    ):
        """Initialize continuous Job Handler.

        Args:
            connection_factory: An object to create a connection to the Hyrise
                database. All information relevant for the connection (port, host) is
                saved in this object.
            hyrise_active: Flag stored in a shared memory map. This flag
                stores if the Hyrise instance is active or not.
            worker_pool: An object that manages the queue and task/queue workers. Its
                api is used to get the queue length.
            storage_connection_factory: An object to create a connection to the Influx
                database. All information relevant for the connection (port, host) is
                saved in this object.
            database_blocked: Flag stored in a shared memory map. This flag
                stores if the Hyrise instance is blocked or not.
        """
        self._connection_factory = connection_factory
        self._hyrise_active = hyrise_active
        self._worker_pool = worker_pool
        self._storage_connection_factory = storage_connection_factory
        self._database_blocked: Value = database_blocked
        self._previous_system_data = {
            "previous_system_usage": None,
            "previous_process_usage": None,
        }
        self._previous_chunk_data = {
            "value": None,
        }
        self._scheduler: BackgroundScheduler = BackgroundScheduler()
        self._init_jobs()

    def _init_jobs(self) -> None:
        """Initialize basic background jobs.

        This function registers all continuous jobs in the background
        scheduler.
        """
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
        """Close background scheduler.

        Here we remove all jobs from the background scheduler and
        shut it down.
        """
        self._update_workload_statement_information_job.remove()
        self._update_system_data_job.remove()
        self._update_chunks_data_job.remove()
        self._update_storage_data_job.remove()
        self._update_plugin_log_job.remove()
        self._update_queue_length_job.remove()
        self._update_workload_operator_information_job.remove()
        self._ping_hyrise_job.remove()
        self._scheduler.shutdown()

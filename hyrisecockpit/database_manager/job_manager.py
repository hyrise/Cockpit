"""The JobManager is managing all the jobs."""
from multiprocessing import Value

from apscheduler.schedulers.background import BackgroundScheduler

from .cursor import ConnectionFactory
from .job.ping_hyrise import ping_hyrise
from .job.update_chunks_data import update_chunks_data
from .job.update_krueger_data import update_krueger_data
from .job.update_plugin_log import update_plugin_log
from .job.update_queue_length import update_queue_length
from .job.update_storage_data import update_storage_data
from .job.update_system_data import update_system_data
from .worker_pool import WorkerPool


class JobManger:
    """Manage jobs."""

    def __init__(
        self,
        database_id: str,
        database_blocked: Value,
        connection_factory: ConnectionFactory,
        worker_pool: WorkerPool,
        hyrise_active: Value,
        storage_host: str,
        storage_password: str,
        storage_port: str,
        storage_user: str,
    ):
        """Initialize JobManager object."""
        self._database_id: str = database_id
        self._database_blocked: Value = database_blocked
        self._connection_factory: ConnectionFactory = connection_factory
        self._worker_pool: WorkerPool = worker_pool
        self._hyrise_active: Value = hyrise_active
        self._scheduler: BackgroundScheduler = BackgroundScheduler()
        self._storage_host: str = storage_host
        self._storage_password: str = storage_password
        self._storage_port: str = storage_port
        self._storage_user: str = storage_user
        self._basic_job_args = (
            self._database_blocked,
            self._connection_factory,
            self._storage_host,
            self._storage_port,
            self._storage_user,
            self._storage_password,
            self._database_id,
        )
        self._init_background_jobs()

    def _init_background_jobs(self) -> None:
        """Initialize basic background jobs."""
        self._ping_hyrise_job = self._scheduler.add_job(
            func=ping_hyrise,
            trigger="interval",
            seconds=0.5,
            args=(self._connection_factory, self._hyrise_active,),
        )
        self._update_queue_length_job = self._scheduler.add_job(
            func=update_queue_length,
            trigger="interval",
            seconds=1,
            args=(
                self._worker_pool,
                self._storage_host,
                self._storage_port,
                self._storage_user,
                self._storage_password,
                self._database_id,
            ),
        )
        self._update_system_data_job = self._scheduler.add_job(
            func=update_system_data,
            trigger="interval",
            seconds=1,
            args=self._basic_job_args,
        )
        self._update_storage_data_job = self._scheduler.add_job(
            func=update_storage_data,
            trigger="interval",
            seconds=5,
            args=self._basic_job_args,
        )
        self._update_plugin_log_job = self._scheduler.add_job(
            func=update_plugin_log,
            trigger="interval",
            seconds=1,
            args=self._basic_job_args,
        )
        self._update_chunks_data_job = self._scheduler.add_job(
            func=update_chunks_data,
            trigger="interval",
            seconds=5,
            args=self._basic_job_args,
        )
        self._update_krueger_data_job = self._scheduler.add_job(
            func=update_krueger_data,
            trigger="interval",
            seconds=5,
            args=(
                self._storage_host,
                self._storage_port,
                self._storage_user,
                self._storage_user,
                self._database_id,
            ),
        )

    def start_background_jobs(self) -> None:
        """Start background scheduler."""
        self._scheduler.start()

    def close_background_jobs(self) -> None:
        """Close background scheduler."""
        self._update_krueger_data_job.remove()
        self._update_system_data_job.remove()
        self._update_chunks_data_job.remove()
        self._update_storage_data_job.remove()
        self._update_plugin_log_job.remove()
        self._update_queue_length_job.remove()
        self._ping_hyrise_job.remove()
        self._scheduler.shutdown()

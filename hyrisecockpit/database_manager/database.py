"""The database object represents the instance of a database."""

from multiprocessing import Value
from typing import List, Optional

from psycopg2.extensions import AsIs

from .background_scheduler import BackgroundJobManager
from .cursor import PoolCursor
from .driver import Driver
from .worker_pool import WorkerPool


class Database(object):
    """Represents database."""

    def __init__(
        self,
        id: str,
        user: str,
        password: str,
        host: str,
        port: str,
        dbname: str,
        number_workers: int,
        workload_publisher_url: str,
        default_tables: str,
        storage_host: str,
        storage_password: str,
        storage_port: str,
        storage_user: str,
    ) -> None:
        """Initialize database object."""
        self._id = id
        self.number_workers = number_workers
        self._number_additional_connections = 1
        self.driver = Driver(
            user,
            password,
            host,
            port,
            dbname,
            self.number_workers + self._number_additional_connections,
        )
        self._connection_pool = self.driver.get_connection_pool()
        self._processing_tables_flag = Value("b", False)
        self._database_blocked = Value("b", False)
        self._background_scheduler = BackgroundJobManager(
            self._id,
            self._processing_tables_flag,
            self._connection_pool,
            storage_host,
            storage_password,
            storage_port,
            storage_user,
        )
        self._worker_pool = WorkerPool(
            self._connection_pool,
            self.number_workers,
            self._id,
            workload_publisher_url,
            self._database_blocked,
        )
        self._worker_pool.start()

    def get_queue_length(self) -> int:
        """Return queue length."""
        return self._worker_pool.get_queue_length()

    def get_failed_tasks(self):
        """Return failed tasks."""
        return self._worker_pool.get_failed_tasks()

    def load_data(self, folder_name: str):
        """Load pregenerated tables."""
        return True

    def delete_data(self, folder_name: str):
        """Delete tables."""
        return True

    def get_processing_tables_flag(self):
        """Return tables loading flag."""
        return False

    def start_worker(self):
        """Start worker."""
        return self._worker_pool.start()

    def close_worker(self):
        """Close worker."""
        return self._worker_pool.close()

    def get_plugins(self) -> Optional[List]:
        """Return all currently activated plugins."""
        if not self._processing_tables_flag.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(("SELECT name FROM meta_plugins;"), (None,))
                result = cur.fetchall()
                print(result)
                return result
        else:
            return None

    def activate_plugin(self, plugin: str) -> bool:
        """Activate Plugin."""
        if not self._processing_tables_flag.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(
                    (
                        "INSERT INTO meta_plugins(name) VALUES ('usr/local/hyrise/lib/lib%sPlugin.so');"
                    ),
                    (AsIs(plugin),),
                )
            return True
        else:
            return False

    def deactivate_plugin(self, plugin: str) -> bool:
        """Activate Plugin."""
        if not self._processing_tables_flag.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(
                    ("DELETE FROM meta_plugins WHERE name='%sPlugin';"), (AsIs(plugin),)
                )
            return True
        else:
            return False

    def close(self) -> None:
        """Close the database."""
        # Remove jobs
        # Close the scheduler
        self._worker_pool.terminate()
        # Close subscriber worker
        # Close worker pool
        # Close connections
        self._connection_pool.closeall()

        # Close queue

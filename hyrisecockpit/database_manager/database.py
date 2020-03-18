"""The database object represents the instance of a database."""

from multiprocessing import Value
from typing import Dict, List, Optional

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
        self.number_workers: int = number_workers
        self._default_tables: str = default_tables
        self._number_additional_connections: int = 50
        self.driver = Driver(
            user,
            password,
            host,
            port,
            dbname,
            self.number_workers + self._number_additional_connections,
        )
        self._connection_pool = self.driver.get_connection_pool()
        self._database_blocked: Value = Value("b", False)
        self._background_scheduler = BackgroundJobManager(
            self._id,
            self._database_blocked,
            self._connection_pool,
            storage_host,
            storage_password,
            storage_port,
            storage_user,
        )
        self._worker_pool: WorkerPool = WorkerPool(
            self._connection_pool,
            self.number_workers,
            self._id,
            workload_publisher_url,
            self._database_blocked,
        )
        self._background_scheduler.start()
        self._background_scheduler.load_tables(self._default_tables)

    def get_queue_length(self) -> int:
        """Return queue length."""
        return self._worker_pool.get_queue_length()

    def get_failed_tasks(self) -> List[Dict[str, str]]:
        """Return failed tasks."""
        return self._worker_pool.get_failed_tasks()

    def load_data(self, folder_name: str) -> bool:
        """Load pregenerated tables."""
        return self._background_scheduler.load_tables(folder_name)

    def delete_data(self, folder_name: str) -> bool:
        """Delete tables."""
        return self._background_scheduler.delete_tables(folder_name)

    def activate_plugins(self, plugin: str) -> bool:
        """Activate plugin."""
        return self._background_scheduler.activate_plugin(plugin)

    def deactivate_plugins(self, plugin: str) -> bool:
        """Deactivate plugin."""
        return self._background_scheduler.deactivate_plugin(plugin)

    def get_database_blocked(self) -> bool:
        """Return tables loading flag."""
        return self._database_blocked.value

    def start_worker(self) -> bool:
        """Start worker."""
        return self._worker_pool.start()

    def close_worker(self) -> bool:
        """Close worker."""
        return self._worker_pool.close()

    def get_plugins(self) -> Optional[List]:
        """Return all currently activated plugins."""
        if not self._database_blocked.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(("SELECT name FROM meta_plugins;"), (None,))
                rows = cur.fetchall()
                result = [row[0] for row in rows] if rows else []
                return result
        else:
            return None

    def set_plugin_setting(self, name: str, value: str) -> bool:
        """Adjust setting for given plugin."""
        if not self._database_blocked.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute(
                    "UPDATE meta_settings SET value=%s WHERE name=%s;", (value, name,),
                )
            return True
        else:
            return False

    def get_plugin_setting(self) -> Optional[List]:
        """Read currently set plugin settings."""
        if not self._database_blocked.value:
            with PoolCursor(self._connection_pool) as cur:
                cur.execute("SELECT * FROM meta_settings", None)
                result = cur.fetchall()
            return result
        else:
            return None

    def close(self) -> None:
        """Close the database."""
        self._worker_pool.terminate()
        self._background_scheduler.close()
        self._connection_pool.closeall()

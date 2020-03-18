"""Module for managing cockpit."""

import signal
import subprocess  # nosec
import time
from types import TracebackType
from typing import Optional, Type

import requests

from utils.settings import (
    DB1_HOST,
    DB1_PASSWORD,
    DB1_PORT,
    DB1_TYPE,
    DB2_HOST,
    DB2_PASSWORD,
    DB2_PORT,
    DB2_TYPE,
)

DATABASES = {
    "db1": {
        "number_workers": 10,
        "id": "db1",
        "user": DB1_PASSWORD,
        "password": DB1_PASSWORD,
        "host": DB1_HOST,
        "port": DB1_PORT,
        "dbname": DB1_TYPE,
    },
    "db2": {
        "number_workers": 10,
        "id": "db2",
        "user": DB2_PASSWORD,
        "password": DB2_PASSWORD,
        "host": DB2_HOST,
        "port": DB2_PORT,
        "dbname": DB2_TYPE,
    },
}


class CockpitManager:
    """Manage cockpit components."""

    def __init__(self, backen_url, start_components):
        """Initialize CockpitManager."""
        self._backend_url = backen_url
        self._subprocesses = []
        self._start_components = start_components

    def __enter__(self):
        """Return self for a context manager."""
        return self

    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[TracebackType],
    ) -> Optional[bool]:
        """Call close with a context manager."""
        self.close_components()
        return None

    def start_components(self):
        """Start main cockpit components as sub-processes."""
        if self._start_components:
            backend_prosess = subprocess.Popen(  # nosec
                ["pipenv", "run", "cockpit-backend"],
                stderr=subprocess.DEVNULL,
                stdout=subprocess.DEVNULL,
            )
            self._subprocesses.append(backend_prosess)
            time.sleep(1)
            manager_process = subprocess.Popen(  # nosec
                ["pipenv", "run", "cockpit-manager"],
                stderr=subprocess.DEVNULL,
                stdout=subprocess.DEVNULL,
            )
            self._subprocesses.append(manager_process)
            time.sleep(0.5)
            generator_process = subprocess.Popen(  # nosec
                ["pipenv", "run", "cockpit-generator"],
                stderr=subprocess.DEVNULL,
                stdout=subprocess.DEVNULL,
            )
            self._subprocesses.append(generator_process)
            time.sleep(0.5)

    def close_components(self) -> None:
        """Close main cockpit components."""
        for i in range(len(self._subprocesses)):
            self._subprocesses[i].send_signal(signal.SIGINT)
            self._subprocesses[i].wait()
        self._subprocesses = []

    def _check_if_database_added(self, database_id):
        """Check if databases are added in cockpit."""
        while True:
            time.sleep(0.2)
            # TODO add time out and check response
            response = requests.get(f"{self._backend_url}/control/database").json()
            databases = [database["id"] for database in response]
            check_processed = database_id in databases
            if check_processed:
                break

    def add_databases(self, databases, number_worker):
        """Add databases in cockpit."""
        if "none" in databases:
            return
        for database in databases:
            data = DATABASES.get(database)
            data["number_workers"] = number_worker
            # TODO add time out and check response
            _ = requests.post(f"{self._backend_url}/control/database", json=data)
        self._check_if_database_added(database)

    def _check_if_database_blocked(self):
        """Check if database is blocked in cockpit."""
        while True:
            time.sleep(0.2)
            response = requests.get(
                f"{self._backend_url}/monitor/database_blocked_status"
            ).json()
            status_flags = [
                database["database_blocked_status"] for database in response
            ]
            check_blocked = False
            for flag in status_flags:
                check_blocked = check_blocked or flag
            if not check_blocked:
                break

    def _load_tables(self, workload_type):
        data = {"folder_name": workload_type}
        # TODO add time out and check response
        _ = requests.post(f"{self._backend_url}/control/data", json=data)
        self._check_if_database_blocked()

    def start_workload(self, workload_type, frequency):
        """Start workload in cockpit."""
        self._check_if_database_blocked()
        self._load_tables(workload_type)
        data = {"folder_name": workload_type, "frequency": frequency}
        # TODO add time out and check response
        _ = requests.post(f"{self._backend_url}/control/workload", json=data)

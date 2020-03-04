"""Wrapper for backend."""

from signal import SIGINT
from subprocess import DEVNULL, Popen  # nosec

import requests

from settings import BACKEND_HOST, BACKEND_PORT


class CockpitBackend:
    """Wrapper for backend."""

    def __init__(self):
        """Initialize backend wrapper."""
        self._backend_host = BACKEND_HOST
        self._backend_port = BACKEND_PORT

    def start(self):
        """Start backend."""
        self.backend_process = Popen(  # nosec
            ["pipenv", "run", "python", "cli_backend.py"],
            stderr=DEVNULL,
            stdout=DEVNULL,
        )

    def shutdown(self):
        """Stop backend."""
        self.backend_process.send_signal(SIGINT)
        self.backend_process.wait()

    def get_monitor_property(self, property: str):
        """Get monitor property."""
        url = f"http://{self._backend_host}:{self._backend_port}/monitor/{property}"
        return requests.get(url).json()

    def get_control_property(self, property: str):
        """Get control property."""
        url = f"http://{self._backend_host}:{self._backend_port}/control/{property}"
        return requests.get(url).json()

    def add_database(self, id: str, host: str):
        """Add database."""
        body = {
            "id": id,
            "host": host,
            "port": "5432",
            "number_workers": 8,
            "dbname": "postgres",
            "user": "serviceuser",
            "password": "serviceuser",
        }
        url = f"http://{self._backend_host}:{self._backend_port}/control/database"
        return requests.post(url, json=body).json()

    def remove_database(self, id: str):
        """Add database."""
        body = {"id": id}
        url = f"http://{self._backend_host}:{self._backend_port}/control/database"
        return requests.delete(url, json=body).json()

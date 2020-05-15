"""Wrapper for backend."""

import pathlib
from os import remove
from signal import SIGINT
from subprocess import Popen  # nosec
from time import sleep

from requests import delete, get, post

from plugin_evaluation.settings import BACKEND_HOST, BACKEND_PORT

REQUEST_TIMEOUT = 5.0
absolute_directory_path = str(pathlib.Path(__file__).parent.absolute())


class CockpitBackend:
    """Wrapper for backend."""

    def __init__(self):
        """Initialize backend wrapper."""
        self.error_file = open("backend_stderr.txt", "w")
        self.output_file = open("backend_stdout.txt", "w")

        self._backend_host = BACKEND_HOST
        self._backend_port = BACKEND_PORT

    def start(self) -> None:
        """Start backend."""
        self.backend_process = Popen(  # nosec
            [
                "pipenv",
                "run",
                "python",
                "-u",
                f"{absolute_directory_path}/cli_backend.py",
            ],
            stderr=self.error_file,
            stdout=self.output_file,
        )

    def shutdown(self) -> None:
        """Stop backend."""
        self.backend_process.send_signal(SIGINT)
        self.backend_process.wait()
        self.output_file.close()
        self.error_file.close()
        remove("backend_stderr.txt")
        remove("backend_stdout.txt")

    def get_stderr(self):
        """Get standard error output."""
        with open("backend_stderr.txt", "r") as err:
            errors = err.read()
        return errors

    def get_stdout(self):
        """Get standard output."""
        with open("backend_stdout.txt", "r") as out:
            output = out.read()
        return output

    def get_monitor_property(self, property: str):
        """Get monitor property."""
        url = f"http://{self._backend_host}:{self._backend_port}/monitor/{property}"
        return get(url, timeout=REQUEST_TIMEOUT).json()

    def get_historical_monitor_property(
        self, property: str, startts: int, endts: int, precision: int
    ):
        """Get monitor property."""
        url = f"http://{self._backend_host}:{self._backend_port}/monitor/{property}?startts={startts}&endts={endts}&precision={precision}"
        return get(url, timeout=REQUEST_TIMEOUT).json()

    def get_control_property(self, property: str):
        """Get control property."""
        url = f"http://{self._backend_host}:{self._backend_port}/control/{property}"
        return get(url, timeout=REQUEST_TIMEOUT).json()

    def add_database(self, id: str, host: str, port: str):
        """Add database."""
        body = {
            "id": id,
            "host": host,
            "port": port,
            "number_workers": 8,
            "dbname": "postgres",
            "user": "serviceuser",
            "password": "serviceuser",
        }
        url = f"http://{self._backend_host}:{self._backend_port}/control/database/"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def remove_database(self, id: str):
        """Add database."""
        body = {"id": id}
        url = f"http://{self._backend_host}:{self._backend_port}/control/database/"
        return delete(url, json=body, timeout=REQUEST_TIMEOUT)

    def start_workload(self, workload_folder: str, frequency: int):
        """Start workload execution."""
        body = {"folder_name": workload_folder, "frequency": frequency}
        url = f"http://{self._backend_host}:{self._backend_port}/workload/"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def stop_workload(self, workload_folder: str):
        """Stop workload execution."""
        url = f"http://{self._backend_host}:{self._backend_port}/workload/{workload_folder}"
        return delete(url, timeout=REQUEST_TIMEOUT)

    def start_workers(self):
        """Start worker pool."""
        url = (
            f"http://{self._backend_host}:{self._backend_port}/control/database/worker"
        )
        return post(url, timeout=REQUEST_TIMEOUT)

    def stop_workers(self):
        """Stop worker pool."""
        url = (
            f"http://{self._backend_host}:{self._backend_port}/control/database/worker"
        )
        return delete(url, timeout=REQUEST_TIMEOUT)

    def activate_plugin(self, database_id: str, plugin: int):
        """Activate plugin."""
        body = {"id": database_id, "plugin": plugin}
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def deactivate_plugin(self, database_id: str, plugin: int):
        """Deactivate plugin."""
        body = {"id": database_id, "plugin": plugin}
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin"
        return delete(url, json=body, timeout=REQUEST_TIMEOUT)

    def get_plugin_log(self):
        """Get plugin log."""
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin_log"
        return get(url, timeout=REQUEST_TIMEOUT).json()

    def get_activated_plugins(self):
        """Get activated plugins."""
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin"
        return get(url, timeout=REQUEST_TIMEOUT)

    def get_plugin_settings(self):
        """Get plugin settings."""
        url = (
            f"http://{self._backend_host}:{self._backend_port}/control/plugin_settings"
        )
        return get(url, timeout=REQUEST_TIMEOUT)

    def set_plugin_settings(self, database_id: str, setting_name: str, value: str):
        """Set plugin settings."""
        body = {"id": database_id, "name": setting_name, "value": value}
        url = (
            f"http://{self._backend_host}:{self._backend_port}/control/plugin_settings"
        )
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def get_status(self):
        """Get status."""
        url = f"http://{self._backend_host}:{self._backend_port}/monitor/status"
        return get(url, timeout=REQUEST_TIMEOUT).json()

    def wait_for_unblocked_status(self):
        """Wait for all databases to leave blocked status."""
        while True:
            unblocked_statuses = [
                not database_data["database_blocked_status"]
                for database_data in self.get_status()
            ]
            if all(unblocked_statuses):
                break
            else:
                sleep(0.5)

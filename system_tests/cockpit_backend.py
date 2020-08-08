"""Wrapper for backend."""

from os import remove
from signal import SIGINT
from subprocess import Popen  # nosec

from requests import delete, get, post, put

from system_tests.settings import BACKEND_HOST, BACKEND_PORT

REQUEST_TIMEOUT = 5.0


class CockpitBackend:
    """Wrapper for backend."""

    def __init__(self):
        """Initialize backend wrapper."""
        self.error_file = open("backend_stderr.txt", "w")
        self.output_file = open("backend_stdout.txt", "w")

        self._backend_host = BACKEND_HOST
        self._backend_port = BACKEND_PORT

    def start(self):
        """Start backend."""
        self.backend_process = Popen(  # nosec
            ["pipenv", "run", "python", "-u", "cli_backend.py"],
            stderr=self.error_file,
            stdout=self.output_file,
        )

    def shutdown(self):
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

    def get_property(self, property: str):
        """Get property."""
        url = f"http://{self._backend_host}:{self._backend_port}/{property}"
        return get(url, timeout=REQUEST_TIMEOUT)

    def get_historical_property(
        self, property: str, startts: int, endts: int, precision: int
    ):
        """Get historical property."""
        url = f"http://{self._backend_host}:{self._backend_port}/{property}?startts={startts}&endts={endts}&precision={precision}"
        return get(url, timeout=REQUEST_TIMEOUT)

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

    def load_tables(self, workload_type: str, scalefactor: float):
        """Load tables for the benchmark."""
        body = {"scale_factor": scalefactor, "workload_type": workload_type}
        url = f"http://{self._backend_host}:{self._backend_port}/control/database/workload_tables"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def delete_tables(self, workload_type: str, scalefactor: float):
        """Delete tables for the benchmark."""
        body = {"scale_factor": scalefactor, "workload_type": workload_type}
        url = f"http://{self._backend_host}:{self._backend_port}/control/database/workload_tables"
        return delete(url, json=body, timeout=REQUEST_TIMEOUT)

    def start_workload(
        self, workload_type: str, scalefactor: float, frequency: int, weights=None
    ):
        """Start workload execution."""
        if not weights:
            weights = {}
        body = {
            "scale_factor": scalefactor,
            "workload_type": workload_type,
            "weights": weights,
            "frequency": frequency,
        }
        url = f"http://{self._backend_host}:{self._backend_port}/workload/"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def stop_workload(self, workload_type: str):
        """Stop workload execution."""
        url = (
            f"http://{self._backend_host}:{self._backend_port}/workload/{workload_type}"
        )
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
        body = {"name": plugin}
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/{database_id}"
        return post(url, json=body, timeout=REQUEST_TIMEOUT)

    def deactivate_plugin(self, database_id: str, plugin: int):
        """Deactivate plugin."""
        body = {"name": plugin}
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/{database_id}"
        return delete(url, json=body, timeout=REQUEST_TIMEOUT)

    def get_activated_plugins(self):
        """Get activated plugins."""
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/"
        return get(url, timeout=REQUEST_TIMEOUT)

    def set_plugin_settings(
        self, database_id: str, plugin_name: str, setting_name: str, value: str
    ):
        """Set plugin settings."""
        body = {"name": plugin_name, "setting": {"name": setting_name, "value": value}}
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/{database_id}"
        return put(url, json=body, timeout=REQUEST_TIMEOUT)

    def get_plugin_log(self):
        """Get plugin log."""
        url = f"http://{self._backend_host}:{self._backend_port}/control/plugin/log"
        return get(url, timeout=REQUEST_TIMEOUT)

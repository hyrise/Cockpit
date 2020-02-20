"""Module for managing benchmark plug-ins."""

import signal
import subprocess  # nosec
import time

import requests

from hyrisecockpit.settings import (
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


class WrkPlugin:
    """Handle and execute wrk benchmark."""

    def __init__(self, configuration):
        """Initialize WrkBenchmark."""
        self._configuration = configuration
        self._backend_url = configuration["backend_url"]
        self._subprocesses = []

    def _start_subprocesses(self):
        """Start main cockpit components as sub-processes."""
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

    def _close_subprocesses(self):
        """Close main cockpit components."""
        for i in range(len(self._subprocesses)):
            self._subprocesses[i].send_signal(signal.SIGINT)
            self._subprocesses[i].poll()
        self._subprocesses = []

    def _check_if_database_added(self, database_id):
        """Check if databases are added to cockpit."""
        in_process = True
        while in_process:
            time.sleep(0.2)
            # TODO add time out
            response = requests.get(f"{self._backend_url}/control/database").json()
            databses = response["body"]["databases"]
            check_processed = database_id in databses
            if check_processed:
                in_process = False

    def _add_databases(self):
        """Add databases to cockpit."""
        databases = self._configuration["databases"]
        for database in databases:
            data = DATABASES.get(database)
            data["number_workers"] = self._configuration["number_workers"]
            # TODO add time out
            _ = requests.post(f"{self._backend_url}/control/database", json=data)
            self._check_if_database_added(database)

    def _run_wrk_on_endpoints(self, endpoint_type):
        """Run wrk benchmark on endpoints."""
        for end_point in self._configuration["end_points"][
            f"endpoints_{endpoint_type}"
        ]:
            sub_process = subprocess.run(  # nosec
                [
                    "wrk",
                    "-t1",
                    "-c1",
                    f"-d{self._configuration['time']}s",
                    f"{self._backend_url}/{endpoint_type}/{end_point}",
                ],
                capture_output=True,
            )
            print(sub_process.stdout.decode("utf-8"))

    def run_benchmark(self):
        """Start components, add databases and run wrk benchmark on endpoints."""
        try:
            self._start_subprocesses()
            self._add_databases()
            self._run_wrk_on_endpoints("monitor")
            self._run_wrk_on_endpoints("control")
            self._close_subprocesses()
        except Exception as e:
            print(str(e))
            self._close_subprocesses()
            exit()


class PluginManager:
    """Manage plug-ins."""

    def __init__(self):
        """Initialize PluginManager."""
        self.plugins = {"wrk": self._get_wrk_plugin}

    def _get_wrk_plugin(self, configuration):
        return WrkPlugin(configuration)

    def get_plugins(self, configuration):
        """Initialize plug-ins and return them."""
        plugins = []
        for plugin in configuration["plugins"]:
            plugins.append(self.plugins.get(plugin)(configuration))
        return plugins

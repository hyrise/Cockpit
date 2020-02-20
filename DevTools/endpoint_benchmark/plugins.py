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


class Cockpit:
    """Manage Cockpit components."""

    def __init__(self, backen_url):
        """Initialize CockpitComponentsPool."""
        self._backend_url = backen_url
        self._subprocesses = []

    def start_components(self):
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

    def stop_components(self):
        """Close main cockpit components."""
        for i in range(len(self._subprocesses)):
            self._subprocesses[i].send_signal(signal.SIGINT)
            self._subprocesses[i].poll()
        self._subprocesses = []

    def _check_if_database_added(self, database_id):
        """Check if databases are added in cockpit."""
        while True:
            time.sleep(0.2)
            # TODO add time out and check response
            response = requests.get(f"{self._backend_url}/control/database").json()
            databses = response["body"]["databases"]
            check_processed = database_id in databses
            if check_processed:
                break

    def add_databases(self, databases, number_worker):
        """Add databases in cockpit."""
        for database in databases:
            data = DATABASES.get(database)
            data["number_workers"] = number_worker
            # TODO add time out and check response
            _ = requests.post(f"{self._backend_url}/control/database", json=data)
            self._check_if_database_added(database)

    def _check_if_tables_processed(self):
        """Check if tables are processed in cockpit."""
        while True:
            time.sleep(0.2)
            responce = requests.get(
                f"{self._backend_url}/monitor/process_table_status"
            ).json()
            process_table_status = responce["body"]["process_table_status"]
            check_processed = False
            for process_table_flag in range(len(process_table_status)):
                check_processed = (
                    check_processed or process_table_flag["process_table_status"]
                )
            if not check_processed:
                break

    def start_workload(self, workload_type, frequency):
        """Start workload in cockpit."""
        data = {"folder_name": workload_type, "frequency": frequency}
        # TODO add time out and check response
        _ = requests.post(f"{self._backend_url}/control/workload", json=data)
        self._check_if_tables_processed()


class WrkPlugin:
    """Handle and execute wrk benchmark."""

    def __init__(self, configuration):
        """Initialize WrkBenchmark."""
        self._configuration = configuration
        self._backend_url = configuration["backend_url"]
        self._cockpit = Cockpit(self._backend_url)

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
            self._cockpit.start_components()
            self._cockpit.add_databases(
                self._configuration["databases"], self._configuration["number_workers"]
            )
            for workload in self._configuration["workloads"]:
                self._cockpit.start_workload(
                    workload, self._configuration["workload_frequence"],
                )
                self._run_wrk_on_endpoints("monitor")
                self._run_wrk_on_endpoints("control")
            self._cockpit.stop_components()
        except Exception as e:
            print(str(e))
            self._cockpit.stop_components()
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

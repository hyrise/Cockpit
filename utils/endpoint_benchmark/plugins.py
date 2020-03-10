"""Module for managing benchmark plug-ins."""
import pprint
import subprocess  # nosec
import time

import requests

from utils.endpoint_benchmark.print_colors import print_green, print_yellow


class WrkPlugin:
    """Handle and execute wrk benchmark."""

    def __init__(self, configuration):
        """Initialize WrkBenchmark."""
        self._configuration = configuration
        self._backend_url = configuration["backend_url"]

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
            print(sub_process.stderr.decode("utf-8"))

    def run_benchmark(self):
        """Run wrk benchmark on endpoints."""
        self._run_wrk_on_endpoints("monitor")
        self._run_wrk_on_endpoints("control")


class DisplayMonitor:
    """Handle and execute DisplayMonitor benchmark."""

    def __init__(self, configuration):
        """Initialize WrkBenchmark."""
        self._configuration = configuration
        self._backend_url = configuration["backend_url"]

    def _get_endpoint_output(self):
        endpoint_output = {}
        for end_point in self._configuration["end_points"]["endpoints_monitor"]:
            endpoint_output[end_point] = requests.get(
                f"{self._backend_url}/monitor/{end_point}"
            ).json()
        return endpoint_output

    def _display_endpoint_output(self, output):
        for key, value in output.items():
            print_yellow(f"\nEndpoint: {key}: \n")
            pprint.pprint(value)

    def run_benchmark(self):
        """Run DisplayMonitor benchmark on endpoints."""
        for i in range(self._configuration["runs"]):
            print_green(f"\nRun {i} ")
            output = self._get_endpoint_output()
            self._display_endpoint_output(output)
            time.sleep(self._configuration["time"])


class PluginManager:
    """Manage plug-ins."""

    def __init__(self):
        """Initialize PluginManager."""
        self.plugins = {
            "wrk": self._get_wrk_plugin,
            "displayMonitor": self._get_display_monitor_plugin,
        }

    def _get_wrk_plugin(self, configuration):
        return WrkPlugin(configuration)

    def _get_display_monitor_plugin(self, configuration):
        return DisplayMonitor(configuration)

    def get_plugins(self, configuration):
        """Initialize plug-ins and return them."""
        plugins = []
        for plugin in configuration["plugins"]:
            plugins.append(self.plugins.get(plugin)(configuration))
        return plugins

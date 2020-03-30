"""Module for managing benchmark plug-ins."""
import pprint
import subprocess  # nosec
import time

import requests

from utils.endpoint_benchmark.print_colors import (
    print_green,
    print_purple,
    print_yellow,
)


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


class DisplayReply:
    """Handle and execute DisplayMonitor benchmark."""

    def __init__(self, configuration):
        """Initialize WrkBenchmark."""
        self._configuration = configuration
        self._backend_url = configuration["backend_url"]

    def _get_endpoint_output(self, endpoint_type):
        endpoint_output = {}
        for end_point in self._configuration["end_points"][
            f"endpoints_{endpoint_type}"
        ]:
            endpoint_output[end_point] = requests.get(
                f"{self._backend_url}/{endpoint_type}/{end_point}"
            ).json()
            if not endpoint_output[end_point]:
                endpoint_output[end_point] = {}
        return endpoint_output

    def _display_endpoint_output(self, output):
        for key, value in output.items():
            print_yellow(f"\nEndpoint: {key}: \n")
            pprint.pprint(value)

    def run_benchmark(self):
        """Run DisplayMonitor benchmark on endpoints."""
        for i in range(self._configuration["runs"]):
            print_green(f"\nRun {i} ")
            output_monitor = self._get_endpoint_output("monitor")
            output_control = self._get_endpoint_output("control")
            if output_monitor:
                print_purple(f"\nMonitor")
                self._display_endpoint_output(output_monitor)
            if output_control:
                print_purple(f"\nControl")
                self._display_endpoint_output(output_control)
            time.sleep(self._configuration["time"])


class PluginManager:
    """Manage plug-ins."""

    def __init__(self):
        """Initialize PluginManager."""
        self.plugins = {
            "wrk": self._get_wrk_plugin,
            "displayReply": self._get_display_reply_plugin,
        }

    def _get_wrk_plugin(self, configuration):
        return WrkPlugin(configuration)

    def _get_display_reply_plugin(self, configuration):
        return DisplayReply(configuration)

    def get_plugins(self, configuration):
        """Initialize plug-ins and return them."""
        plugins = []
        for plugin in configuration["plugins"]:
            plugins.append(self.plugins.get(plugin)(configuration))
        return plugins

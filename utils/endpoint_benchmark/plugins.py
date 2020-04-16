"""Module for managing benchmark plug-ins."""
import pprint
import subprocess  # nosec
from multiprocessing import Process
from time import sleep, time_ns

import requests

from utils.endpoint_benchmark.print_colors import (
    print_green,
    print_purple,
    print_yellow,
)

paramater_endpoints = ["queue_length", "throughput", "latency", "system"]


def wrk_background_process(url, duration):
    """Background process to execute wrk."""
    sub_process = subprocess.run(  # nosec
        ["wrk", "-t1", "-c1", f"-d{duration}s", f"{url}"], capture_output=True,
    )
    print(sub_process.stdout.decode("utf-8"))
    print(sub_process.stderr.decode("utf-8"))


def check_for_parameter(endpoint):
    """Check if endpoint need parameters."""
    if endpoint in paramater_endpoints:
        timestamp = time_ns() - 3_000_000_000
        endts = timestamp
        startts = timestamp - 1_000_000_000
        endpoint = f"{endpoint}?startts={startts}&endts={endts}"
    return endpoint


class MultiProcessWrkPlugin:
    """Handle and execute wrk benchmark in separate processes for every endpoint."""

    def __init__(self, configuration):
        """Initialize WrkBenchmark."""
        self._configuration = configuration
        self._backend_url = configuration["backend_url"]

    def _create_wrk_processes(self, endpoint_type, end_points):
        """Create one wrk process per endpoint."""
        return [
            Process(
                target=wrk_background_process,
                args=(
                    f"{self._backend_url}/{endpoint_type}/{check_for_parameter(end_point)}",
                    self._configuration["time"],
                ),
            )
            for end_point in end_points
        ]

    def run_benchmark(self):
        """Run wrk benchmark on endpoints."""
        monitor_processes = self._create_wrk_processes(
            "monitor", self._configuration["end_points"]["endpoints_monitor"]
        )
        control_processes = self._create_wrk_processes(
            "control", self._configuration["end_points"]["endpoints_control"]
        )
        for process in monitor_processes:
            process.start()
        for process in control_processes:
            process.start()
        for process in monitor_processes:
            process.join()
            process.terminate()
        for process in control_processes:
            process.join()
            process.terminate()


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
                    f"{self._backend_url}/{endpoint_type}/{check_for_parameter(end_point)}",
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
                f"{self._backend_url}/{endpoint_type}/{check_for_parameter(end_point)}"
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
            sleep(self._configuration["time"])


class PluginManager:
    """Manage plug-ins."""

    def __init__(self):
        """Initialize PluginManager."""
        self.plugins = {
            "wrk": self._get_wrk_plugin,
            "displayReply": self._get_display_reply_plugin,
            "multiProcessWrk": self._get_multi_process_wrk_plugin,
        }

    def _get_wrk_plugin(self, configuration):
        return WrkPlugin(configuration)

    def _get_display_reply_plugin(self, configuration):
        return DisplayReply(configuration)

    def _get_multi_process_wrk_plugin(self, configuration):
        return MultiProcessWrkPlugin(configuration)

    def get_plugins(self, configuration):
        """Initialize plug-ins and return them."""
        plugins = []
        for plugin in configuration["plugins"]:
            plugins.append(self.plugins.get(plugin)(configuration))
        return plugins

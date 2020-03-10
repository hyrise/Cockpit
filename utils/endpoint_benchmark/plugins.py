"""Module for managing benchmark plug-ins."""

import subprocess  # nosec


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
        """Start components, add databases and run wrk benchmark on endpoints."""
        self._run_wrk_on_endpoints("monitor")
        self._run_wrk_on_endpoints("control")


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

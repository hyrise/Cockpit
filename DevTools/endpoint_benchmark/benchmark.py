"""Module for run benchmark with plug-ins."""

from DevTools.endpoint_benchmark.argument_parser import ArgumentParser
from DevTools.endpoint_benchmark.cockpit_manager import CockpitManager
from DevTools.endpoint_benchmark.plugins import PluginManager

if __name__ == "__main__":
    arg_parser = ArgumentParser()
    configuration = arg_parser.get_configuration()
    plugin_manager = PluginManager()
    plugins = plugin_manager.get_plugins(configuration)
    with CockpitManager(configuration["backend_url"]) as cockpit_manager:
        try:
            for plugin in plugins:
                print(
                    "......................................................................"
                )
                print(f"Run {type(plugin).__name__}: \n")
                for workload in configuration["workloads"]:
                    print(f"Run workload {workload}: \n")
                    cockpit_manager.start_components()
                    cockpit_manager.add_databases(
                        configuration["databases"], configuration["number_workers"]
                    )
                    cockpit_manager.start_workload(
                        workload, configuration["workload_frequence"]
                    )
                    plugin.run_benchmark()
        except KeyboardInterrupt:
            print("Benchmark closed.")

"""Module for run benchmark with plug-ins."""

from utils.endpoint_benchmark.argument_parser import ArgumentParser
from utils.endpoint_benchmark.cockpit_manager import CockpitManager
from utils.endpoint_benchmark.plugins import PluginManager
from utils.endpoint_benchmark.print_colors import print_cyan, print_red

if __name__ == "__main__":  # noqa
    arg_parser = ArgumentParser()
    configuration = arg_parser.get_configuration()
    plugin_manager = PluginManager()
    plugins = plugin_manager.get_plugins(configuration)
    start_components = False
    if configuration["start_components"] == "Y":
        start_components = True
    with CockpitManager(
        configuration["backend_url"], start_components
    ) as cockpit_manager:
        try:
            for plugin in plugins:
                print_red(f"Run {type(plugin).__name__}: \n")
                print_cyan(f"Run workload {configuration['workload']}: \n")
                cockpit_manager.start_components()
                cockpit_manager.add_databases(
                    configuration["databases"], configuration["number_workers"]
                )
                cockpit_manager.start_workload(
                    configuration["workload"],
                    configuration["workload_frequence"],
                    configuration["load_tables"],
                )
                plugin.run_benchmark()
                if "database" in configuration["close"]:
                    cockpit_manager.close_database(configuration["databases"])
                if "workload" in configuration["close"]:
                    cockpit_manager.stop_workload()
                cockpit_manager.close_components()
        except KeyboardInterrupt:
            print("Benchmark closed.")

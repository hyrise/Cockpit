"""Module for run benchmark with plug-ins."""

from DevTools.endpoint_benchmark.argument_parser import ArgumentParser
from DevTools.endpoint_benchmark.plugins import PluginManager

if __name__ == "__main__":
    arg_parser = ArgumentParser()
    configuration = arg_parser.get_configuration()
    plugin_manager = PluginManager()
    plugins = plugin_manager.get_plugins(configuration)
    for i in range(len(plugins)):
        plugins[i].run_benchmark()

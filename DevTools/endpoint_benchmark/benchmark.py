"""Module for run benchmark with plug-ins."""

from DevTools.endpoint_benchmark.argument_parser import ArgumentParser
from DevTools.endpoint_benchmark.plugins import WrkPlugin

if __name__ == "__main__":
    arg_parser = ArgumentParser()
    configuration = arg_parser.get_configuration()
    wrk_benchmark = WrkPlugin(configuration)
    wrk_benchmark.run_benchmark()

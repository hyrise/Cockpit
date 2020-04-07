"""Module for parsing arguments from command line."""
import argparse
from json import dumps

from utils.endpoint_benchmark.print_colors import print_red


class ArgumentParser:
    """Parse arguments from command line."""

    def __init__(self):
        """Initialize a ArgumentParser."""
        self.parser = argparse.ArgumentParser(
            formatter_class=argparse.ArgumentDefaultsHelpFormatter
        )
        self._workloads = ["tpch", "tpcds", "job"]
        self._scale = {"tpch": ["0.1", "1"], "tpcds": ["1"], "job": ["1"]}
        self._add_arguments()

    def _add_arguments(self):
        self.parser.add_argument(
            "--workload",
            "-w",
            dest="workload",
            metavar="",
            type=str,
            nargs="?",
            help="workload to rename queries. Allowed values are "
            + ", ".join(self._workloads),
        )
        self.parser.add_argument(
            "--scale",
            "-s",
            dest="scale",
            metavar="",
            type=str,
            nargs="?",
            help="scaling factor to rename queries. Allowed values are "
            + dumps(self._scale),
        )
        self.parser.add_argument(
            "--sourc",
            "-sc",
            dest="source",
            metavar="",
            type=str,
            nargs="?",
            help="source path from orginal query files",
        )
        self.parser.add_argument(
            "--destination",
            "-d",
            dest="destination",
            metavar="",
            type=str,
            nargs="?",
            help="destination path for the renamed query files.",
        )

    def _get_workload(self):
        workload = self.parser.parse_args().workload
        if workload not in self._workloads:
            print_red(f"\nWorkload: {workload} not found\n")
            return None
        return workload

    def _get_scale(self, workload):
        scale = self.parser.parse_args().scale
        if scale not in self._scale[workload]:
            print_red(
                f"\nScaling factor: {scale} is not allowed for the given workload\n"
            )
            return None
        return scale

    def get_configuration(self):
        """Return argument configuration."""
        workload = self._get_workload()
        if not workload:
            return None
        scale = self._get_scale(workload)
        if not scale:
            return None
        if not self.parser.parse_args().source:
            print_red(f"\nPlease add valid source path\n")
            return None
        if not self.parser.parse_args().destination:
            print_red(f"\nPlease add valid destination path\n")
            return None
        return {
            "path_to_original": self.parser.parse_args().source,
            "path_to_new": self.parser.parse_args().destination,
            "workload": workload,
            "scale": scale,
        }

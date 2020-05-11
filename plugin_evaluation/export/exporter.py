"""Module for export of the Influx data to PDF."""
from os import listdir
from pathlib import Path
from typing import List

from hyrisecockpit.database_manager.table_names import table_names
from plugin_evaluation.export.config import config


class Exporter:
    """Exports time series data to PDF."""

    def plot_metric(
        self, metric: str, database: str, startts: int, endts: int, parameter=None
    ):
        """Plot metric data for a given database."""
        metric_config = config[metric]

        column_name = metric_config["column_name"]
        x_label = metric_config["x_label"]
        y_label = metric_config["y_label"]
        path = metric_config["path"]

        influx_function = metric_config["influx_function"]
        points_function = metric_config["points_function"]
        plot_function = metric_config["plot_function"]

        points = influx_function(  # type: ignore
            metric_config["table_name"],
            column_name,
            database,
            startts,
            endts,
            parameter,
        )
        x_values, y_values, title = points_function(points, column_name, parameter)  # type: ignore

        plot_function(x_values, y_values, x_label, y_label, title, path)  # type: ignore

    def plot_metric_for_benchmark(
        self, metric: str, benchmark: str, database_id: str, startts: int, endts: int
    ):
        """Create graphs for all tables of the benchmark."""
        benchmark_name: str = benchmark.split("_")[0]
        table_names_with_sf: List = [
            f"{table_name}_{benchmark}" for table_name in table_names[benchmark_name]
        ]

        for table_name in table_names_with_sf:
            self.plot_metric(metric, database_id, startts, endts, table_name)

    def plot_query_metric_for_benchmark(
        self, metric: str, benchmark: str, database_id: str, startts: int, endts: int
    ):
        """Create graphs for all queries."""
        query_types: List = self.get_query_types_for_benchmark(benchmark)
        for query_type in query_types:
            self.plot_metric(
                metric, database_id, startts, endts, (benchmark, query_type)
            )

    def get_query_types_for_benchmark(self, benchmark: str):
        """Return all query types for a given benchmark."""
        absolute_cockpit_path: str = str(Path(__file__).parent.parent.parent.absolute())
        query_files: List = listdir(
            f"{absolute_cockpit_path}/hyrisecockpit/workload_generator/workloads/{benchmark}"
        )
        return [query_file.split(".sql")[0] for query_file in query_files]

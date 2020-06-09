"""Module for export of the Influx data to PDF."""
from datetime import datetime
from os import listdir, mkdir, remove
from os.path import isdir, isfile, join
from pathlib import Path
from typing import Callable, Dict, List, Union

from hyrisecockpit.database_manager.table_names import table_names
from plugin_evaluation.export.config import config
from plugin_evaluation.export.influx_handling import get_plugin_log
from plugin_evaluation.export.plot_handling import plot_plugin_log_table
from plugin_evaluation.export.points_handling import handle_plugin_log


class Exporter:
    """Exports time series data to PDF."""

    def __init__(self, tag: str, csv_export: bool = False):
        """Clear folder structure."""
        self._tag: str = tag
        self._csv_export_flag: bool = csv_export
        self._timestamp = datetime.now()
        self._folder_name = self._timestamp.strftime(f"{tag} %d-%m-%Y %H:%M:%S")
        self.plugin_logs: List = []
        absolute_plugin_evaluation_path: str = str(
            Path(__file__).parent.parent.absolute()
        )
        self.absolute_report_path = f"{absolute_plugin_evaluation_path}/report"
        self._reset_directory(f"{self.absolute_report_path}")
        self._reset_directory(f"{self.absolute_report_path}/{self._folder_name}")
        self._reset_directory(
            f"{self.absolute_report_path}/{self._folder_name}/Footprint"
        )
        self._reset_directory(
            f"{self.absolute_report_path}/{self._folder_name}/Access frequency"
        )
        self._reset_directory(
            f"{self.absolute_report_path}/{self._folder_name}/Query latency"
        )

    def _clear_directory(self, directory_path: str):
        """Clear directory from files."""
        files_to_be_deleted = [
            f"{directory_path}/{item}"
            for item in listdir(directory_path)
            if isfile(join(directory_path, item))
        ]
        for file in files_to_be_deleted:
            remove(file)

    def _reset_directory(self, directory_path: str):
        """Reset directory."""
        if isdir(directory_path):
            self._clear_directory(directory_path)
        else:
            mkdir(directory_path)

    def initialize_plugin_log(self, database: str, startts: int, endts: int):
        """Initialize plugin_log_values."""
        raw_plugin_logs = get_plugin_log(database, startts, endts)
        self.plugin_logs = handle_plugin_log(raw_plugin_logs)
        plot_plugin_log_table(
            self.plugin_logs, f"{self.absolute_report_path}/{self._folder_name}/"
        )

    def plot_metric(
        self,
        metric: str,
        database: str,
        startts: int,
        endts: int,
        parameter=None,
        aggregation_interval: int = 1,
    ):
        """Plot metric data for a given database."""
        metric_config: Dict[str, Union[str, int, Callable]] = config[metric]  # type: ignore

        column_name: str = metric_config["column_name"]  # type: ignore
        x_label: str = metric_config["x_label"]  # type: ignore
        y_label: str = metric_config["y_label"]  # type: ignore
        path: str = metric_config["path"]  # type: ignore
        log_interval: int = metric_config["log_interval"]  # type: ignore
        title: int = metric_config["title"]  # type: ignore

        influx_function: Callable = metric_config["influx_function"]  # type: ignore
        points_function: Callable = metric_config["points_function"]  # type: ignore
        aggregation_function: Callable = metric_config["aggregation_function"]  # type: ignore # noqa
        title_function: Callable = metric_config["title_function"]  # type: ignore
        plot_function: Callable = metric_config["plot_function"]  # type: ignore
        csv_function: Callable = metric_config["csv_function"]  # type: ignore

        save_path: str = f"{self.absolute_report_path}/{self._folder_name}/{path}"

        points = influx_function(
            metric_config["table_name"],
            column_name,
            database,
            startts,
            endts,
            parameter,
        )
        x_values, y_values = points_function(points, column_name, parameter)

        # aggregated_x_values, aggregated_y_values = aggregation_function( # noqa
        #     x_values, y_values, log_interval, aggregation_interval # noqa
        # ) # noqa

        aggregated_x_values = x_values
        aggregated_y_values = y_values

        formatted_title = title_function(title, parameter)

        plot_function(
            aggregated_x_values,
            aggregated_y_values,
            x_label,
            y_label,
            formatted_title,
            save_path,
            self.plugin_logs,
            max(log_interval, int(aggregation_interval / log_interval)),
        )
        if self._csv_export_flag:
            csv_function(
                aggregated_x_values,
                aggregated_y_values,
                save_path,
                formatted_title,
                x_label,
            )

    def plot_metric_for_benchmark(
        self,
        metric: str,
        benchmark: str,
        database_id: str,
        startts: int,
        endts: int,
        aggregation_interval: int = 1,
    ):
        """Create graphs for all tables of the benchmark."""
        benchmark_name: str = benchmark.split("_")[0]
        table_names_with_sf: List = [
            f"{table_name}_{benchmark}" for table_name in table_names[benchmark_name]
        ]

        for table_name in table_names_with_sf:
            self.plot_metric(
                metric, database_id, startts, endts, table_name, aggregation_interval
            )

    def plot_query_metric_for_benchmark(
        self,
        metric: str,
        benchmark: str,
        database_id: str,
        startts: int,
        endts: int,
        aggregation_interval: int = 1,
    ):
        """Create graphs for all queries."""
        query_types: List = self.get_query_types_for_benchmark(benchmark)
        for query_type in query_types:
            self.plot_metric(
                metric,
                database_id,
                startts,
                endts,
                (benchmark, query_type),
                aggregation_interval,
            )

    def get_query_types_for_benchmark(self, benchmark: str):
        """Return all query types for a given benchmark."""
        absolute_cockpit_path: str = str(Path(__file__).parent.parent.parent.absolute())
        query_files: List = listdir(
            f"{absolute_cockpit_path}/hyrisecockpit/workload_generator/workloads/{benchmark}"
        )
        return [query_file.split(".sql")[0] for query_file in query_files]

"""Module for export of the Influx data to PDF."""
from plugin_evaluation.export.config import config


class Exporter:
    """Exports time series data to PDF."""

    def plot_metric(
        self, metric: str, database: str, startts: int, endts: int, parameter=None
    ):
        """Plot metric data for a given database."""
        metric_config = config[metric]

        column_name = metric_config["column_name"]
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
        x_values, y_values = points_function(points, column_name, parameter)  # type: ignore

        plot_function(x_values, y_values, metric, metric_config["x_label"], metric_config["y_label"], parameter)  # type: ignore

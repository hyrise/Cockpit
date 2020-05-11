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

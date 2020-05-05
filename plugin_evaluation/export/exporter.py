"""Module for export of the Influx data to PDF."""
from plugin_evaluation.export.config import config


class Exporter:
    """Exports time series data to PDF."""

    def plot_metric(self, metric: str, database: str, startts: int, endts: int):
        """Plot metric data for a given database."""
        metric_config = config[metric]
        influx_function = metric_config["influx_function"]
        points_function = metric_config["points_function"]
        plot_function = metric_config["plot_function"]

        points = influx_function(  # type: ignore
            metric_config["table_name"], metric, database, startts, endts,
        )
        x_values, y_values = points_function(points, metric)  # type: ignore

        plot_function(  # type: ignore
            x_values, y_values, metric, metric_config["y_label"]
        )

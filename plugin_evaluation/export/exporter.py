"""Module for export of the Influx data to PDF."""
from plugin_evaluation.export.config import config


class Exporter:
    """Exports time series data to PDF."""

    def plot_metric(self, metric: str, database: str, startts: int, endts: int):
        """Plot metric data for a given database."""
        metric_config = config[metric]
        points = metric_config["influx_function"](  # type: ignore
            metric_config["table_name"], metric, database, startts, endts,
        )
        time_values, metric_values = metric_config["points_function"](points, metric)  # type: ignore
        metric_config["plot_function"](  # type: ignore
            time_values, metric_values, metric, metric_config["y_label"]
        )

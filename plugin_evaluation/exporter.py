"""Module for export of the Influx data to PDF."""
import matplotlib.dates as mdate
import matplotlib.pyplot as plt
import numpy as np
from influxdb import InfluxDBClient
from matplotlib.pyplot import figure

from plugin_evaluation.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)


def idle_function(value):
    """Doesn't change the input value."""
    return value


def ns_to_ms(value):
    """Convert ns to ms."""
    return value / 1_000_000


config = {
    "throughput": {
        "table_name": "throughput",
        "metric": "throughput",
        "label": "Queries / second",
        "function": idle_function,
    },
    "latency": {
        "table_name": "latency",
        "metric": "latency",
        "label": "ms",
        "function": ns_to_ms,
    },
    "queue_length": {
        "table_name": "queue_length",
        "metric": "queue_length",
        "label": "number of items",
        "function": idle_function,
    },
    "cpu_process_usage": {
        "table_name": "system_data",
        "metric": "cpu_process_usage",
        "label": "% usage",
        "function": idle_function,
    },
}


class Exporter:
    """Exports time series data to PDF."""

    def __init__(self):
        """Initialize Exporter."""
        self._client = InfluxDBClient(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
        )

    def get_metric_data(
        self, table_name: str, metric: str, database: str, startts: int, endts: int
    ):
        """Get metric data for provided time range."""
        query: str = f"""SELECT MEAN({metric}) AS {metric}
            FROM {table_name}
            WHERE time >= $startts
            AND time < $endts
            GROUP BY TIME(1s)
            FILL(0.0)"""
        result = self._client.query(
            query,
            database=database,
            bind_params={"startts": startts, "endts": endts},
            epoch=True,
        )
        return list(result[table_name, None])

    def plot_metric(self, metric: str, database: str, startts: int, endts: int):
        """Plot metric data for a given database."""
        metric_config = config[metric]
        points = self.get_metric_data(
            metric_config["table_name"],  # type: ignore
            metric_config["metric"],  # type: ignore
            database,
            startts,
            endts,
        )
        self.export_metric(
            metric_config["metric"],  # type: ignore
            metric_config["label"],  # type: ignore
            points,
            metric_config["function"],
        )

    def export_metric(self, metric: str, label: str, points, function):
        """Export metric to file."""
        time = [int(point["time"] / 1_000_000_000) for point in points]
        metric_values = [function(point[metric]) for point in points]
        secs = mdate.epoch2num(time)

        figure(num=None, figsize=(12, 6), dpi=80, facecolor="w", edgecolor="k")
        plt.title(f"{metric}")
        plt.ylim(bottom=0.0, top=np.amax(metric_values) * 1.3)
        plt.plot_date(secs, metric_values, "-b", label=f"{metric}")
        plt.ylabel(f"{label}")
        plt.xlabel("Time")
        plt.legend()

        plt.savefig(f"export/{metric}.png", dpi=300)

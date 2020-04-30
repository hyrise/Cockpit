"""Module for export of the Influx data to PDF."""
import matplotlib.dates as mdate
import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
from matplotlib.pyplot import figure

from plugin_evaluation.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)

config = {
    "throughput": {
        "table_name": "throughput",
        "metric": "throughput",
        "label": "Queries / second",
    }
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
        result = self._client.query(
            f"SELECT {metric} FROM {table_name} WHERE time >= $startts AND time < $endts;",
            database=database,
            bind_params={"startts": startts, "endts": endts},
            epoch=True,
        )
        return list(result[table_name, None])

    def plot_metric(self, metric: str, database: str, startts: int, endts: int):
        """Plot metric data for a given database."""
        metric_config = config[metric]
        points = self.get_metric_data(
            metric_config["table_name"],
            metric_config["metric"],
            database,
            startts,
            endts,
        )
        self.export_metric(metric_config["metric"], metric_config["label"], points)

    def export_metric(self, metric: str, label: str, points):
        """Export metric to file."""
        time = [int(point["time"] / 1_000_000_000) for point in points]
        metric_values = [point[metric] for point in points]
        secs = mdate.epoch2num(time)

        figure(num=None, figsize=(12, 6), dpi=80, facecolor="w", edgecolor="k")
        plt.title("Title")
        plt.plot_date(secs, metric_values, "-b", label=f"{metric}")
        plt.ylabel(f"{label}")
        plt.xlabel("Time")
        plt.legend()

        plt.savefig(f"{metric}.png", dpi=300)

"""Module for export of the Influx data to PDF."""
from pathlib import Path

import matplotlib.dates as mdate
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.pyplot import figure

from plugin_evaluation.export.config import config

absolute_report_directory_path = str(Path(__file__).parent.parent.absolute())


class Exporter:
    """Exports time series data to PDF."""

    def plot_metric(self, metric: str, database: str, startts: int, endts: int):
        """Plot metric data for a given database."""
        metric_config = config[metric]
        points = metric_config["influx_function"](
            metric_config["table_name"],  # type: ignore
            metric,
            database,
            startts,
            endts,
        )
        self.export_metric(
            metric,
            metric_config["label"],  # type: ignore
            points,
            metric_config["metric_function"],
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

        plt.savefig(f"{absolute_report_directory_path}/report/{metric}.png", dpi=300)

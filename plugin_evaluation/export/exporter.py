"""Module for export of the Influx data to PDF."""
from pathlib import Path
from typing import List

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
        points = metric_config["influx_function"](  # type: ignore
            metric_config["table_name"], metric, database, startts, endts,
        )
        time_values, metric_values = metric_config["points_function"](points, metric)  # type: ignore
        self.export_metric(
            time_values, metric_values, metric, metric_config["y_label"],  # type: ignore
        )

    def export_metric(
        self, time_values: List, metric_values: List, metric: str, y_label: str
    ):
        """Export metric to file."""
        figure(num=None, figsize=(12, 6), dpi=80, facecolor="w", edgecolor="k")
        plt.title(f"{metric}")
        plt.ylim(bottom=0.0, top=np.amax(metric_values) * 1.3)
        plt.plot_date(time_values, metric_values, "-b", label=f"{metric}")
        plt.ylabel(f"{y_label}")
        plt.xlabel("Time")
        plt.legend()

        plt.savefig(f"{absolute_report_directory_path}/report/{metric}.png", dpi=300)

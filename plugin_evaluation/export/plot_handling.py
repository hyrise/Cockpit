"""Module for plotting of the graphs."""
from pathlib import Path
from typing import Dict, List

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.pyplot import figure

absolute_report_directory_path = str(Path(__file__).parent.parent.absolute())


def plot_line_chart(
    time_values: List, metric_values: Dict, x_label: str, y_label: str, title: str,
):
    """Plot line chart to file."""
    figure(num=None, figsize=(12, 6), dpi=80, facecolor="w", edgecolor="k")
    prop_cycle = plt.rcParams["axes.prop_cycle"]
    colors = prop_cycle.by_key()["color"]

    maximum_value = np.amax([np.amax(values) for values in metric_values.values()])

    plt.title(f"{title}")
    plt.ticklabel_format(style="plain")
    plt.ylim(bottom=0.0, top=maximum_value * 1.1)

    for (metric_name, values), index in zip(
        metric_values.items(), range(len(metric_values.keys()))
    ):
        plt.plot_date(
            time_values,
            values,
            "-b",
            color=colors[index % len(colors)],
            label=f"{metric_name}",
        )
    plt.ylabel(f"{y_label}")
    plt.xlabel(f"{x_label}")
    plt.legend(loc="upper right")

    plt.savefig(f"{absolute_report_directory_path}/report/{title}.png", dpi=300)


def plot_bar_chart(
    labels: List, metric_values: List, x_label: str, y_label: str, title: str,
):
    """Plot line chart to file."""
    max_value = np.amax(metric_values)
    figure(num=None, figsize=(12, 6), dpi=80, facecolor="w", edgecolor="k")
    plt.title(f"{title}")
    plt.ticklabel_format(style="plain")
    plt.xticks(rotation=45, ha="right")
    plt.subplots_adjust(bottom=0.15)
    plt.ylim(bottom=0.0, top=max_value * 1.3)
    plt.bar(labels, metric_values, label=f"{title}")
    for index, value in enumerate(metric_values):
        plt.text(index - 0.25, value + max_value * 0.02, ("%.1f" % value), rotation=45)
    plt.ylabel(f"{y_label}")
    plt.xlabel(f"{x_label}")
    plt.legend()

    plt.savefig(f"{absolute_report_directory_path}/report/{title}.png", dpi=300)

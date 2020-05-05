"""Module for plotting of the graphs."""
from pathlib import Path
from typing import List

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.pyplot import figure

absolute_report_directory_path = str(Path(__file__).parent.parent.absolute())


def plot_line_chart(time_values: List, metric_values: List, metric: str, y_label: str):
    """Plot line chart to file."""
    figure(num=None, figsize=(12, 6), dpi=80, facecolor="w", edgecolor="k")
    plt.title(f"{metric}")
    plt.ticklabel_format(style="plain")
    plt.ylim(bottom=0.0, top=np.amax(metric_values) * 1.3)
    plt.plot_date(time_values, metric_values, "-b", label=f"{metric}")
    plt.ylabel(f"{y_label}")
    plt.xlabel("Time")
    plt.legend()

    plt.savefig(f"{absolute_report_directory_path}/report/{metric}.png", dpi=300)
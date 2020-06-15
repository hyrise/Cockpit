"""Module for plotting of the graphs."""
from typing import Dict, List

import matplotlib.dates as mdates
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.font_manager import FontProperties
from matplotlib.pyplot import figure
from matplotlib.transforms import Bbox
from scipy.ndimage.filters import gaussian_filter1d


def plot_line_chart(
    time_values: List,
    metric_values: Dict,
    x_label: str,
    y_label: str,
    title: str,
    path: str,
    plugin_logs: List,
    aggregation_interval: int,
):
    """Plot line chart to file."""
    fig = figure(num=None, figsize=(12, 6), dpi=80, facecolor="w", edgecolor="k")
    prop_cycle = plt.rcParams["axes.prop_cycle"]
    colors = prop_cycle.by_key()["color"]

    maximum_value = np.amax([np.amax(values) for values in metric_values.values()])

    plt.title(f"{title} (aggregation over {aggregation_interval}s)")
    plt.ticklabel_format(style="plain")
    if maximum_value > 0:
        plt.ylim(bottom=0.0, top=maximum_value * 1.1)

    for (metric_name, values), index in zip(
        metric_values.items(), range(len(metric_values.keys()))
    ):
        values_smoothed = gaussian_filter1d(values, sigma=1.5)

        plt.plot_date(
            time_values,
            values,
            "-",
            color=colors[index % len(colors)],
            label=f"{metric_name}",
            linewidth=1,
            alpha=0.5,
        )

        plt.plot_date(
            time_values,
            values_smoothed,
            linestyle="--",
            color=colors[index % len(colors)],
            label="_nolegend_",
            marker=None,
        )
    ######### Plugin Logs ###### # noqa

    log_color = "lime"
    text_color = "limegreen"
    factor = (min(len(plugin_logs), 100)) / 100  # [0.0, 1.1]
    plugin_font_size = 12 - 9 * factor
    plugin_line_width = 1.0 - 0.7 * factor

    logs_timestamps = [plugin_log["timestamp"] for plugin_log in plugin_logs]

    plt.plot_date(
        logs_timestamps, np.zeros(len(logs_timestamps)), marker=10, color=log_color
    )

    for plugin_log in plugin_logs:
        plt.annotate(
            str(plugin_log["id"]),
            xy=(mdates.date2num(plugin_log["timestamp"]), 0.02 * maximum_value),
            color=text_color,
            fontsize=plugin_font_size,
        )
        plt.axvline(
            plugin_log["timestamp"],
            color=log_color,
            linestyle="--",
            linewidth=plugin_line_width,
            alpha=0.7,
        )

    #######################

    plt.ylabel(f"{y_label}")
    plt.xlabel(f"{x_label}")
    plt.legend(loc="upper right")
    plt.grid(alpha=0.5)

    ####### Statistics ######## # noqa
    rows = [
        ["%.3f" % func(values) for metric, values in metric_values.items()]
        for func in (np.amax, np.mean, np.amin, np.var)
    ]
    row_labels = ["MAX", "AVG", "MIN", "VAR"]
    plt.table(
        cellText=rows,
        rowLabels=row_labels,
        cellLoc="center",
        colLabels=list(metric_values.keys()),
        loc="bottom",
        bbox=[0, -0.29, 1, 0.17],
    )
    plt.subplots_adjust(left=0.2, bottom=0.2)
    ##########################

    plt.savefig(f"{path}{title}.png", dpi=300)
    plt.close(fig)


def plot_bar_chart(
    labels: List,
    metric_values: List,
    x_label: str,
    y_label: str,
    title: str,
    path: str,
    plugin_logs: List,
    aggregation_interval: int,
):
    """Plot line chart to file."""
    max_value = np.amax(metric_values)
    fig = figure(num=None, figsize=(12, 6), dpi=80, facecolor="w", edgecolor="k")
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

    plt.savefig(f"{path}{title}.png", dpi=300)
    plt.close(fig)


def plot_plugin_log_table(plugin_logs: List, path: str):
    """Plot plugin log table."""
    fig, ax = plt.subplots(figsize=(12, 6))

    ax.axis("off")
    ax.xaxis.set_visible(False)
    ax.yaxis.set_visible(False)

    rows = [
        (
            plugin_log["id"],
            plugin_log["timestamp"],
            plugin_log["reporter"],
            plugin_log["level"],
            plugin_log["message"],
        )
        for plugin_log in plugin_logs
    ]
    if len(plugin_logs) > 0:
        colcolor = "deepskyblue"
        collabel = ("ID", "Timestamp", "Reporter", "Level", "Message")
        table = ax.table(
            cellText=rows,
            colWidths=[0.03, 0.12, 0.08, 0.06, 0.5],
            colColours=[colcolor, colcolor, colcolor, colcolor, colcolor],
            colLabels=collabel,
            loc="center",
            colLoc="center",
        )
        table.auto_set_font_size(False)
        table.set_fontsize(4)
        table.scale(1.0, 1.5)

        titel_color = "white"
        column_alignments = ["center", "center", "center", "center", "left"]
        cells = table.properties()["celld"]

        for i in range(5):
            cells[0, i].get_text().set_color(titel_color)
            cells[0, i].set_text_props(
                fontproperties=FontProperties(weight="bold", size=7)
            )

        for column_index, column_alignment in enumerate(column_alignments):
            for i in range(1, len(plugin_logs) + 1):
                cells[i, column_index]._loc = column_alignment
                cells[i, column_index].PAD = 0.01

        ##### Bounding Box ######### # noqa
        plt.gcf().canvas.draw()
        points = table.get_window_extent(plt.gcf()._cachedRenderer).get_points()
        points[0, :] -= 10
        points[1, :] += 10
        nbbox = Bbox.from_extents(points / plt.gcf().dpi)
        ############################ # noqa

        plt.savefig(
            f"{path}Plugin log.png", dpi=300, bbox_inches=nbbox,
        )
    plt.close(fig)

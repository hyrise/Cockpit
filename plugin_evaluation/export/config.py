"""Module with metric configs."""

from plugin_evaluation.export.influx_handling import (
    get_metric_data,
    get_metric_data_with_fill,
)
from plugin_evaluation.export.plot_handling import plot_line_chart
from plugin_evaluation.export.points_handling import default_function, ns_to_ms

config = {
    "throughput": {
        "table_name": "throughput",
        "y_label": "Queries / second",
        "influx_function": get_metric_data_with_fill,
        "points_function": default_function,
        "plot_function": plot_line_chart,
    },
    "latency": {
        "table_name": "latency",
        "y_label": "ms",
        "influx_function": get_metric_data_with_fill,
        "points_function": ns_to_ms,
        "plot_function": plot_line_chart,
    },
    "queue_length": {
        "table_name": "queue_length",
        "y_label": "number of items",
        "influx_function": get_metric_data,
        "points_function": default_function,
        "plot_function": plot_line_chart,
    },
    "cpu_process_usage": {
        "table_name": "system_data",
        "y_label": "% usage",
        "influx_function": get_metric_data,
        "points_function": default_function,
        "plot_function": plot_line_chart,
    },
}

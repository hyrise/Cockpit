"""Module with metric configs."""

from plugin_evaluation.export.influx_handling import (
    get_detailed_latency_information,
    get_metric_data,
    get_metric_data_with_fill,
)
from plugin_evaluation.export.plot_handling import (
    plot_bar_chart,
    plot_line_chart,
    plot_line_chart_with_multiple_metrics,
)
from plugin_evaluation.export.points_handling import (
    calculate_footprint,
    calculate_footprint_for_table,
    default_function,
    ns_to_ms,
    sort_detailed_latency_points,
)

config = {
    "throughput": {
        "table_name": "throughput",
        "column_name": "throughput",
        "x_label": "Time",
        "y_label": "Queries / second",
        "influx_function": get_metric_data_with_fill,
        "points_function": default_function,
        "plot_function": plot_line_chart,
    },
    "latency": {
        "table_name": "latency",
        "column_name": "latency",
        "x_label": "Time",
        "y_label": "ms",
        "influx_function": get_metric_data_with_fill,
        "points_function": ns_to_ms,
        "plot_function": plot_line_chart,
    },
    "queue_length": {
        "table_name": "queue_length",
        "column_name": "queue_length",
        "x_label": "Time",
        "y_label": "number of items",
        "influx_function": get_metric_data,
        "points_function": default_function,
        "plot_function": plot_line_chart,
    },
    "cpu_process_usage": {
        "table_name": "system_data",
        "column_name": "cpu_process_usage",
        "x_label": "Time",
        "y_label": "% usage",
        "influx_function": get_metric_data,
        "points_function": default_function,
        "plot_function": plot_line_chart,
    },
    "footprint": {
        "table_name": "storage",
        "column_name": "storage_meta_information",
        "x_label": "Time",
        "y_label": "MB",
        "influx_function": get_metric_data,
        "points_function": calculate_footprint,
        "plot_function": plot_line_chart,
    },
    "detailed latency": {
        "table_name": "successful_queries",  # ignored
        "column_name": "latency",  # ignored
        "x_label": "Time",
        "y_label": "ms",
        "influx_function": get_detailed_latency_information,
        "points_function": sort_detailed_latency_points,
        "plot_function": plot_bar_chart,
    },
    "table footprint": {
        "table_name": "storage",
        "column_name": "storage_meta_information",
        "x_label": "Time",
        "y_label": "MB",
        "influx_function": get_metric_data,
        "points_function": calculate_footprint_for_table,
        "plot_function": plot_line_chart_with_multiple_metrics,
    },
}

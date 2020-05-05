"""Module with metric configs."""

from plugin_evaluation.export.influx_handling import (
    get_metric_data,
    get_metric_data_with_fill,
)
from plugin_evaluation.export.metric_handling import idle_function, ns_to_ms

config = {
    "throughput": {
        "table_name": "throughput",
        "label": "Queries / second",
        "influx_function": get_metric_data_with_fill,
        "metric_function": idle_function,
    },
    "latency": {
        "table_name": "latency",
        "label": "ms",
        "influx_function": get_metric_data_with_fill,
        "metric_function": ns_to_ms,
    },
    "queue_length": {
        "table_name": "queue_length",
        "label": "number of items",
        "influx_function": get_metric_data,
        "metric_function": idle_function,
    },
    "cpu_process_usage": {
        "table_name": "system_data",
        "label": "% usage",
        "influx_function": get_metric_data,
        "metric_function": idle_function,
    },
}

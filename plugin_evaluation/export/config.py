"""Module with metric configs."""

from plugin_evaluation.export.metric_handling import idle_function, ns_to_ms

config = {
    "throughput": {
        "table_name": "throughput",
        "label": "Queries / second",
        "function": idle_function,
    },
    "latency": {"table_name": "latency", "label": "ms", "function": ns_to_ms},
    "queue_length": {
        "table_name": "queue_length",
        "label": "number of items",
        "function": idle_function,
    },
    "cpu_process_usage": {
        "table_name": "system_data",
        "label": "% usage",
        "function": idle_function,
    },
}

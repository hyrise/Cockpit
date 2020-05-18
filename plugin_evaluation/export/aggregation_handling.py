"""Module for aggregation of the data."""
from datetime import datetime
from typing import Dict, List, Tuple

from numpy import mean


def idle_aggregation(
    time_values: List, metric_values: Dict, log_interval: int, aggregation_interval: int
) -> Tuple[List, Dict]:
    """Don't do any aggregation."""
    return (time_values, metric_values)


def time_aggregation(
    time_values: List, metric_values: Dict, log_interval: int, aggregation_interval: int
) -> Tuple[List, Dict]:
    """Aggregate over a time based metric values."""
    if aggregation_interval <= log_interval:
        return (time_values, metric_values)

    aggregation_size = int(aggregation_interval / log_interval)

    # Time aggregation
    aggregated_time_values: List = []
    for i in range(0, len(time_values), aggregation_size):
        subinterval_timestamps = [
            time_value.timestamp()
            for time_value in time_values[
                i : min(len(time_values), i + aggregation_size)
            ]
        ]
        aggregated_timestamp = mean(subinterval_timestamps)
        aggregated_time_value = datetime.fromtimestamp(aggregated_timestamp)
        aggregated_time_values.append(aggregated_time_value)

    # Metric aggregation
    aggregated_metric_values: Dict = {}
    for metric in metric_values.keys():
        aggregated_metric_values[metric] = []
        for i in range(0, len(time_values), aggregation_size):
            subinterval_metric_values = list(
                metric_values[metric][i : min(len(time_values), i + aggregation_size)]
            )
            aggregated_metric_value = mean(subinterval_metric_values)
            aggregated_metric_values[metric].append(aggregated_metric_value)

    return (aggregated_time_values, aggregated_metric_values)

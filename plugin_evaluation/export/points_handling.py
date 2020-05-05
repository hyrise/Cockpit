"""Functions for metric handling."""
from typing import List

import matplotlib.dates as mdate


def default_function(points: List, metric: str):
    """Doesn't change the input value."""
    time = [int(point["time"] / 1_000_000_000) for point in points]
    metric_values = [point[metric] for point in points]
    secs = mdate.epoch2num(time)

    return secs, metric_values


def ns_to_ms(points: List, metric: str):
    """Convert ns to ms."""
    time = [int(point["time"] / 1_000_000_000) for point in points]
    metric_values = [point[metric] / 1_000_000 for point in points]
    secs = mdate.epoch2num(time)

    return secs, metric_values

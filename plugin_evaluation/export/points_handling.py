"""Functions for metric handling."""
from json import loads
from typing import List

import matplotlib.dates as mdate


def default_function(points: List, column_name: str):
    """Doesn't change the input value."""
    time = [int(point["time"] / 1_000_000_000) for point in points]
    metric_values = [point[column_name] for point in points]
    secs = mdate.epoch2num(time)

    return secs, metric_values


def ns_to_ms(points: List, column_name: str):
    """Convert ns to ms."""
    time = [int(point["time"] / 1_000_000_000) for point in points]
    metric_values = [point[column_name] / 1_000_000 for point in points]
    secs = mdate.epoch2num(time)

    return secs, metric_values


def calculate_footprint(points: List, column_name: str):
    """Convert ns to ms."""
    time = [int(point["time"] / 1_000_000_000) for point in points]
    secs = mdate.epoch2num(time)

    metric_values = []
    for point in points:
        footprint = 0
        storage = loads(point["storage_meta_information"])
        for table_name in storage.keys():
            for column_name in storage[table_name]["data"].keys():
                footprint = footprint + storage[table_name]["data"][column_name]["size"]
        metric_values.append(footprint / 1_000_000)

    return secs, metric_values

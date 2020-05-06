"""Functions for metric handling."""
from json import loads
from typing import Dict, List

import matplotlib.dates as mdate


def default_function(points: List, column_name: str, parameter):
    """Doesn't change the input value."""
    time = [int(point["time"] / 1_000_000_000) for point in points]
    metric_values = [point[column_name] for point in points]
    secs = mdate.epoch2num(time)

    return secs, metric_values


def ns_to_ms(points: List, column_name: str, parameter):
    """Convert ns to ms."""
    time = [int(point["time"] / 1_000_000_000) for point in points]
    metric_values = [point[column_name] / 1_000_000 for point in points]
    secs = mdate.epoch2num(time)

    return secs, metric_values


def calculate_footprint(points: List, column_name: str, parameter):
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


def calculate_footprint_for_table(  # noqa
    points: List, metric_column_name: str, table_name
):
    """Calculate footprint for specific table."""

    def sort_function(tuple):
        return tuple[1][0] if len(tuple[1]) > 0 else 0.0

    time = [int(point["time"] / 1_000_000_000) for point in points]
    secs = mdate.epoch2num(time)

    available_column_names = set()
    variable = []

    for point in points:
        storage = loads(point["storage_meta_information"])
        if table_name in storage.keys():
            for column_name in storage[table_name]["data"].keys():
                available_column_names.add(column_name)
                variable.append(column_name)

    column_footprints: Dict = {
        column_name: [] for column_name in available_column_names
    }

    for point in points:
        storage = loads(point["storage_meta_information"])
        if table_name in storage.keys():
            for column_name in column_footprints.keys():
                if column_name in storage[table_name]["data"]:
                    column_footprints[column_name].append(
                        storage[table_name]["data"][column_name]["size"] / 1_000_000
                    )
                else:
                    column_footprints[column_name].append(0.0)
        else:
            for column_name in column_footprints.keys():
                column_footprints[column_name].append(0.0)

    footprint_items = list(column_footprints.items())
    footprint_items.sort(key=sort_function, reverse=True)

    return secs, dict(footprint_items)


def sort_detailed_latency_points(points: List, column_name: str, parameter):
    """Sort detailed latency points."""

    def get_latency(elem):
        return elem["latency"]

    points.sort(key=get_latency, reverse=True)

    labels = []
    for point in points:
        benchmark_name = point["benchmark"].split("_")[0].upper()
        scale_factor = ".".join(
            f"{number}" for number in point["benchmark"].split("_")[1:]
        )
        query_number = point["query_number"]
        labels.append(f"{benchmark_name}({scale_factor})-{query_number}")

    latency = [point["latency"] / 1_000_000 for point in points]

    return labels, latency

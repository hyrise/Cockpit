"""Functions for metric handling."""
from json import loads
from typing import Dict, List

import matplotlib.dates as mdate


def default_function(points: List, column_name: str, parameter):
    """Doesn't change the input value."""
    sec_values = [int(point["time"] / 1_000_000_000) for point in points]
    formatted_time = mdate.epoch2num(sec_values)

    metric_values = {column_name: [point[column_name] for point in points]}

    return formatted_time, metric_values, column_name


def ns_to_ms(points: List, column_name: str, parameter):
    """Convert ns to ms."""
    sec_values = [int(point["time"] / 1_000_000_000) for point in points]
    formatted_time = mdate.epoch2num(sec_values)

    metric_values = {column_name: [point[column_name] / 1_000_000 for point in points]}

    return formatted_time, metric_values, column_name


def calculate_footprint(points: List, column_name: str, parameter):
    """Convert ns to ms."""
    sec_values = [int(point["time"] / 1_000_000_000) for point in points]
    formatted_time = mdate.epoch2num(sec_values)

    footprint_values = []
    for point in points:
        footprint = 0
        storage = loads(point["storage_meta_information"])
        for table_name in storage.keys():
            for column_name in storage[table_name]["data"].keys():
                footprint = footprint + storage[table_name]["data"][column_name]["size"]
        footprint_values.append(footprint / 1_000_000)

    metric_values = {"Total memory footprint": footprint_values}

    return formatted_time, metric_values, "Total Footprint"


def calculate_footprint_for_table(  # noqa
    points: List, metric_column_name: str, table_name
):
    """Calculate footprint for a specific table."""

    def sort_function(tuple):
        return tuple[1][0] if len(tuple[1]) > 0 else 0.0

    sec_values = [int(point["time"] / 1_000_000_000) for point in points]
    formatted_time = mdate.epoch2num(sec_values)

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
                if column_name in storage[table_name]["data"].keys():
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

    return (
        formatted_time,
        dict(footprint_items),
        f"Footprint ({table_name})",
    )


def calculate_access_frequency_for_table(  # noqa
    points: List, metric_column_name: str, table_name
):
    """Calculate access frequency for a specific table."""

    def sort_function(tuple):
        return tuple[1][0] if len(tuple[1]) > 0 else 0.0

    sec_values = [int(point["time"] / 1_000_000_000) for point in points]
    formatted_time = mdate.epoch2num(sec_values)

    available_column_names = set()

    for point in points:
        access_data = loads(point["chunks_data_meta_information"])
        if table_name in access_data.keys():
            for column_name in access_data[table_name].keys():
                available_column_names.add(column_name)

    column_accesses: Dict = {column_name: [] for column_name in available_column_names}

    for point in points:
        access_data = loads(point["chunks_data_meta_information"])
        if table_name in access_data.keys():
            for column_name in column_accesses.keys():
                if column_name in access_data[table_name].keys():
                    chunk_accesses = access_data[table_name][column_name]
                    n_accesses = 0
                    for entry in chunk_accesses:
                        n_accesses = n_accesses + entry
                    column_accesses[column_name].append(n_accesses)
                else:
                    column_accesses[column_name].append(0)
        else:
            for column_name in column_accesses.keys():
                column_accesses[column_name].append(0)

    access_items = list(column_accesses.items())
    access_items.sort(key=sort_function, reverse=True)

    return formatted_time, dict(access_items), f"Access frequency ({table_name})"


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

    return labels, latency, "Average latency of the queries"

"""Functions for metric handling."""
from json import loads
from typing import Dict, List

import matplotlib.dates as mdate


def _format_query_name(benchmark: str, query_number: str):
    """Pretty print number name."""
    benchmark_name = benchmark.split("_")[0].upper()
    scale_factor = ".".join(f"{number}" for number in benchmark.split("_")[1:])
    return f"{benchmark_name}({scale_factor})-{query_number}"


def _sort_metric_dictionary(metrics: Dict):
    """Sort metrics in the dictionary."""

    def sort_function(tuple):
        return tuple[1][0] if len(tuple[1]) > 0 else 0.0

    metric_items = list(metrics.items())
    metric_items.sort(key=sort_function, reverse=True)

    return dict(metric_items)


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


def handle_query_latency(points: List, column_name: str, parameter):
    """Convert ns to ms."""
    benchmark = parameter[0]
    query_number = parameter[1]

    label = _format_query_name(benchmark, query_number)

    sec_values = [int(point["time"] / 1_000_000_000) for point in points]
    formatted_time = mdate.epoch2num(sec_values)

    metric_values = {label: [point[column_name] / 1_000_000 for point in points]}

    return formatted_time, metric_values, f"Query latency {label}"


def calculate_footprint(points: List, column_name: str, parameter):  # noqa
    """Convert ns to ms."""
    sec_values = [int(point["time"] / 1_000_000_000) for point in points]
    formatted_time = mdate.epoch2num(sec_values)

    loaded_points = [loads(point["storage_meta_information"]) for point in points]
    available_table_names = set()

    for point in loaded_points:
        for table_name in point.keys():
            available_table_names.add(table_name)

    footprint: Dict = {table_name: [] for table_name in available_table_names}
    total_footprint = []

    for point in loaded_points:
        current_total_footprint = 0.0
        for table_name in footprint.keys():
            table_footprint = 0.0
            if table_name in point.keys():
                for column_name in point[table_name]["data"].keys():
                    table_footprint = (
                        table_footprint + point[table_name]["data"][column_name]["size"]
                    )
            footprint[table_name].append(table_footprint / 1_000_000)
            current_total_footprint = (
                current_total_footprint + table_footprint / 1_000_000
            )
        total_footprint.append(current_total_footprint)

    footprint["total"] = total_footprint

    return formatted_time, _sort_metric_dictionary(footprint), "Footprint of tables"


def calculate_footprint_for_table(  # noqa
    points: List, metric_column_name: str, table_name
):
    """Calculate footprint for a specific table."""

    def sort_function(tuple):
        return tuple[1][0] if len(tuple[1]) > 0 else 0.0

    sec_values = [int(point["time"] / 1_000_000_000) for point in points]
    formatted_time = mdate.epoch2num(sec_values)

    available_column_names = set()
    for point in points:
        storage = loads(point["storage_meta_information"])
        if table_name in storage.keys():
            for column_name in storage[table_name]["data"].keys():
                available_column_names.add(column_name)

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
        formatted_query_name = _format_query_name(
            point["benchmark"], point["query_number"]
        )
        labels.append(formatted_query_name)

    latency = [point["latency"] / 1_000_000 for point in points]

    return labels, latency, "Average latency of the queries"

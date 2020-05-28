"""Functions for metric handling."""
from datetime import datetime
from json import loads
from typing import Dict, List

from numpy import mean


def _format_query_name(benchmark: str, query_number: str):
    """Pretty print number name."""
    benchmark_name = benchmark.split("_")[0].upper()
    scale_factor = ".".join(f"{number}" for number in benchmark.split("_")[1:])
    return f"{benchmark_name}({scale_factor})-{query_number}"


def _sort_metric_dictionary(metrics: Dict):
    """Sort metrics in the dictionary."""

    def sort_function(tuple):
        return mean(tuple[1]) if len(tuple[1]) > 0 else 0.0

    metric_items = list(metrics.items())
    metric_items.sort(key=sort_function, reverse=True)

    return dict(metric_items)


def default_function(points: List, column_name: str, parameter):
    """Doesn't change the input value."""
    formatted_time = [
        datetime.fromtimestamp(point["time"] / 1_000_000_000) for point in points
    ]
    metric_values = {column_name: [point[column_name] for point in points]}

    return formatted_time, metric_values


def ns_to_ms(points: List, column_name: str, parameter):
    """Convert ns to ms."""
    formatted_time = [
        datetime.fromtimestamp(point["time"] / 1_000_000_000) for point in points
    ]
    metric_values = {column_name: [point[column_name] / 1_000_000 for point in points]}

    return formatted_time, metric_values


def handle_query_latency(points: List, column_name: str, parameter):
    """Convert ns to ms."""
    benchmark = parameter[0]
    query_number = parameter[1]

    label = _format_query_name(benchmark, query_number)
    formatted_time = [
        datetime.fromtimestamp(point["time"] / 1_000_000_000) for point in points
    ]
    metric_values = {label: [point[column_name] / 1_000_000 for point in points]}

    return formatted_time, metric_values


def calculate_footprint(points: List, column_name: str, parameter):  # noqa
    """Convert ns to ms."""
    formatted_time = [
        datetime.fromtimestamp(point["time"] / 1_000_000_000) for point in points
    ]
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

    return formatted_time, _sort_metric_dictionary(footprint)


def calculate_footprint_for_table(  # noqa
    points: List, metric_column_name: str, table_name
):
    """Calculate footprint for a specific table."""
    formatted_time = [
        datetime.fromtimestamp(point["time"] / 1_000_000_000) for point in points
    ]
    loaded_points = [loads(point["storage_meta_information"]) for point in points]
    available_column_names = set()

    for point in loaded_points:
        if table_name in point.keys():
            for column_name in point[table_name]["data"].keys():
                available_column_names.add(column_name)

    column_footprints: Dict = {
        column_name: [] for column_name in available_column_names
    }

    for point in loaded_points:
        if table_name in point.keys():
            for column_name in column_footprints.keys():
                if column_name in point[table_name]["data"].keys():
                    column_footprints[column_name].append(
                        point[table_name]["data"][column_name]["size"] / 1_000_000
                    )
                else:
                    column_footprints[column_name].append(0.0)
        else:
            for column_name in column_footprints.keys():
                column_footprints[column_name].append(0.0)

    return (formatted_time, _sort_metric_dictionary(column_footprints))


def calculate_access_frequency(  # noqa
    points: List, metric_column_name: str, table_name
):
    """Calculate access frequency for a specific table."""
    formatted_time = [
        datetime.fromtimestamp(point["time"] / 1_000_000_000) for point in points
    ]

    loaded_points = [loads(point["chunks_data_meta_information"]) for point in points]
    available_table_names = set()

    for point in loaded_points:
        for table_name in point.keys():
            available_table_names.add(table_name)

    table_accesses: Dict = {table_name: [] for table_name in available_table_names}

    for point in loaded_points:
        for table_name in table_accesses.keys():
            if table_name in point.keys():
                table_accesses[table_name].append(
                    sum(
                        (
                            sum(point[table_name][column_name])
                            for column_name in point[table_name].keys()
                        )
                    )
                )

            else:
                table_accesses[table_name].append(0)

    return (formatted_time, _sort_metric_dictionary(table_accesses))


def calculate_access_frequency_for_table(  # noqa
    points: List, metric_column_name: str, table_name
):
    """Calculate access frequency for a specific table."""
    formatted_time = [
        datetime.fromtimestamp(point["time"] / 1_000_000_000) for point in points
    ]

    loaded_points = [loads(point["chunks_data_meta_information"]) for point in points]
    available_column_names = set()

    for point in loaded_points:
        if table_name in point.keys():
            for column_name in point[table_name].keys():
                available_column_names.add(column_name)

    column_accesses: Dict = {column_name: [] for column_name in available_column_names}

    for point in loaded_points:
        if table_name in point.keys():
            for column_name in column_accesses.keys():
                if column_name in point[table_name].keys():
                    chunk_accesses = point[table_name][column_name]
                    n_accesses = 0
                    for entry in chunk_accesses:
                        n_accesses = n_accesses + entry
                    column_accesses[column_name].append(n_accesses)
                else:
                    column_accesses[column_name].append(0)
        else:
            for column_name in column_accesses.keys():
                column_accesses[column_name].append(0)

    return (formatted_time, _sort_metric_dictionary(column_accesses))


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

    return labels, latency


def handle_plugin_log(plugin_logs: List):
    """Handle plugin log."""
    return [
        {
            "id": index + 1,
            "timestamp": datetime.fromtimestamp(int(plugin_log["timestamp"]) / 1_000),
            "reporter": plugin_log["reporter"],
            "message": plugin_log["message"],
            "level": plugin_log["level"],
        }
        for index, plugin_log in enumerate(plugin_logs)
    ]

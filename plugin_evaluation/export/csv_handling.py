"""Module for CSV export."""
import csv
from typing import Dict, List


def write_to_csv(
    x_values: List, y_values: Dict, path: str, title: str, x_label: str
) -> None:
    """Write metrics to the CSV format."""
    metrics = {}
    metrics[x_label] = x_values
    for metric in y_values.keys():
        metrics[metric] = y_values[metric]

    with open(f"{path}{title}.csv", mode="w") as file:
        csv_writer = csv.writer(
            file, delimiter="|", quotechar='"', quoting=csv.QUOTE_MINIMAL
        )
        csv_writer.writerow(list(metrics.keys()))

        if len(list(metrics.values())[0]) > 0:
            for i in range(len(list(metrics.values())[0])):
                csv_writer.writerow([metric[i] for metric in metrics.values()])


def write_detailed_query_information_to_csv(
    x_values, y_values, path: str, title: str, x_label: str
) -> None:
    """Write detailed query information to the CSV format."""
    with open(f"{path}{title}.csv", mode="w") as file:
        csv_writer = csv.writer(
            file, delimiter="|", quotechar='"', quoting=csv.QUOTE_MINIMAL
        )
        csv_writer.writerow(["Query", "Latency"])

        if len(y_values) > 0:
            for i in range(len(y_values)):
                csv_writer.writerow([x_values[i], y_values[i]])

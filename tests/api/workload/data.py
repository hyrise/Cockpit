"""Data for the Workload tests."""

from itertools import product
from typing import Dict, List, Tuple

from hyrisecockpit.api.app.workload.interface import (
    DetailedWorkloadInterface,
    WorkloadInterface,
)
from hyrisecockpit.api.app.workload.model import DetailedWorkload, Workload

__folder_names = ["tpch_0.1", "job"]
__frequencies = [0, 420]
__weights: Tuple[Dict[str, float], ...] = ({}, {"01": 0.0, "23c": 100.1})


def interfaces() -> List[WorkloadInterface]:
    """Return a list of WorkloadInterfaces."""
    return [
        WorkloadInterface(folder_name=folder_name, frequency=frequency,)
        for folder_name, frequency in product(__folder_names, __frequencies)
    ]


def workloads() -> List[Workload]:
    """Return a list of Workloads corresponding to the interfaces."""
    return [Workload(**interface) for interface in interfaces()]


def folder_names() -> List[str]:
    """Return a list of folder_names corresponding to the Workloads."""
    return [workload.folder_name for workload in workloads()]


def detailed_interfaces() -> List[DetailedWorkloadInterface]:
    """Return a list of DetailedWorkloadInterfaces."""
    return [
        DetailedWorkloadInterface(
            folder_name=folder_name, frequency=frequency, weights=weights,
        )
        for folder_name, frequency, weights in product(
            __folder_names, __frequencies, __weights
        )
    ]


def detailed_workloads() -> List[DetailedWorkload]:
    """Return a list of Workloads corresponding to the interfaces."""
    return [DetailedWorkload(**interface) for interface in detailed_interfaces()]

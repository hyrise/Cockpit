"""Data for the Workload tests."""

from itertools import product
from typing import Dict, List, Tuple

from hyrisecockpit.api.app.workload.interface import (
    DetailedWorkloadInterface,
    WorkloadInterface,
)
from hyrisecockpit.api.app.workload.model import DetailedWorkload, Workload

__workload_types = ["tpch", "job"]
__frequencies = [0, 420]
__scale_factors = [0.1, 1]
__weights: Tuple[Dict[str, float], ...] = ({}, {"01": 0.0, "23c": 100.1})


def interfaces() -> List[WorkloadInterface]:
    """Return a list of WorkloadInterfaces."""
    return [
        WorkloadInterface(
            workload_type=workload_type, frequency=frequency, scale_factor=scale_factor
        )
        for workload_type, frequency, scale_factor in product(
            __workload_types, __frequencies, __scale_factors
        )
    ]


def workloads() -> List[Workload]:
    """Return a list of Workloads corresponding to the interfaces."""
    return [Workload(**interface) for interface in interfaces()]


def workload_type() -> List[str]:
    """Return a list of workload types corresponding to the Workloads."""
    return [workload.workload_type for workload in workloads()]


def detailed_interfaces() -> List[DetailedWorkloadInterface]:
    """Return a list of DetailedWorkloadInterfaces."""
    return [
        DetailedWorkloadInterface(
            workload_type=workload_type,
            frequency=frequency,
            scale_factor=scale_factor,
            weights=weights,
            running=True,
        )
        for workload_type, frequency, scale_factor, weights in product(
            __workload_types, __frequencies, __scale_factors, __weights
        )
    ]


def detailed_workloads() -> List[DetailedWorkload]:
    """Return a list of Workloads corresponding to the interfaces."""
    return [DetailedWorkload(**interface) for interface in detailed_interfaces()]

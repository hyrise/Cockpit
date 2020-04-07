"""Data for the Workload tests."""

from itertools import product
from typing import List

from hyrisecockpit.api.app.workload.interface import WorkloadInterface
from hyrisecockpit.api.app.workload.model import Workload


def interfaces() -> List[WorkloadInterface]:
    """Return a list of WorkloadInterfaces."""
    return [
        WorkloadInterface(
            workload_id=f"{folder_name}@{frequency}",
            folder_name=folder_name,
            frequency=frequency,
        )
        for folder_name, frequency in product(
            {"tpch_0.1", "tpcds_1", "job", "no-ops"}, {0, 1, 100}
        )
    ]


def workloads() -> List[Workload]:
    """Return a list of Workloads corresponding to the interfaces."""
    return [Workload(**interface) for interface in interfaces()]


def workload_ids() -> List[str]:
    """Return a list of workload_ids corresponding to the Workloads."""
    return [workload.workload_id for workload in workloads()]

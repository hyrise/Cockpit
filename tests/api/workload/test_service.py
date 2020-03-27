"""Tests for the Workload controller."""

from itertools import product
from typing import List
from unittest.mock import MagicMock

from pytest import fixture, mark

from hyrisecockpit.api.app.workload.interface import WorkloadInterface
from hyrisecockpit.api.app.workload.model import Workload
from hyrisecockpit.api.app.workload.schema import WorkloadSchema
from hyrisecockpit.api.app.workload.service import WorkloadService
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import get_response


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


bad_id = "id_that_will_fail"


class TestWorkloadService:
    """Tests for the Workload controller."""

    @fixture
    def service(self) -> WorkloadService:
        """Get a WorkloadService class without IPC."""
        WorkloadService._send_message = MagicMock()
        return WorkloadService

    @mark.parametrize("expected", [interfaces(), []])
    def test_gets_all_workloads(
        self, service: WorkloadService, expected: List[WorkloadInterface]
    ):
        """A Workload service gets all workloads."""
        response = get_response(200)
        response["body"]["workloads"] = expected
        service._send_message.return_value = response
        result = service.get_all()
        service._send_message.assert_called_once_with(
            Request(header=Header(message="get all workloads"), body={})
        )
        assert expected == WorkloadSchema(many=True).dump(result)

    @mark.parametrize("interface", interfaces())
    def test_creates_a_workload(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        response = get_response(200)
        response["body"]["workload"] = interface
        service._send_message.return_value = response
        result = service.create(interface)
        service._send_message.assert_called_once_with(
            Request(header=Header(message="start workload"), body=dict(interface))
        )
        assert interface == WorkloadSchema().dump(result)

    @mark.parametrize("interface", interfaces())
    def test_creates_no_workload_if_it_already_exists(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        service._send_message.return_value = get_response(409)
        result = service.create(interface)
        service._send_message.assert_called_once_with(
            Request(header=Header(message="start workload"), body=dict(interface))
        )
        assert {} == WorkloadSchema().dump(result)

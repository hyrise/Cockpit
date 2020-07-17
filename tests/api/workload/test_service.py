"""Tests for the Workload controller."""

from typing import List, Type
from unittest.mock import MagicMock

from pytest import fixture, mark

from hyrisecockpit.api.app.workload.interface import (
    DetailedWorkloadInterface,
    WorkloadInterface,
)
from hyrisecockpit.api.app.workload.schema import DetailedWorkloadSchema, WorkloadSchema
from hyrisecockpit.api.app.workload.service import WorkloadService
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import get_response

from .data import detailed_interfaces, interfaces


class TestWorkloadService:
    """Tests for the Workload controller."""

    @fixture
    def service(self) -> Type[WorkloadService]:
        """Get a WorkloadService class without IPC."""
        WorkloadService._send_message_to_gen = MagicMock()  # type: ignore
        WorkloadService._send_message_to_dbm = MagicMock()  # type: ignore
        return WorkloadService

    @mark.parametrize("expected", [interfaces(), []])
    def test_gets_all_workloads(
        self, service: WorkloadService, expected: List[WorkloadInterface]
    ):
        """A Workload service gets all workloads."""
        response = get_response(200)
        response["body"]["workloads"] = expected
        service._send_message_to_gen.return_value = response  # type: ignore
        result = service.get_all()
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
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
        service._send_message_to_gen.return_value = response  # type: ignore

        result = service.create(interface)

        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(header=Header(message="start workload"), body=dict(interface))
        )
        assert interface == WorkloadSchema().dump(result)

    @mark.parametrize("interface", interfaces())
    def test_creates_no_workload_if_it_already_exists(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        service._send_message_to_gen.return_value = get_response(409)  # type: ignore

        result = service.create(interface)

        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(header=Header(message="start workload"), body=dict(interface))
        )
        assert result is None

    @mark.parametrize("detailed_interface", detailed_interfaces())
    def test_gets_the_correct_workload(
        self, service: WorkloadService, detailed_interface: DetailedWorkloadInterface
    ):
        """A Workload service gets all workloads."""
        response = get_response(200)
        response["body"]["workload"] = detailed_interface
        service._send_message_to_gen.return_value = response  # type: ignore
        result = service.get_by_id(detailed_interface["workload_type"])
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="get workload"),
                body={"workload_type": detailed_interface["workload_type"]},
            )
        )
        assert detailed_interface == DetailedWorkloadSchema().dump(result)

    @mark.parametrize("detailed_interface", detailed_interfaces())
    def test_gets_no_workload_if_it_cannot_be_found(
        self, service: WorkloadService, detailed_interface: DetailedWorkloadInterface
    ):
        """A Workload service gets all workloads."""
        service._send_message_to_gen.return_value = get_response(404)  # type: ignore
        result = service.get_by_id(detailed_interface["workload_type"])
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="get workload"),
                body={"workload_type": detailed_interface["workload_type"]},
            )
        )
        assert result is None

    @mark.parametrize("detailed_interface", detailed_interfaces())
    def test_deletes_the_correct_workload(
        self, service: WorkloadService, detailed_interface: DetailedWorkloadInterface
    ):
        """A Workload service gets all workloads."""
        response = get_response(200)
        response["body"]["workload"] = detailed_interface["workload_type"]
        service._send_message_to_gen.return_value = response  # type: ignore

        result = service.delete_by_id(detailed_interface["workload_type"])

        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="stop workload"),
                body={"workload_type": detailed_interface["workload_type"]},
            )
        )
        assert detailed_interface["workload_type"] == result

    @mark.parametrize("detailed_interface", detailed_interfaces())
    def test_deletes_no_workload_if_it_cannot_be_found(
        self, service: WorkloadService, detailed_interface: DetailedWorkloadInterface
    ):
        """A Workload service gets all workloads."""
        service._send_message_to_gen.return_value = get_response(404)  # type: ignore

        result = service.delete_by_id(detailed_interface["workload_type"])

        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="stop workload"),
                body={"workload_type": detailed_interface["workload_type"]},
            )
        )
        assert result is None

    @mark.parametrize("detailed_interface", detailed_interfaces())
    def test_updates_the_correct_workload(
        self, service: WorkloadService, detailed_interface: DetailedWorkloadInterface
    ):
        """A Workload service gets all workloads."""
        new_detailed_interface = DetailedWorkloadInterface(  # type: ignore
            workload_type=detailed_interface["workload_type"],
            frequency=detailed_interface["frequency"] + 1,
            scale_factor=detailed_interface["scale_factor"],
            weights={k: v + 1 for k, v in detailed_interface["weights"].items()},
        )
        response = get_response(200)
        response["body"]["workload"] = new_detailed_interface
        service._send_message_to_gen.return_value = response  # type: ignore
        result = service.update_by_id(
            detailed_interface["workload_type"], new_detailed_interface
        )
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="update workload"),
                body={
                    "workload_type": detailed_interface["workload_type"],
                    "workload": dict(new_detailed_interface),
                },
            )
        )
        assert new_detailed_interface == DetailedWorkloadSchema().dump(result)

    @mark.parametrize("detailed_interface", detailed_interfaces())
    def test_updates_no_workload_if_it_cannot_be_found(
        self, service: WorkloadService, detailed_interface: DetailedWorkloadInterface
    ):
        """A Workload service gets all workloads."""
        new_detailed_interface = DetailedWorkloadInterface(  # type: ignore
            workload_type=detailed_interface["workload_type"],
            frequency=detailed_interface["frequency"] + 1,
            scale_factor=detailed_interface["scale_factor"],
            weights={k: v + 1 for k, v in detailed_interface["weights"].items()},
        )
        service._send_message_to_gen.return_value = get_response(404)  # type: ignore
        result = service.update_by_id(
            detailed_interface["workload_type"], new_detailed_interface
        )
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="update workload"),
                body={
                    "workload_type": detailed_interface["workload_type"],
                    "workload": dict(new_detailed_interface),
                },
            )
        )
        assert result is None

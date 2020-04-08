"""Tests for the Workload controller."""

from typing import List
from unittest.mock import MagicMock

from pytest import fixture, mark

from hyrisecockpit.api.app.workload.interface import WorkloadInterface
from hyrisecockpit.api.app.workload.schema import WorkloadSchema
from hyrisecockpit.api.app.workload.service import WorkloadService
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import get_response

from .data import interfaces


class TestWorkloadService:
    """Tests for the Workload controller."""

    @fixture
    def service(self) -> WorkloadService:
        """Get a WorkloadService class without IPC."""
        WorkloadService._send_message_to_gen = MagicMock()
        WorkloadService._send_message_to_dbm = MagicMock()
        return WorkloadService

    @mark.parametrize("expected", [interfaces(), []])
    def test_gets_all_workloads(
        self, service: WorkloadService, expected: List[WorkloadInterface]
    ):
        """A Workload service gets all workloads."""
        response = get_response(200)
        response["body"]["workloads"] = expected
        service._send_message_to_gen.return_value = response
        result = service.get_all()
        service._send_message_to_gen.assert_called_once_with(
            Request(header=Header(message="get all workloads"), body={})
        )
        assert expected == WorkloadSchema(many=True).dump(result)

    @mark.parametrize("interface", interfaces())
    def test_creates_a_workload(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        service._send_message_to_dbm.return_value = get_response(200)

        response = get_response(200)
        response["body"]["workload"] = interface
        service._send_message_to_gen.return_value = response

        result = service.create(interface)

        service._send_message_to_dbm.assert_called_once_with(
            Request(header=Header(message="start worker"), body={})
        )
        service._send_message_to_gen.assert_called_once_with(
            Request(header=Header(message="start workload"), body=dict(interface))
        )
        assert interface == WorkloadSchema().dump(result)

    @mark.parametrize("interface", interfaces())
    def test_creates_no_workload_if_it_already_exists(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        service._send_message_to_dbm.return_value = get_response(200)

        service._send_message_to_gen.return_value = get_response(409)

        result = service.create(interface)

        service._send_message_to_dbm.assert_called_once_with(
            Request(header=Header(message="start worker"), body={})
        )
        service._send_message_to_gen.assert_called_once_with(
            Request(header=Header(message="start workload"), body=dict(interface))
        )
        assert {} == WorkloadSchema().dump(result)

    @mark.parametrize("interface", interfaces())
    def test_gets_the_correct_workload(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        response = get_response(200)
        response["body"]["workload"] = interface
        service._send_message_to_gen.return_value = response
        result = service.get_by_id(interface["workload_id"])
        service._send_message_to_gen.assert_called_once_with(
            Request(
                header=Header(message="get workload"),
                body={"workload_id": interface["workload_id"]},
            )
        )
        assert interface == WorkloadSchema().dump(result)

    @mark.parametrize("interface", interfaces())
    def test_gets_no_workload_if_it_cannot_be_found(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        service._send_message_to_gen.return_value = get_response(404)
        result = service.get_by_id(interface["workload_id"])
        service._send_message_to_gen.assert_called_once_with(
            Request(
                header=Header(message="get workload"),
                body={"workload_id": interface["workload_id"]},
            )
        )
        assert {} == WorkloadSchema().dump(result)

    @mark.parametrize("interface", interfaces())
    def test_deletes_the_correct_workload(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        service._send_message_to_dbm.return_value = get_response(200)

        response = get_response(200)
        response["body"]["workload_id"] = interface["workload_id"]
        service._send_message_to_gen.return_value = response

        result = service.delete_by_id(interface["workload_id"])

        service._send_message_to_dbm.assert_called_once_with(
            Request(header=Header(message="close worker"), body={})
        )
        service._send_message_to_gen.assert_called_once_with(
            Request(
                header=Header(message="delete workload"),
                body={"workload_id": interface["workload_id"]},
            )
        )
        assert interface["workload_id"] == result

    @mark.parametrize("interface", interfaces())
    def test_deletes_no_workload_if_it_cannot_be_found(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        service._send_message_to_dbm.return_value = get_response(200)
        service._send_message_to_gen.return_value = get_response(404)

        result = service.delete_by_id(interface["workload_id"])

        service._send_message_to_dbm.assert_called_once_with(
            Request(header=Header(message="close worker"), body={})
        )
        service._send_message_to_gen.assert_called_once_with(
            Request(
                header=Header(message="delete workload"),
                body={"workload_id": interface["workload_id"]},
            )
        )
        assert {} == WorkloadSchema().dump(result)

    @mark.parametrize("interface", interfaces())
    def test_updates_the_correct_workload(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        new_interface = WorkloadInterface(
            workload_id=interface["workload_id"],
            folder_name=interface["folder_name"] + "F",
            frequency=interface["frequency"] + 1,
        )
        response = get_response(200)
        response["body"]["workload"] = new_interface
        service._send_message_to_gen.return_value = response
        result = service.update_by_id(interface["workload_id"], new_interface)
        service._send_message_to_gen.assert_called_once_with(
            Request(
                header=Header(message="update workload"),
                body={
                    "workload_id": interface["workload_id"],
                    "workload": dict(new_interface),
                },
            )
        )
        assert new_interface == WorkloadSchema().dump(result)

    @mark.parametrize("interface", interfaces())
    def test_updates_no_workload_if_it_cannot_be_found(
        self, service: WorkloadService, interface: WorkloadInterface
    ):
        """A Workload service gets all workloads."""
        new_interface = WorkloadInterface(
            workload_id=interface["workload_id"],
            folder_name=interface["folder_name"] + "F",
            frequency=interface["frequency"] + 1,
        )
        service._send_message_to_gen.return_value = get_response(404)
        result = service.update_by_id(interface["workload_id"], new_interface)
        service._send_message_to_gen.assert_called_once_with(
            Request(
                header=Header(message="update workload"),
                body={
                    "workload_id": interface["workload_id"],
                    "workload": dict(new_interface),
                },
            )
        )
        assert {} == WorkloadSchema().dump(result)

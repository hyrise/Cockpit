"""Tests for the Workload controller."""

from typing import Type
from unittest.mock import MagicMock

from pytest import fixture

from hyrisecockpit.api.app.workload.interface import (
    BaseWorkloadInterface,
    DetailedWorkloadInterface,
    WorkloadInterface,
)
from hyrisecockpit.api.app.workload.schema import DetailedWorkloadSchema
from hyrisecockpit.api.app.workload.service import WorkloadService
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import get_response


class TestWorkloadService:
    """Tests for the Workload controller."""

    @fixture
    def service(self) -> Type[WorkloadService]:
        """Get a WorkloadService class without IPC."""
        WorkloadService._send_message_to_gen = MagicMock()  # type: ignore
        WorkloadService._send_message_to_dbm = MagicMock()  # type: ignore
        return WorkloadService

    def test_gets_all_workloads(self, service: WorkloadService):
        """A Workload service gets all workloads."""
        detailed_workload_one = DetailedWorkloadInterface(
            workload_type="tpch",
            frequency=200,
            scale_factor=1.0,
            weights={"01": 3.0, "02": 2.0},
            running=True,
            supported_scale_factors=[0.1, 1.0],
            default_weights={"01": 1.0, "02": 1.0},
        )
        detailed_workload_two = DetailedWorkloadInterface(
            workload_type="tpcc",
            frequency=300,
            scale_factor=5.0,
            weights={"01": 1.0, "02": 2.0},
            running=True,
            supported_scale_factors=[1.0, 5.0],
            default_weights={"01": 1.0, "02": 1.0},
        )
        response = get_response(200)
        response["body"]["workloads"] = [detailed_workload_one, detailed_workload_two]
        service._send_message_to_gen.return_value = response  # type: ignore
        result = service.get_all()
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(header=Header(message="get all workloads"), body={})
        )
        assert [detailed_workload_one, detailed_workload_two] == DetailedWorkloadSchema(
            many=True
        ).dump(result)

    def test_gets_the_correct_workload(
        self, service: WorkloadService,
    ):
        """A Workload service gets all workloads."""
        workoad = WorkloadInterface(
            workload_type="tpch",
            frequency=200,
            scale_factor=1.0,
            weights={"01": 1.0, "02": 1.0},
            running=True,
        )
        response = get_response(200)
        response["body"]["workload"] = workoad
        service._send_message_to_gen.return_value = response  # type: ignore
        result = service.get_by_id(workoad["workload_type"])
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="get workload"),
                body={"workload_type": workoad["workload_type"]},
            )
        )
        assert workoad == DetailedWorkloadSchema().dump(result)

    def test_gets_no_workload_if_it_cannot_be_found(self, service: WorkloadService):
        """A Workload service gets all workloads."""
        workoad = WorkloadInterface(
            workload_type="tpch",
            frequency=200,
            scale_factor=1.0,
            weights={"01": 1.0, "02": 1.0},
            running=True,
        )
        service._send_message_to_gen.return_value = get_response(404)  # type: ignore
        result = service.get_by_id(workoad["workload_type"])
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="get workload"),
                body={"workload_type": workoad["workload_type"]},
            )
        )
        assert result is None

    def test_deletes_the_correct_workload(self, service: WorkloadService):
        """A Workload service gets all workloads."""
        response = get_response(200)
        response["body"]["workload"] = "tpch"
        service._send_message_to_gen.return_value = response  # type: ignore

        result = service.delete_by_id("tpch")

        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="stop workload"), body={"workload_type": "tpch"},
            )
        )
        assert "tpch" == result

    def test_deletes_no_workload_if_it_cannot_be_found(
        self, service: WorkloadService,
    ):
        """A Workload service gets all workloads."""
        service._send_message_to_gen.return_value = get_response(404)  # type: ignore

        result = service.delete_by_id("tpch")

        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(
                header=Header(message="stop workload"), body={"workload_type": "tpch"},
            )
        )
        assert result is None

    def test_updates_the_correct_workload(
        self, service: WorkloadService,
    ):
        """A Workload service gets all workloads."""
        base_workload = BaseWorkloadInterface(
            workload_type="tpch",
            frequency=200,
            scale_factor=1.0,
            weights={"01": 1.0, "02": 1.0},
        )
        response = get_response(200)
        response["body"]["workload"] = base_workload
        service._send_message_to_gen.return_value = response  # type: ignore
        result = service.update_by_id(base_workload)
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(header=Header(message="update workload"), body=dict(base_workload),)
        )
        assert base_workload == DetailedWorkloadSchema().dump(result)

    def test_updates_no_workload_if_it_cannot_be_found(self, service: WorkloadService):
        """A Workload service gets all workloads."""
        base_workload = BaseWorkloadInterface(
            workload_type="tpch",
            frequency=200,
            scale_factor=1.0,
            weights={"01": 1.0, "02": 1.0},
        )
        service._send_message_to_gen.return_value = get_response(404)  # type: ignore
        result = service.update_by_id(base_workload)
        service._send_message_to_gen.assert_called_once_with(  # type: ignore
            Request(header=Header(message="update workload"), body=dict(base_workload),)
        )
        assert result is None

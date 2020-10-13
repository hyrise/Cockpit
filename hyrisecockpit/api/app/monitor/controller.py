"""Controllers for monitor."""
from typing import List

from flask import request
from flask_accepts import accepts, responds
from flask_restx import Namespace, Resource

from .model import (
    FailedTasks,
    TimeInterval,
    SystemEntry,
    StorageData,
    SegmentConfigurationEntry,
    ChunksEntry,
    WorkloadStatementInformation,
    WorkloadOperatorInformation,
)

from .schema import (
    FailedTasksSchema,
    SystemEntrySchema,
    SegmentConfigurationEntrySchema,
    StorageDataSchema,
    ChunksEntrySchema,
    WorkloadStatementInformationSchema,
    WorkloadOperatorInformationSchema,
)

from .service import MonitorService

api = Namespace("Monitor", description="Monitor data.")


@api.route("/system")
class SystemController(Resource):
    @accepts(
        dict(name="startts", type=int),  # noqa
        dict(name="endts", type=int),  # noqa
        dict(name="precision", type=int),  # noqa
        api=api,
    )
    @responds(schema=SystemEntrySchema(many=True), api=api)
    def get(self) -> List[SystemEntry]:
        time_interval: TimeInterval = TimeInterval(
            startts=request.parsed_args["startts"],  # type: ignore
            endts=request.parsed_args["endts"],  # type: ignore
            precision=request.parsed_args["precision"],  # type: ignore
        )
        return MonitorService.get_system_data(time_interval)


@api.route("/storage")
class StorageController(Resource):
    @responds(schema=StorageDataSchema(many=True), api=api)
    def get(self) -> List[StorageData]:
        return MonitorService.get_storage()


@api.route("/chunks")
class ChunksController(Resource):
    @responds(schema=ChunksEntrySchema(many=True), api=api)
    def get(self) -> List[ChunksEntry]:
        return MonitorService.get_chunks()


@api.route("/failed_tasks")
class FailedTasksController(Resource):
    @responds(schema=FailedTasksSchema(many=True), api=api)
    def get(self) -> List[FailedTasks]:
        return MonitorService.get_failed_tasks()


@api.route("/segment_configuration")
class SegmentConfigurationController(Resource):
    @responds(schema=SegmentConfigurationEntrySchema(many=True), api=api)
    def get(self) -> List[SegmentConfigurationEntry]:
        return MonitorService.get_segment_configuration()


@api.route("/workload_statement_information")
class WorkloadStatementInformationController(Resource):
    @responds(schema=WorkloadStatementInformationSchema(many=True), api=api)
    def get(self) -> List[WorkloadStatementInformation]:
        return MonitorService.get_workload_statement_information()


@api.route("/workload_operator_information")
class WorkloadOperatorInformationController(Resource):
    @responds(schema=WorkloadOperatorInformationSchema(many=True), api=api)
    def get(self) -> List[WorkloadOperatorInformation]:
        return MonitorService.get_workload_operator_information()

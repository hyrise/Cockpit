"""Services for status information."""
from typing import List

from jsonschema import validate

from hyrisecockpit.api.app.connection_manager import ManagerSocket, StorageConnection
from hyrisecockpit.api.app.shared import _get_active_databases
from hyrisecockpit.message import response_schema
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .model import (
    DatabaseStatus,
    FailedQuery,
    FailedTask,
    LoadedTables,
    LoadedWorkload,
    WorkloadStatus,
)


class StatusService:
    """Services of the status information Controller."""

    @staticmethod
    def _send_message(message: Request) -> Response:
        """Send an IPC message with data to a database interface, return the response."""
        with ManagerSocket() as socket:
            response = socket.send_message(message)
        validate(instance=response, schema=response_schema)
        return response

    @classmethod
    def get_database_status(cls) -> List[DatabaseStatus]:
        """Get get status for all databases."""
        response = cls._send_message(
            Request(header=Header(message="database status"), body={})
        )
        return [
            DatabaseStatus(**interface)
            for interface in response["body"]["database_status"]
        ]

    @classmethod
    def get_workload_status(cls) -> List[WorkloadStatus]:
        """Get get status for all benchmark data."""
        response = cls._send_message(
            Request(header=Header(message="workload status"), body={})
        )
        workload_status: List[WorkloadStatus] = []
        for database in response["body"]["workload_status"]:
            loaded_workloads: List[LoadedWorkload] = [
                LoadedWorkload(**loaded_workload)
                for loaded_workload in database["loaded_workloads"]
            ]
            loaded_tables: List[LoadedTables] = [
                LoadedTables(**loaded_tables)
                for loaded_tables in database["loaded_tables"]
            ]
            workload_status.append(
                WorkloadStatus(database["id"], loaded_workloads, loaded_tables)
            )
        return workload_status

    @classmethod
    def get_failed_tasks(cls) -> List[FailedTask]:
        """Get failed task from databases."""
        results = []
        with StorageConnection() as client:
            for database in _get_active_databases():
                failed_queries = list(
                    client.query(
                        "SELECT * FROM failed_queries LIMIT 100;", database=database,
                    )["failed_queries", None]
                )
                serialized_failed_queries = [
                    FailedQuery(**query) for query in failed_queries
                ]
                results.append(
                    FailedTask(id=database, failed_queries=serialized_failed_queries)
                )
        return results

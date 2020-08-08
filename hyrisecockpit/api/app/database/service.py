"""Services used by the database controller."""
from typing import List

from jsonschema import validate

from hyrisecockpit.api.app.connection_manager import ManagerSocket
from hyrisecockpit.api.app.shared import _add_active_database, _remove_active_database
from hyrisecockpit.drivers.connector import Connector
from hyrisecockpit.message import response_schema
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import (
    DatabaseInterface,
    DetailedDatabaseInterface,
    WorkloadTablesInterface,
)
from .model import AvailableWorkloadTables, DetailedDatabase, WorkloadTables


class DatabaseService:
    """Services of the Control Controller."""

    @staticmethod
    def _send_message(message: Request) -> Response:
        """Send an IPC message with data to a database interface, return the response."""
        with ManagerSocket() as socket:
            response = socket.send_message(message)
        validate(instance=response, schema=response_schema)
        return response

    @classmethod
    def get_databases(cls) -> List[DetailedDatabase]:
        """Get all Databases.

        Returns a list of all databases with detailed information.
        """
        response = cls._send_message(
            Request(header=Header(message="get databases"), body={})
        )
        return [
            DetailedDatabase(**interface) for interface in response["body"]["databases"]
        ]

    @classmethod
    def register_database(cls, interface: DetailedDatabaseInterface) -> int:
        """Add a database to the manager."""
        response = cls._send_message(
            Request(header=Header(message="add database"), body=dict(interface))
        )
        if response["header"]["status"] == 200:
            _add_active_database(interface["id"])
        return response["header"]["status"]

    @classmethod
    def deregister_database(cls, interface: DatabaseInterface) -> int:
        """Remove database from manager."""
        response = cls._send_message(
            Request(header=Header(message="delete database"), body=dict(interface))
        )
        if response["header"]["status"] == 200:
            _remove_active_database(interface["id"])
        return response["header"]["status"]

    @classmethod
    def get_available_workload_tables(cls) -> AvailableWorkloadTables:
        """Return all available workloads."""
        drivers = Connector.get_workload_drivers()
        return AvailableWorkloadTables(
            workload_tables=[
                WorkloadTables(workload_type=workload_type, scale_factor=scale_factor)
                for workload_type, driver in drivers.items()
                for scale_factor in driver.scale_factors
            ]
        )

    @classmethod
    def load_workload_tables(cls, interface: WorkloadTablesInterface) -> int:
        """Load tables to database."""
        response = cls._send_message(
            Request(header=Header(message="load data"), body=dict(interface))
        )
        return response["header"]["status"]

    @classmethod
    def delete_workload_tables(cls, interface: WorkloadTablesInterface) -> int:
        """Delete tables to database."""
        response = cls._send_message(
            Request(header=Header(message="delete data"), body=dict(interface))
        )
        return response["header"]["status"]

    @classmethod
    def start_worker_pool(cls) -> int:
        """Start worker pool."""
        response = cls._send_message(
            Request(header=Header(message="start worker"), body={})
        )
        return response["header"]["status"]

    @classmethod
    def close_worker_pool(cls) -> int:
        """Close worker pool."""
        response = cls._send_message(
            Request(header=Header(message="close worker"), body={})
        )
        return response["header"]["status"]

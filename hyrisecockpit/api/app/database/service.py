"""Services used by the database controller."""
from typing import List

from jsonschema import validate

from hyrisecockpit.api.app.shared import _add_active_database, _remove_active_database
from hyrisecockpit.api.app.socket_manager import ManagerSocket
from hyrisecockpit.message import response_schema
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response

from .interface import (
    BenchmarkTablesInterface,
    DatabaseInterface,
    DetailedDatabaseInterface,
)
from .model import AvailableBenchmarkTables, DetailedDatabase


class DatabaseService:
    """Services of the Control Controller."""

    @staticmethod
    def _send_message(message: Request) -> Response:
        """Send an IPC message with data to a database interface, return the response."""
        with ManagerSocket() as socket:  # type: ignore
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
        _add_active_database(interface["id"])
        return response["header"]["status"]

    @classmethod
    def deregister_database(cls, interface: DatabaseInterface) -> int:
        """Remove database from manager."""
        response = cls._send_message(
            Request(header=Header(message="delete database"), body=dict(interface))
        )
        _remove_active_database(interface["id"])
        return response["header"]["status"]

    @classmethod
    def get_available_benchmark_tables(cls) -> AvailableBenchmarkTables:
        """Return all available benchmarks."""
        return AvailableBenchmarkTables(
            folder_names=["tpch_0.1", "tpch_1", "tpcds_1", "job"]
        )

    @classmethod
    def load_benchmark_tables(cls, interface: BenchmarkTablesInterface) -> int:
        """Load tables to database."""
        response = cls._send_message(
            Request(header=Header(message="load data"), body=dict(interface))
        )
        return response["header"]["status"]

    @classmethod
    def delete_benchmark_tables(cls, interface: BenchmarkTablesInterface) -> int:
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

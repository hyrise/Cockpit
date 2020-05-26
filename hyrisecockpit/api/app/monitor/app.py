"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from json import loads
from typing import Dict, List, Union

from flask import request
from flask_restx import Namespace, Resource, fields

from hyrisecockpit.api.app.connection_manager import StorageConnection
from hyrisecockpit.api.app.historical_data_handling import (
    get_historical_metric,
    get_interval_limits,
)
from hyrisecockpit.api.app.shared import (
    _get_active_databases,
    _send_message,
    db_manager_socket,
    storage_connection,
)
from hyrisecockpit.request import Header, Request
from hyrisecockpit.response import Response, get_response

api = Namespace(
    "monitor", description="Get synchronous data from multiple databases at once."
)

model_database = api.model(
    "Database",
    {
        "id": fields.String(
            title="Database ID",
            description="Used to identify a database.",
            required=True,
            example="hyrise-1",
        )
    },
)


model_system_data = api.clone(
    "System data",
    model_database,
    {
        "system_data": fields.List(
            fields.Nested(
                api.model(
                    "System data values",
                    {
                        "timestamp": fields.Integer(
                            title="Timestamp",
                            description="Timestamp in nanoseconds since epoch",
                            required=True,
                            example=1585762457000000000,
                        ),
                        "system_data": fields.Nested(
                            api.model(
                                "System data for the provided timestamp",
                                {
                                    "cpu": fields.Nested(
                                        api.model(
                                            "CPU data values",
                                            {
                                                "cpu_system_usage": fields.Float(
                                                    title="CPU system usage",
                                                    description="CPU system usage in %",
                                                    required=True,
                                                    example=0.458248466,
                                                ),
                                                "cpu_process_usage": fields.Float(
                                                    title="CPU process usage",
                                                    description="CPU process usage in %",
                                                    required=True,
                                                    example=10.8125,
                                                ),
                                                "cpu_count": fields.Integer(
                                                    title="Number CPUs",
                                                    description="Number CPUs",
                                                    required=True,
                                                    example=16,
                                                ),
                                            },
                                        )
                                    ),
                                    "memory": fields.Nested(
                                        api.model(
                                            "Main memory data",
                                            {
                                                "free": fields.Integer(
                                                    title="Free memory",
                                                    description="Number of free bytes",
                                                    required=True,
                                                    example=13030227968,
                                                ),
                                                "available": fields.Integer(
                                                    title="Available memory",
                                                    description="Number of available bytes",
                                                    required=True,
                                                    example=579780000,
                                                ),
                                                "total": fields.Integer(
                                                    title="Total memory",
                                                    description="Total number of memory bytes",
                                                    required=True,
                                                    example=33724911616,
                                                ),
                                                "percent": fields.Float(
                                                    title="Percent of available memory",
                                                    description="Percent of available memory",
                                                    required=True,
                                                    example=10.8125,
                                                ),
                                            },
                                        )
                                    ),
                                    "database_threads": fields.Integer(
                                        title="Database threads",
                                        description="Number of database threads",
                                        required=True,
                                        example=16,
                                    ),
                                },
                            )
                        ),
                    },
                )
            ),
            required=True,
        ),
    },
)

model_workload_composition = api.model(
    "Workload composition",
    {
        "SELECT": fields.Integer(
            title="SELECT queries",
            description="Number of SELECT queries of a given time interval.",
            required=True,
            example=241,
        ),
        "INSERT": fields.Integer(
            title="INSERT queries",
            description="Number of INSERT queries of a given time interval.",
            required=True,
            example=67,
        ),
        "UPDATE": fields.Integer(
            title="UPDATE queries",
            description="Number of UPDATE queries of a given time interval.",
            required=True,
            example=573,
        ),
        "DELETE": fields.Integer(
            title="DELETE queries",
            description="Number of DELETE queries of a given time interval.",
            required=True,
            example=14,
        ),
    },
)

model_krueger_data = api.clone(
    "Krüger data",
    model_database,
    {
        "executed": fields.Nested(
            model_workload_composition,
            title="Executed queries",
            description="The composition of queries successfully exectued of a given time interval.",
            required=True,
        ),
        "generated": fields.Nested(
            model_workload_composition,
            title="Generated queries",
            description="The composition of queries generated of a given time interval.",
            required=True,
        ),
    },
)

model_database_status = api.clone(
    "Database status",
    model_database,
    {
        "hyrise_active": fields.Boolean(
            title="hyrise active status",
            description="Hyrise is reachable.",
            required=True,
            example=True,
        ),
        "database_blocked_status": fields.Boolean(
            title="Database blocked status",
            description="Database blocked status of databases.",
            required=True,
            example=True,
        ),
        "worker_pool_status": fields.String(
            title="Worker pool status",
            description="Status of the worker pools of the databases.",
            required=True,
            example="running",
        ),
        "loaded_benchmarks": fields.List(
            fields.String(
                title="Benchmark",
                description="Benchmark dataset that is completely loaded.",
                required=True,
                example="tpch_1",
            ),
        ),
        "loaded_tables": fields.List(
            fields.Nested(
                api.model(
                    "Loaded tables",
                    {
                        "table_name": fields.String(
                            title="Table name",
                            description="Name of loaded table",
                            required=True,
                            example="customer",
                        ),
                        "benchmark": fields.String(
                            title="Benchmark",
                            description="Name of the benchmark",
                            required=True,
                            example="tpch_0.1",
                        ),
                    },
                )
            ),
            required=True,
        ),
    },
)


@api.route("/failed_tasks")
class FailedTasks(Resource):
    """Failed tasks information of all databases."""

    def get(self) -> List[Dict[str, Union[str, List]]]:
        """Return queue length information from database manager."""
        return [
            {
                "id": database,
                "failed_queries": list(
                    storage_connection.query(
                        "SELECT * FROM failed_queries LIMIT 100;", database=database,
                    )["failed_queries", None]
                ),
            }
            for database in _get_active_databases()
        ]


@api.route("/system")
class System(Resource):
    """System data information of all databases."""

    @api.doc(
        model=[model_system_data],
        params={
            "startts": "Start of a time interval",
            "endts": "End of a time interval",
            "precision": "Length of the aggregation interval",
        },
    )
    def get(self) -> Union[int, List]:
        """Return system data in a given time range."""
        precise_startts: int = int(request.args.get("startts"))  # type: ignore
        precise_endts: int = int(request.args.get("endts"))  # type: ignore
        precision_ns: int = int(request.args.get("precision"))  # type: ignore

        (startts, endts) = get_interval_limits(
            precise_startts, precise_endts, precision_ns
        )
        with StorageConnection() as client:
            historical_system_data: List[Dict] = get_historical_metric(
                startts,
                endts,
                precision_ns,
                "system_data",
                [
                    "cpu_count",
                    "cpu_process_usage",
                    "cpu_system_usage",
                    "database_threads",
                    "free_memory",
                    "total_memory",
                    "available_memory",
                ],
                client,
            )

        response: List[Dict] = [
            {
                "id": database_data["id"],
                "system_data": [
                    {
                        "timestamp": point["timestamp"],
                        "system_data": {
                            "cpu": {
                                "cpu_system_usage": point["cpu_system_usage"],
                                "cpu_process_usage": point["cpu_process_usage"],
                                "cpu_count": point["cpu_count"],
                            },
                            "memory": {
                                "free": point["free_memory"],
                                "available": point["available_memory"],
                                "total": point["total_memory"],
                                "percent": (
                                    point["available_memory"] / point["total_memory"]
                                )
                                if point["total_memory"] != 0.0
                                else 0.0,
                            },
                            "database_threads": point["database_threads"],
                        },
                    }
                    for point in database_data["system_data"]
                ],
            }
            for database_data in historical_system_data
        ]

        return response


@api.route("/chunks")
class Chunks(Resource):
    """Chunks data information of all databases."""

    def get(self) -> Union[int, Response]:
        """Return chunks data information for every database."""
        chunks: Dict[str, Dict] = {}
        active_databases = _get_active_databases()
        for database in active_databases:
            result = storage_connection.query(
                'SELECT LAST("chunks_data_meta_information") FROM chunks_data',
                database=database,
            )
            chunks_value = list(result["chunks_data", None])
            if len(chunks_value) > 0:
                chunks[database] = loads(chunks_value[0]["last"])
            else:
                chunks[database] = {}
        response = get_response(200)
        response["body"]["chunks_data"] = chunks
        return response


@api.route("/storage")
class Storage(Resource):
    """Storage information of all databases."""

    # @control.doc(body=[model_storage]) # noqa
    def get(self) -> Union[int, Response]:
        """Return storage metadata from database manager."""
        storage: Dict[str, Dict] = {}
        active_databases = _get_active_databases()
        for database in active_databases:
            result = storage_connection.query(
                'SELECT LAST("storage_meta_information") FROM storage',
                database=database,
            )
            storage_value = list(result["storage", None])
            if len(storage_value) > 0:
                storage[database] = loads(storage_value[0]["last"])
            else:
                storage[database] = {}
        response = get_response(200)
        response["body"]["storage"] = storage
        return response


@api.route("/krueger_data", methods=["GET"])
class KruegerData(Resource):
    """Krügergraph data for all workloads."""

    @api.doc(model=[model_krueger_data])
    def get(self) -> Union[int, List[Dict[str, Dict[str, Dict]]]]:
        """Provide mock data for a Krügergraph."""
        krueger_data: List[Dict] = []
        active_databases = _get_active_databases()
        for database in active_databases:
            result = storage_connection.query(
                'SELECT LAST("krueger_data"), * FROM krueger_data', database=database,
            )
            krueger_data_values = list(result["krueger_data", None])
            if len(krueger_data_values) > 0:
                krueger_data.append(
                    {
                        "id": database,
                        "krueger_data": loads(krueger_data_values[0]["last"]),
                    }
                )
            else:
                krueger_data.append({"id": database, "krueger_data": []})
        return krueger_data


@api.route("/status", methods=["GET"])
class ProcessTableStatus(Resource):
    """Database blocked status information of all databases."""

    @api.doc(model=[model_database_status])
    def get(self) -> List[Dict]:
        """Return status of databases."""
        return _send_message(
            db_manager_socket, Request(header=Header(message="status"), body={}),
        )["body"]["status"]


@api.route("/operator")
class OperatorData(Resource):
    """Operator information of all databases."""

    def get(self) -> List[Dict]:
        """Return operator metadata."""
        operator_data: List[Dict] = []
        active_databases = _get_active_databases()
        for database in active_databases:
            database_data: Dict = {"id": database, "operator_data": []}
            result = storage_connection.query(
                'SELECT LAST("operator_data") FROM operator_data', database=database,
            )
            operator_rows = list(result["operator_data", None])
            if len(operator_rows) > 0:
                database_data["operator_data"] = loads(operator_rows[0]["last"])
            operator_data.append(database_data)
        return operator_data

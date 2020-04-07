"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from json import loads
from time import time, time_ns
from typing import Any, Dict, List, Union

from flask_restx import Namespace, Resource, fields

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

model_throughput = api.clone(
    "Throughput",
    model_database,
    {
        "throughput": fields.Integer(
            title="Throughput",
            description="Query throughput of a given time interval.",
            required=True,
            example=7381,
        )
    },
)

model_detailed_throughput = api.clone(
    "Detailed Throughput",
    model_database,
    {
        "detailed_throughput": fields.List(
            fields.Nested(
                api.model(
                    "Throughput per query",
                    {
                        "workload_type": fields.String(
                            title="workload_type",
                            description="Type of the executed query.",
                            required=True,
                            example="tpch_0.1",
                        ),
                        "query_number": fields.Integer(
                            title="query_number",
                            description="Number of the executed query",
                            required=True,
                            example=5,
                        ),
                        "throughput": fields.Integer(
                            title="throughput",
                            description="Number of successfully executed queries in given time interval.",
                            required=True,
                            example=55,
                        ),
                    },
                )
            ),
            required=True,
        )
    },
)

model_query_information = api.clone(
    "Detailed Throughput and Latency",
    model_database,
    {
        "detailed_query_information": fields.List(
            fields.Nested(
                api.model(
                    "Throughput and latency per query",
                    {
                        "workload_type": fields.String(
                            title="workload_type",
                            description="Type of the executed query.",
                            required=True,
                            example="tpch_0.1",
                        ),
                        "query_number": fields.Integer(
                            title="query_number",
                            description="Number of the executed query",
                            required=True,
                            example=5,
                        ),
                        "throughput": fields.Integer(
                            title="throughput",
                            description="Number of successfully executed queries in given time interval.",
                            required=True,
                            example=55,
                        ),
                        "latency": fields.Float(
                            title="Latency",
                            description="Average query latency (ns) of a given time interval.",
                            required=True,
                            example=923.263,
                        ),
                    },
                )
            ),
            required=True,
        )
    },
)

model_latency = api.clone(
    "Latency",
    model_database,
    {
        "latency": fields.Float(
            title="Latency",
            description="Average query latency (ns) of a given time interval.",
            required=True,
            example=923.263,
        )
    },
)

model_detailed_latency = api.clone(
    "Detailed Latency",
    model_database,
    {
        "detailed_latency": fields.List(
            fields.Nested(
                api.model(
                    "Latency per query",
                    {
                        "workload_type": fields.String(
                            title="workload_type",
                            description="Type of the executed query.",
                            required=True,
                            example="tpch_0.1",
                        ),
                        "query_number": fields.Integer(
                            title="query_number",
                            description="Number of the executed query",
                            required=True,
                            example=5,
                        ),
                        "latency": fields.Integer(
                            title="latency",
                            description="Time passed between starting to execute a query and receiving the result.",
                            required=True,
                            example=98634929882,
                        ),
                    },
                )
            ),
            required=True,
        )
    },
)

model_queue_length = api.clone(
    "Queue length",
    model_database,
    {
        "queue_length": fields.Integer(
            title="Queue length",
            description="Query queue length of a database at a given point in time.",
            required=True,
            example=18623,
        )
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


@api.route("/throughput")
class Throughput(Resource):
    """Throughput information of all databases."""

    @api.doc(model=[model_throughput])
    def get(self) -> Union[int, Response]:
        """Return throughput information from the stored queries."""
        offset_seconds = 3
        offsetts = (int(time()) - offset_seconds) * 1_000_000_000

        throughput: Dict[str, int] = {}
        active_databases = _get_active_databases()
        for database in active_databases:
            result = storage_connection.query(
                "SELECT * FROM throughput WHERE time = $offsetts;",
                database=database,
                bind_params={"offsetts": offsetts},
            )
            throughput_value = list(result["throughput", None])
            if len(throughput_value) > 0:
                throughput[database] = list(result["throughput", None])[0]["throughput"]
            else:
                throughput[database] = 0
        response = get_response(200)
        response["body"]["throughput"] = throughput
        return response


@api.route("/detailed_throughput")
class DetailedThroughput(Resource):
    """Detailed throughput information of all databases."""

    @api.doc(model=[model_detailed_throughput])
    def get(self) -> Union[int, List[Dict[str, Any]]]:
        """Return detailed throughput information from the stored queries."""
        currentts = time_ns()
        startts = currentts - 2_000_000_000
        endts = currentts - 1_000_000_000
        active_databases = _get_active_databases()
        response: List[Dict] = []
        for database in active_databases:
            result = storage_connection.query(
                'SELECT COUNT("latency") FROM successful_queries WHERE time > $startts AND time <= $endts GROUP BY benchmark, query_no;',
                database=database,
                bind_params={"startts": startts, "endts": endts},
            )
            throughput: List[Dict[str, int]] = [
                {
                    "benchmark": tags["benchmark"],
                    "query_number": tags["query_no"],
                    "throughput": list(result[table, tags])[0]["count"],
                }
                for table, tags in list(result.keys())
            ]
            response.append({"id": database, "detailed_throughput": throughput})
        return response


@api.route("/detailed_latency")
class DetailedLatency(Resource):
    """Detailed throughput information of all databases."""

    @api.doc(model=[model_detailed_latency])
    def get(self) -> Union[int, List[Dict[str, Any]]]:
        """Return detailed throughput information from the stored queries."""
        currentts = time_ns()
        startts = currentts - 2_000_000_000
        endts = currentts - 1_000_000_000
        active_databases = _get_active_databases()
        response: List[Dict] = []
        for database in active_databases:
            result = storage_connection.query(
                'SELECT MEAN("latency") as "latency" FROM successful_queries WHERE time > $startts AND time <= $endts GROUP BY benchmark, query_no;',
                database=database,
                bind_params={"startts": startts, "endts": endts},
            )
            latency: List[Dict[str, int]] = [
                {
                    "benchmark": tags["benchmark"],
                    "query_number": tags["query_no"],
                    "latency": list(result[table, tags])[0]["latency"],
                }
                for table, tags in list(result.keys())
            ]
            response.append({"id": database, "detailed_latency": latency})
        return response


@api.route("/latency")
class Latency(Resource):
    """Latency information of all databases."""

    @api.doc(model=[model_latency])
    def get(self) -> Union[int, Response]:
        """Return latency information from the stored queries."""
        offset_seconds = 3
        offsetts = (int(time()) - offset_seconds) * 1_000_000_000
        latency: Dict[str, float] = {}
        active_databases = _get_active_databases()
        for database in active_databases:
            result = storage_connection.query(
                "SELECT * FROM latency WHERE time = $offsetts;",
                database=database,
                bind_params={"offsetts": offsetts},
            )
            latency_value = list(result["latency", None])
            if len(latency_value) > 0:
                latency[database] = list(result["latency", None])[0]["latency"]
            else:
                latency[database] = 0
        response = get_response(200)
        response["body"]["latency"] = latency
        return response


@api.route("/detailed_query_information")
class DetailedQueryInformation(Resource):
    """Detailed throughput and latency information of all databases."""

    @api.doc(model=[model_query_information])
    def get(self) -> Union[int, List[Dict[str, Any]]]:
        """Return detailed throughput and latency information from the stored queries."""
        currentts = time_ns()
        startts = currentts - 2_000_000_000
        endts = currentts - 1_000_000_000
        active_databases = _get_active_databases()
        response: List[Dict] = []
        for database in active_databases:
            result = storage_connection.query(
                'SELECT COUNT("latency") as "throughput", MEAN("latency") as "latency" FROM successful_queries WHERE time > $startts AND time <= $endts GROUP BY benchmark, query_no;',
                database=database,
                bind_params={"startts": startts, "endts": endts},
            )
            query_information: List[Dict[str, int]] = [
                {
                    "benchmark": tags["benchmark"],
                    "query_number": tags["query_no"],
                    "throughput": list(result[table, tags])[0]["throughput"],
                    "latency": list(result[table, tags])[0]["latency"],
                }
                for table, tags in list(result.keys())
            ]
            response.append({"id": database, "query_information": query_information})

        return response


@api.route("/queue_length")
class QueueLength(Resource):
    """Queue length information of all databases."""

    @api.doc(model=[model_queue_length])
    def get(self) -> Response:
        """Return queue length information from database manager."""
        return _send_message(
            db_manager_socket, {"header": {"message": "queue length"}, "body": {}}
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

    def get(self) -> Union[int, Response]:
        """Return cpu and memory information for every database and the number of thread it is using from database manager."""
        system: Dict[str, Dict] = {}
        active_databases = _get_active_databases()
        for database in active_databases:
            result = storage_connection.query(
                "SELECT LAST(cpu_count) as cpu_count, * FROM system_data;",
                database=database,
            )
            system_values = list(result["system_data", None])
            if len(system_values) > 0:
                system_value: Dict[str, Union[int, float]] = system_values[0]
                system[database] = {
                    "cpu": {
                        "cpu_system_usage": system_value["cpu_system_usage"],
                        "cpu_process_usage": system_value["cpu_process_usage"],
                        "cpu_count": system_value["cpu_count"],
                        "cpu_clock_speed": system_value["cpu_clock_speed"],
                    },
                    "memory": {
                        "free": system_value["free_memory"],
                        "used": system_value["used_memory"],
                        "total": system_value["total_memory"],
                    },
                    "database_threads": system_value["database_threads"],
                }
            else:
                system[database] = {}
        response = get_response(200)
        response["body"]["system_data"] = system
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
                'SELECT LAST("executed"), * FROM krueger_data', database=database,
            )
            krueger_data_value = list(result["krueger_data", None])
            if len(krueger_data_value) > 0:
                krueger_data.append(
                    {
                        "id": database,
                        "executed": loads(krueger_data_value[0]["executed"]),
                        "generated": loads(krueger_data_value[0]["generated"]),
                    }
                )
            else:
                krueger_data.append({"id": database, "executed": {}, "generated": {}})
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

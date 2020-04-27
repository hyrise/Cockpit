"""Module for monitoring a database interface.

Includes routes for throughput, storage_data, and runtime_information.
If run as a module, a flask server application will be started.
"""

from json import loads
from time import time_ns
from typing import Any, Dict, List, Tuple, Union

from flask import request
from flask_restx import Namespace, Resource, fields
from iso8601 import parse_date

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
        "throughput": fields.List(
            fields.Nested(
                api.model(
                    "Throughput values",
                    {
                        "timestamp": fields.Integer(
                            title="Timestamp",
                            description="Timestamp in nanoseconds since epoch",
                            required=True,
                            example=1585762457000000000,
                        ),
                        "throughput": fields.Integer(
                            title="Throughput",
                            description="Throughput value",
                            required=True,
                            example=273,
                        ),
                    },
                )
            ),
            required=True,
        ),
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
        "latency": fields.List(
            fields.Nested(
                api.model(
                    "Latency values",
                    {
                        "timestamp": fields.Integer(
                            title="Timestamp",
                            description="Timestamp in nanoseconds since epoch",
                            required=True,
                            example=1585762457000000000,
                        ),
                        "latency": fields.Float(
                            title="Latency",
                            description="Average latency value in nanoseconds",
                            required=True,
                            example=66064020.96710526,
                        ),
                    },
                )
            ),
            required=True,
        ),
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
        "queue_length": fields.List(
            fields.Nested(
                api.model(
                    "Queue_length values",
                    {
                        "timestamp": fields.Integer(
                            title="Timestamp",
                            description="Timestamp in nanoseconds since epoch",
                            required=True,
                            example=1585762457000000000,
                        ),
                        "queue_length": fields.Integer(
                            title="Queue length",
                            description="Queue_length",
                            required=True,
                            example=450,
                        ),
                    },
                )
            ),
            required=True,
        ),
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
                                                "cpu_clock_speed": fields.Integer(
                                                    title="CPU clock speed",
                                                    description="CPU frequency",
                                                    required=True,
                                                    example=2600,
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
                                                "used": fields.Integer(
                                                    title="Used memory",
                                                    description="Number of used bytes",
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
                                                    title="Percent of used memory",
                                                    description="Percent of used memory",
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


def get_historical_data(
    startts: int,
    endts: int,
    precision_ns: int,
    table: str,
    metrics: List[str],
    database: str,
) -> List[Dict[str, Union[int, float]]]:
    """Retrieve historical data for provided metrics and precision."""
    select_clause = ",".join(f" mean({metric}) as {metric}" for metric in metrics)
    subquery = f"""SELECT {select_clause}
        FROM {table}
        WHERE time >=  $startts AND
        time < $endts
        GROUP BY TIME(1s)
        FILL(0.0)"""  # fill empty 1s-slots with 0

    query = f"""SELECT {select_clause}
        FROM ({subquery})
        WHERE time >= $startts AND time < $endts
        GROUP BY TIME({precision_ns}ns)
        FILL(0.0);"""  # do aggregation over time intervals of the precision_ns length

    points = storage_connection.query(
        query,
        database=database,
        bind_params={"startts": startts, "endts": endts},
        epoch=True,
    )
    return list(points[table, None])


def fill_missing_points(
    startts: int, endts: int, step: int, metric: str, points: List[Dict]
) -> List[Dict]:
    """Fill missing points with zero."""
    result: List[Dict[str, float]] = []
    for timestamp in range(startts, endts, step):
        metric_value = 0.0
        for point in points:
            if point["time"] == timestamp:
                metric_value = point[metric]
                break
        result.append({"timestamp": timestamp, metric: metric_value})
    return result


def get_interval_limits(
    precise_startts: int, precise_endts: int, precision_ns: int
) -> Tuple[int, int]:
    """Get interval limits for historical data."""
    startts_rounded: int = int(precise_startts / precision_ns) * precision_ns
    endts_rounded: int = int(precise_endts / precision_ns) * precision_ns

    startts: int = startts_rounded if precise_startts % precision_ns == 0 else startts_rounded + precision_ns
    endts: int = endts_rounded if precise_endts % precision_ns == 0 else endts_rounded + 1

    return startts, endts


def get_historical_metric(
    startts: int, endts: int, precision_ns: int, table_name: str, metrics: List
) -> List[Dict[str, Union[str, List]]]:
    """Get historical metric data for all databases."""
    result: List = []
    for database in _get_active_databases():
        metric_points: List[Dict[str, Union[int, float]]] = get_historical_data(
            startts, endts, precision_ns, table_name, metrics, database
        )
        metric: List[Dict[str, float]] = fill_missing_points(
            startts, endts, precision_ns, table_name, metric_points
        )
        database_data: Dict[str, Union[str, List]] = {
            "id": database,
            table_name: metric,
        }
        result.append(database_data)
    return result


@api.route("/throughput")
class Throughput(Resource):
    """Throughput information of all databases."""

    @api.doc(
        model=[model_throughput],
        params={
            "startts": "Start of a time interval",
            "endts": "End of a time interval",
            "precision": "Length of the aggregation interval",
        },
    )
    def get(self) -> Union[int, List]:
        """Return throughput information in a given time range."""
        precise_startts: int = int(request.args.get("startts"))  # type: ignore
        precise_endts: int = int(request.args.get("endts"))  # type: ignore
        precision_ns: int = int(request.args.get("precision"))  # type: ignore

        (startts, endts) = get_interval_limits(
            precise_startts, precise_endts, precision_ns
        )
        response: List[Dict[str, Union[str, List]]] = get_historical_metric(
            startts, endts, precision_ns, "throughput", ["throughput"]
        )

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

    @api.doc(
        model=[model_latency],
        params={
            "startts": "Start of a time interval",
            "endts": "End of a time interval",
            "precision": "Length of the aggregation interval",
        },
    )
    def get(self) -> Union[int, List]:
        """Return latency information in a given time range."""
        precise_startts: int = int(request.args.get("startts"))  # type: ignore
        precise_endts: int = int(request.args.get("endts"))  # type: ignore
        precision_ns: int = int(request.args.get("precision"))  # type: ignore

        (startts, endts) = get_interval_limits(
            precise_startts, precise_endts, precision_ns
        )
        response: List[Dict[str, Union[str, List]]] = get_historical_metric(
            startts, endts, precision_ns, "latency", ["latency"]
        )

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

    @api.doc(
        model=[model_queue_length],
        params={
            "startts": "Start of a time interval",
            "endts": "End of a time interval",
            "precision": "Length of the aggregation interval",
        },
    )
    def get(self) -> Union[int, List]:
        """Return queue length information in a given time range."""
        precise_startts: int = int(request.args.get("startts"))  # type: ignore
        precise_endts: int = int(request.args.get("endts"))  # type: ignore
        precision_ns: int = int(request.args.get("precision"))  # type: ignore

        (startts, endts) = get_interval_limits(
            precise_startts, precise_endts, precision_ns
        )
        response: List[Dict[str, Union[str, List]]] = get_historical_metric(
            startts, endts, precision_ns, "queue_length", ["queue_length"]
        )

        return response


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
        },
    )
    def get(self) -> Union[int, List]:
        """Return cpu and memory information for every database and the number of threads it is using from database manager."""
        startts: int = int(request.args.get("startts"))  # type: ignore
        endts: int = int(request.args.get("endts"))  # type: ignore

        response: List = []
        for database in _get_active_databases():
            database_data: Dict[str, Union[str, List]] = {
                "id": database,
            }

            result = storage_connection.query(
                "SELECT * FROM system_data WHERE time >= $startts AND time < $endts;",
                database=database,
                bind_params={"startts": startts, "endts": endts},
            )
            system_data_rows: List = list(result["system_data", None])
            system_data: List[Dict[str, Union[int, Dict]]] = [
                {
                    "timestamp": int(parse_date(row["time"]).timestamp() * 1e9),
                    "system_data": {
                        "cpu": {
                            "cpu_system_usage": row["cpu_system_usage"],
                            "cpu_process_usage": row["cpu_process_usage"],
                            "cpu_count": row["cpu_count"],
                            "cpu_clock_speed": row["cpu_clock_speed"],
                        },
                        "memory": {
                            "free": row["free_memory"],
                            "used": row["used_memory"],
                            "total": row["total_memory"],
                            "percent": row["used_memory"] / row["total_memory"],
                        },
                        "database_threads": row["database_threads"],
                    },
                }
                for row in system_data_rows
            ]
            database_data["system_data"] = system_data
            response.append(database_data)
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

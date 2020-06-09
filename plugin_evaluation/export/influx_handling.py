"""Module for Influx calls."""
from typing import Dict, List

from influxdb import InfluxDBClient

from plugin_evaluation.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)


def get_metric_data_with_fill(
    table_name: str,
    column_name: str,
    database: str,
    startts: int,
    endts: int,
    parameter=None,
):
    """Get metric data for provided time range, fill with 0 if points missed."""
    query: str = f"""SELECT MEAN({column_name}) AS {column_name}
        FROM {table_name}
        WHERE time >= $startts
        AND time < $endts
        GROUP BY TIME(5s)
        FILL(0.0)"""

    client = InfluxDBClient(STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD)
    result = client.query(
        query,
        database=database,
        bind_params={"startts": startts, "endts": endts},
        epoch=True,
    )
    client.close()

    output = [
        point
        for point in list(result[table_name, None])
        if point[column_name] is not None
    ]

    return output


def get_metric_data(
    table_name: str,
    column_name: str,
    database: str,
    startts: int,
    endts: int,
    parameter=None,
):
    """Get metric data for provided time range."""
    query: str = f"""SELECT {column_name}
        FROM {table_name}
        WHERE time >= $startts
        AND time < $endts"""

    client = InfluxDBClient(STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD)
    result = client.query(
        query,
        database=database,
        bind_params={"startts": startts, "endts": endts},
        epoch=True,
    )
    client.close()

    return list(result[table_name, None])


def get_ram_usage(
    table_name: str,
    column_name: str,
    database: str,
    startts: int,
    endts: int,
    parameter=None,
):
    """Get metric data for provided time range."""
    query: str = """SELECT MEAN(total_memory) - MEAN(available_memory) AS used_memory
        FROM system_data
        WHERE time >= $startts
        AND time < $endts
        GROUP BY TIME(5s)"""

    client = InfluxDBClient(STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD)
    result = client.query(
        query,
        database=database,
        bind_params={"startts": startts, "endts": endts},
        epoch=True,
    )
    client.close()

    output = [
        point
        for point in list(result[table_name, None])
        if point["used_memory"] is not None
    ]

    return output


def get_detailed_latency_information(
    table_name: str,
    column_name: str,
    database: str,
    startts: int,
    endts: int,
    parameter=None,
):
    """Get metric data for provided time range."""
    query: str = """SELECT MEAN("latency") AS "latency"
    FROM successful_queries
    WHERE time > $startts
    AND time <= $endts
    GROUP BY benchmark, query_no;"""

    client = InfluxDBClient(STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD)
    result = client.query(
        query,
        database=database,
        bind_params={"startts": startts, "endts": endts},
        epoch=True,
    )
    client.close()

    detailed_latency: List[Dict[str, int]] = [
        {
            "benchmark": tags["benchmark"],
            "query_number": tags["query_no"],
            "latency": list(result[table, tags])[0]["latency"],
        }
        for table, tags in list(result.keys())
    ]
    return detailed_latency


def get_query_latency(
    table_name: str,
    column_name: str,
    database: str,
    startts: int,
    endts: int,
    parameter,
):
    """Get latency of the provided query."""
    benchmark = parameter[0]
    query_number = parameter[1]

    query: str = f"""SELECT MEAN("latency") AS "query_latency"
        FROM successful_queries
        WHERE time > $startts
        AND time <= $endts
        AND benchmark = '{benchmark}'
        AND query_no = '{query_number}'
        GROUP BY time(5s);"""

    client = InfluxDBClient(STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD)
    result = client.query(
        query,
        database=database,
        bind_params={"startts": startts, "endts": endts},
        epoch=True,
    )
    client.close()

    points = list(result[table_name, None])

    return [point for point in points if point["query_latency"] is not None]


def get_plugin_log(
    database: str, startts: int, endts: int,
):
    """Get plugin log (startts and endts are in ns)."""
    query: str = """SELECT *
        FROM plugin_log
        WHERE time > $startts
        AND time <= $endts;"""

    client = InfluxDBClient(STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD)
    result = client.query(
        query,
        database=database,
        bind_params={"startts": startts / 1_000_000, "endts": endts / 1_000_000},
        epoch=True,
    )
    client.close()

    points = list(result["plugin_log", None])

    return points

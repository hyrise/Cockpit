"""Module for Influx calls."""
from influxdb import InfluxDBClient

from plugin_evaluation.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)


def get_metric_data_with_fill(
    table_name: str, metric: str, database: str, startts: int, endts: int
):
    """Get metric data for provided time range, fill with 0 if points missed."""
    query: str = f"""SELECT MEAN({metric}) AS {metric}
        FROM {table_name}
        WHERE time >= $startts
        AND time < $endts
        GROUP BY TIME(1s)
        FILL(0.0)"""

    client = InfluxDBClient(STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD)
    result = client.query(
        query,
        database=database,
        bind_params={"startts": startts, "endts": endts},
        epoch=True,
    )
    client.close()

    return list(result[table_name, None])


def get_metric_data(
    table_name: str, metric: str, database: str, startts: int, endts: int
):
    """Get metric data for provided time range."""
    query: str = f"""SELECT {metric}
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

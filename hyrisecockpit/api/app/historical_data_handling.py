"""Module for retrieving of the historical data."""
from typing import Dict, List, Tuple, Union

from influxdb import InfluxDBClient

from .shared import _get_active_databases


def _get_historical_data(
    startts: int,
    endts: int,
    precision_ns: int,
    table: str,
    metrics: List[str],
    database: str,
    client: InfluxDBClient,
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

    points = client.query(
        query,
        database=database,
        bind_params={"startts": startts, "endts": endts},
        epoch=True,
    )
    return list(points[table, None])


def _fill_missing_points(
    startts: int,
    endts: int,
    precision: int,
    table_name: str,
    metrics: List[str],
    points: List[Dict],
) -> List[Dict]:
    """Fill missing points with zero."""
    result: List[Dict[str, Union[int, float]]] = []
    index: int = 0

    for timestamp in range(startts, endts, precision):
        point: Dict = {"timestamp": timestamp}
        if index < len(points) and points[index]["time"] == timestamp:
            for metric in metrics:
                point[metric] = points[index][metric]
            index = index + 1
        else:
            for metric in metrics:
                point[metric] = 0.0
        result.append(point)

    return result


def get_interval_limits(
    precise_startts: int, precise_endts: int, precision_ns: int
) -> Tuple[int, int]:
    """Get interval limits for historical data."""
    startts_rounded: int = int(precise_startts / precision_ns) * precision_ns
    endts_rounded: int = int(precise_endts / precision_ns) * precision_ns

    return startts_rounded, endts_rounded


def get_historical_metric(
    startts: int,
    endts: int,
    precision_ns: int,
    table_name: str,
    metrics: List,
    client: InfluxDBClient,
) -> List[Dict[str, Union[str, List]]]:
    """Get historical metric data for all databases."""
    result: List = []
    for database in _get_active_databases():
        metric_points: List[Dict[str, Union[int, float]]] = _get_historical_data(
            startts, endts, precision_ns, table_name, metrics, database, client
        )
        metric: List[Dict[str, float]] = _fill_missing_points(
            startts, endts, precision_ns, table_name, metrics, metric_points
        )
        database_data: Dict[str, Union[str, List]] = {
            "id": database,
            table_name: metric,
        }
        result.append(database_data)
    return result

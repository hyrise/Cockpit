"""Services for metrics."""
from typing import Dict, List, Union

from .interface import TimeIntervalInterface


def _get_historical_metric(**kwargs):
    return 42


def _get_interval_limits(**kwargs):
    return (1, 2)


class MetricService:
    """Services of the Control Controller."""

    @staticmethod
    def get_data(
        time_interval: TimeIntervalInterface, table_name: str, column_names: List[str]
    ):
        """Return metric information in a given time range."""
        precise_startts: int = time_interval["startts"]
        precise_endts: int = time_interval["endts"]
        precision_ns: int = time_interval["precision"]

        (startts, endts) = _get_interval_limits(  # type: ignore
            precise_startts, precise_endts, precision_ns
        )
        response: List[Dict[str, Union[str, List]]] = _get_historical_metric(  # type: ignore
            startts, endts, precision_ns, table_name, column_names
        )

        return response

    @staticmethod
    def get_throughput(time_interval: TimeIntervalInterface):
        """Get throughput data."""
        return MetricService.get_data(time_interval, "throughput", ["throughput"])

"""Services for metrics."""
from typing import Dict, List, Union

from hyrisecockpit.api.app.connection_manager import StorageConnection
from hyrisecockpit.api.app.historical_data_handling import (
    get_historical_metric,
    get_interval_limits,
)

from .interface import TimeIntervalInterface


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

        (startts, endts) = get_interval_limits(
            precise_startts, precise_endts, precision_ns
        )

        with StorageConnection() as client:
            response: List[Dict[str, Union[str, List]]] = get_historical_metric(
                startts, endts, precision_ns, table_name, column_names, client
            )

        return response

    @staticmethod
    def get_throughput(time_interval: TimeIntervalInterface):
        """Get throughput data."""
        return MetricService.get_data(time_interval, "throughput", ["throughput"])

    @staticmethod
    def get_latency(time_interval: TimeIntervalInterface):
        """Get latency data."""
        return MetricService.get_data(time_interval, "latency", ["latency"])

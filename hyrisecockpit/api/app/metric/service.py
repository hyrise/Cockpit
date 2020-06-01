"""Services for metrics."""
from time import time_ns
from typing import Dict, List, Union

from hyrisecockpit.api.app.connection_manager import StorageConnection
from hyrisecockpit.api.app.historical_data_handling import (
    get_historical_metric,
    get_interval_limits,
)
from hyrisecockpit.api.app.shared import _get_active_databases

from .model import (
    DetailedQueryEntry,
    DetailedQueryInformation,
    Latency,
    QueueLength,
    Throughput,
    TimeInterval,
)
from .schema import LatencySchema, QueueLengthSchema, ThroughputSchema


class MetricService:
    """Services of the Control Controller."""

    @staticmethod
    def get_data(
        time_interval: TimeInterval, table_name: str, column_names: List[str]
    ) -> List[Dict[str, Union[str, List]]]:
        """Return metric information in a given time range."""
        precise_startts: int = time_interval.startts
        precise_endts: int = time_interval.endts
        precision_ns: int = time_interval.precision

        (startts, endts) = get_interval_limits(
            precise_startts, precise_endts, precision_ns
        )

        with StorageConnection() as client:
            response: List[Dict[str, Union[str, List]]] = get_historical_metric(
                startts, endts, precision_ns, table_name, column_names, client
            )

        return response

    @classmethod
    def get_throughput(cls, time_interval: TimeInterval) -> List[Throughput]:
        """Get throughput data."""
        throughput_shema = ThroughputSchema()
        results = cls.get_data(time_interval, "throughput", ["throughput"])
        return [throughput_shema.load(database_results) for database_results in results]

    @classmethod
    def get_latency(cls, time_interval: TimeInterval) -> List[Latency]:
        """Get latency data."""
        latency_schema = LatencySchema()
        results = cls.get_data(time_interval, "latency", ["latency"])
        return [latency_schema.load(database_results) for database_results in results]

    @classmethod
    def get_queue_length(cls, time_interval: TimeInterval) -> List[QueueLength]:
        """Get queue length data."""
        queue_length_schema = QueueLengthSchema()
        results = cls.get_data(time_interval, "queue_length", ["queue_length"])
        return [
            queue_length_schema.load(database_results) for database_results in results
        ]

    @classmethod
    def get_detailed_query_information(cls) -> List[DetailedQueryInformation]:
        """Return detailed throughput and latency information from the stored queries."""
        currentts = time_ns()
        offset = 3_000_000_000
        interval_length = 1_000_000_000
        startts = currentts - offset - interval_length
        endts = currentts - offset
        response: List[DetailedQueryInformation] = []

        with StorageConnection() as client:
            for database in _get_active_databases():
                result = client.query(
                    'SELECT COUNT("latency") as "throughput", MEAN("latency") as "latency" FROM successful_queries WHERE time > $startts AND time <= $endts GROUP BY benchmark, query_no;',
                    database=database,
                    bind_params={"startts": startts, "endts": endts},
                )
                query_information: List[DetailedQueryEntry] = [
                    DetailedQueryEntry(
                        benchmark=tags["benchmark"],
                        query_number=tags["query_no"],
                        throughput=list(result[table, tags])[0]["throughput"],
                        latency=list(result[table, tags])[0]["latency"],
                    )
                    for table, tags in list(result.keys())
                ]
                response.append(
                    DetailedQueryInformation(
                        id=database, detailed_query_information=query_information
                    )
                )
        return response

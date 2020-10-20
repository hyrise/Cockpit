"""Service for metric namespace.

The service is responsible for interacting with the entity. This includes
fetching data from the influx or database manager. The data is then if needed
deserialized into a Python entity (model) by using the corresponding schemas.
"""
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
    NegativeThroughput,
    QueueLength,
    Throughput,
    TimeInterval,
    MemoryFootprint,
)
from .schema import (
    LatencySchema,
    NegativeThroughputSchema,
    QueueLengthSchema,
    ThroughputSchema,
    MemoryFootprintSchema,
)


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
            return get_historical_metric(
                startts, endts, precision_ns, table_name, column_names, client
            )

    @classmethod
    def get_throughput(cls, time_interval: TimeInterval) -> List[Throughput]:
        """Get throughput data."""
        throughput_shema = ThroughputSchema()
        results = cls.get_data(time_interval, "throughput", ["throughput"])
        return [throughput_shema.load(database_results) for database_results in results]

    @classmethod
    def get_negative_throughput(
        cls, time_interval: TimeInterval
    ) -> List[NegativeThroughput]:
        """Get negative throughput data."""
        negative_throughput_shema = NegativeThroughputSchema()
        results = cls.get_data(
            time_interval, "negative_throughput", ["negative_throughput"]
        )
        return [
            negative_throughput_shema.load(database_results)
            for database_results in results
        ]

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
    def get_memory_footprint(cls, time_interval: TimeInterval) -> List[MemoryFootprint]:
        databases_memory_footprints = cls.get_data(
            time_interval, "memory_footprint", ["memory_footprint"]
        )
        return [
            MemoryFootprintSchema().load(database_memory_footprint)
            for database_memory_footprint in databases_memory_footprints
        ]

    @classmethod
    def get_detailed_query_information(cls) -> List[DetailedQueryInformation]:
        """Return detailed throughput and latency information from the stored queries."""
        interval_length_sec = 5
        currentts = time_ns()
        offset = 3_000_000_000
        interval_length = interval_length_sec * 1_000_000_000
        startts = currentts - offset - interval_length
        endts = currentts - offset
        response: List[DetailedQueryInformation] = []

        with StorageConnection() as client:
            for database in _get_active_databases():
                result = client.query(
                    'SELECT COUNT("latency") as "throughput", MEAN("latency") as "latency" FROM successful_queries WHERE time > $startts AND time <= $endts GROUP BY benchmark, query_no, scalefactor;',
                    database=database,
                    bind_params={"startts": startts, "endts": endts},
                )
                query_information: List[DetailedQueryEntry] = [
                    DetailedQueryEntry(
                        benchmark=tags["benchmark"],
                        query_number=tags["query_no"],
                        throughput=list(result[table, tags])[0]["throughput"]
                        / interval_length_sec,
                        latency=list(result[table, tags])[0]["latency"],
                        scale_factor=tags["scalefactor"],
                    )
                    for table, tags in list(result.keys())
                ]
                response.append(
                    DetailedQueryInformation(
                        id=database, detailed_query_information=query_information
                    )
                )
        return response

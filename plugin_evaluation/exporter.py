"""Module for export of the Influx data to PDF."""

from influxdb import InfluxDBClient

from plugin_evaluation.settings import (
    STORAGE_HOST,
    STORAGE_PASSWORD,
    STORAGE_PORT,
    STORAGE_USER,
)


class Exporter:
    """Exports time series data to PDF."""

    def __init__(self):
        """Initialize Exporter."""
        self.client = InfluxDBClient(
            STORAGE_HOST, STORAGE_PORT, STORAGE_USER, STORAGE_PASSWORD
        )

    def get_metric_data(
        self, table_name: str, metric: str, database: str, startts: int, endts: int
    ):
        """Get metric data for provided time range."""
        result = self.client.query(
            f"SELECT {metric} FROM {table_name} WHERE time >= $startts AND time < $endts;",
            database=database,
            bind_params={"startts": startts, "endts": endts},
        )
        return list(result[table_name, None])

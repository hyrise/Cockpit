"""This job updates the segment configurations."""
from json import dumps
from time import time_ns
from typing import Dict

from pandas import DataFrame

from hyrisecockpit.database_manager.cursor import StorageConnectionFactory
from hyrisecockpit.database_manager.job.sql_to_data_frame import sql_to_data_frame


def _create_dictionary(
    segments_configuration: DataFrame, configuration_type: str
) -> Dict:  # TODO refactoring
    segment_configuration_data: Dict = {}
    grouped_tables = segments_configuration.reset_index().groupby("table_name")

    for table_name in grouped_tables.groups:
        segment_configuration_data[table_name] = {}
        table = grouped_tables.get_group(table_name)
        grouped_columns = table.reset_index().groupby("chunk_id")

        for column_name in grouped_columns.groups:
            segment_configuration_data[table_name][column_name] = {}
            column = grouped_columns.get_group(column_name)
            for _, row in column.iterrows():
                segment_configuration_data[table_name][column_name][
                    configuration_type
                ] = row[configuration_type]
    return segment_configuration_data


def update_segment_configuration(
    database_blocked,
    connection_factory,
    storage_connection_factory: StorageConnectionFactory,
) -> None:
    """Update segment configuration data for database instance."""
    time_stamp = time_ns()

    segments_encodings = sql_to_data_frame(
        database_blocked,
        connection_factory,
        """SELECT table_name, chunk_id, encoding_type FROM meta_segments;""",
        None,
    )
    segments_orders = sql_to_data_frame(
        database_blocked,
        connection_factory,
        """SELECT table_name, chunk_id, order_mode FROM meta_chunk_sort_orders;""",
        None,
    )

    segment_configuration_encoding_type = {}
    if not (segments_encodings.empty):
        segment_configuration_encoding_type = _create_dictionary(
            segments_encodings, "encoding_type"
        )

    segment_configuration_order_mode = {}
    if not segments_orders.empty:
        segment_configuration_order_mode = _create_dictionary(
            segments_orders, "order_mode"
        )

    with storage_connection_factory.create_cursor() as log:
        log.log_meta_information(
            "segment_configuration",
            {
                "segment_configuration_encoding_type": dumps(
                    segment_configuration_encoding_type
                ),
                "segment_configuration_order_mode": dumps(
                    segment_configuration_order_mode
                ),
            },
            time_stamp,
        )
